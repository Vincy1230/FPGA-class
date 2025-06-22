module pe (
	input clk, reset,
	input [6:0] pex_config,
	input [15:0] op_0, op_1, op_2,
	output reg [15:0] pe_out
);
	reg [15:0] op_lhs, op_rhs;
	wire [15:0] alu_result;
	alu alu (
		.operation(pex_config[6:4]),
		.op_lhs(op_lhs),
		.op_rhs(op_rhs),
		.result(alu_result)
	);
	always @ (posedge clk or posedge reset) begin
		if (reset) pe_out <= 0;   //???
		else pe_out <= alu_result;
	end
	always @ (pex_config or op_0 or op_1 or op_2 or pe_out) begin
		case (pex_config[1:0])
			2'b00: op_lhs <= op_0;
			2'b01: op_lhs <= op_1;
			2'b10: op_lhs <= op_2;
			2'b11: op_lhs <= pe_out;
		endcase
		case (pex_config[3:2])
			2'b00: op_rhs <= op_0;
			2'b01: op_rhs <= op_1;
			2'b10: op_rhs <= op_2;
			2'b11: op_rhs <= pe_out;
		endcase
	end
endmodule
