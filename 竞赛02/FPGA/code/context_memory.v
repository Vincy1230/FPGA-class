module context_memory (
	input clk, rd_cm_en, wr_cm_en,
	input [5:0] cm_addr,
	input [59:0] wr_cm_data,
	output reg [59:0] rd_cm_data
);
	reg [59:0] cm [63:0];
	initial begin
		$readmemb("C:\\altera\\12.0sp1\\quartus\\d15015\\cm_memory.txt", cm);
	end
	always @ (posedge clk) begin
		if (rd_cm_en) rd_cm_data <= cm[cm_addr];
		if (wr_cm_en) begin
			cm[cm_addr] <= wr_cm_data;
			$writememb("C:\\altera\\12.0sp1\\quartus\\d15015\\cm_memory.txt", cm);
		end
	end
endmodule
