module data_memory (
	input clk, rd_dm_en, wr_dm_en,
	input [5:0] dm_addr,
	input [15:0] wr_dm_data,
	output reg [15:0] rd_dm_data
);
	reg [15:0] dm [63:0];
	initial begin
		$readmemb("C:\\altera\\12.0sp1\\quartus\\d15015\\dm_memory.txt", dm);
	end
	always @ (posedge clk) begin
		if (rd_dm_en) rd_dm_data <= dm[dm_addr];
		if (wr_dm_en) begin
			dm[dm_addr] <= wr_dm_data;
			$writememb("C:\\altera\\12.0sp1\\quartus\\d15015\\dm_memory.txt", dm);
		end
	end
endmodule
