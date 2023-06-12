`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/05 23:30:24
// Design Name: 
// Module Name: alu_test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_test;
reg [2:0]operation;
reg [15:0]op_lhs;
reg [15:0]op_rhs;
wire [15:0]result;

initial begin
operation=3'b000;
op_lhs=16'd0;
op_rhs=16'd0;
#10;
operation=3'b001;
op_lhs=16'd10000;
op_rhs=16'd20000;
#10;
operation=3'b010;
op_lhs=16'd30000;
op_rhs=16'd10000;
#10;
operation=3'b011;
op_lhs=16'b0000111100001111;
op_rhs=16'b1111000011110000;
#10;
operation=3'b100;
op_lhs=16'b1111111111111111;
op_rhs=16'b1010101010101010;
#10;
operation=3'b101;
op_lhs=16'b1010101010101010;
op_rhs=16'b0101010101010101;
#10;
operation=3'b110;
op_lhs=16'd10000;
op_rhs=16'd0;
#10;
operation=3'b111;
op_lhs=16'd0;
op_rhs=16'd20000;
#10
$stop;


end
alu alu_test(
.operation(operation),
.op_lhs(op_lhs),
.op_rhs(op_rhs),
.result(result)
);

endmodule
