module alu(
	input [2:0] operation,
	input [15:0] op_lhs, op_rhs,
	output reg [15:0] result
);
	always @ (operation or op_lhs or op_rhs) begin
		case (operation)
			3'b000: result <= 16'b0;
			3'b001: result <= op_lhs + op_rhs;
			3'b010: result <= op_lhs - op_rhs;
			3'b011: result <= op_lhs & op_rhs;
			3'b100: result <= op_lhs | op_rhs;
			3'b101: result <= op_lhs ^ op_rhs;
			3'b110: result <= op_lhs;
			3'b111: result <= op_rhs;
			default: result <= 16'b0;
		endcase
	end
endmodule
