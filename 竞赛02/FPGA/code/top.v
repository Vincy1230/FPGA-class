module top (
	input clk, reset, rd_cm_en,
	input [5:0] cm_addr
);
	wire [7:0] dm0_control, dm1_control, dm2_control, dm3_control;
	wire [6:0] pe0_config, pe1_config, pe2_config, pe3_config;
	wire [15:0] pe0_out, pe1_out, pe2_out, pe3_out;
	wire [15:0] rd_dm0_data, rd_dm1_data, rd_dm2_data, rd_dm3_data;
	pe pe0 (
		.clk(clk),
		.reset(reset),
		.pex_config(pe0_config),
		.op_0(pe2_out),
		.op_1(pe1_out),
		.op_2(rd_dm0_data),
		.pe_out(pe0_out)
	);
	pe pe1 (
		.clk(clk),
		.reset(reset),
		.pex_config(pe1_config),
		.op_0(pe3_out),
		.op_1(pe0_out),
		.op_2(rd_dm1_data),
		.pe_out(pe1_out)
	);
	pe pe2 (
		.clk(clk),
		.reset(reset),
		.pex_config(pe2_config),
		.op_0(pe0_out),
		.op_1(pe3_out),
		.op_2(rd_dm2_data),
		.pe_out(pe2_out)
	);
	pe pe3 (
		.clk(clk),
		.reset(reset),
		.pex_config(pe3_config),
		.op_0(pe1_out),
		.op_1(pe2_out),
		.op_2(rd_dm3_data),
		.pe_out(pe3_out)
	);
	data_memory data_memory0 (
		.clk(clk),
		.rd_dm_en(dm0_control[0]),
		.wr_dm_en(dm0_control[1]),
		.dm_addr(dm0_control[7:2]),
		.wr_dm_data(pe0_out),
		.rd_dm_data(rd_dm0_data)
	);
	data_memory data_memory1 (
		.clk(clk),
		.rd_dm_en(dm1_control[0]),
		.wr_dm_en(dm1_control[1]),
		.dm_addr(dm1_control[7:2]),
		.wr_dm_data(pe1_out),
		.rd_dm_data(rd_dm1_data)
	);
	data_memory data_memory2 (
		.clk(clk),
		.rd_dm_en(dm2_control[0]),
		.wr_dm_en(dm2_control[1]),
		.dm_addr(dm2_control[7:2]),
		.wr_dm_data(pe2_out),
		.rd_dm_data(rd_dm2_data)
	);
	data_memory data_memory3 (
		.clk(clk),
		.rd_dm_en(dm3_control[0]),
		.wr_dm_en(dm3_control[1]),
		.dm_addr(dm3_control[7:2]),
		.wr_dm_data(pe3_out),
		.rd_dm_data(rd_dm3_data)
	);
	context_memory context_memory (
		.clk(clk),
		.rd_cm_en(rd_cm_en),
		.wr_cm_en(1'b0),
		.cm_addr(cm_addr),
		.wr_cm_data(60'b0),
		.rd_cm_data({
			dm3_control,
			dm2_control,
			dm1_control,
			dm0_control,
			pe3_config,
			pe2_config,
			pe1_config,
			pe0_config
		})
	);
endmodule
