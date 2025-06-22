`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/05 15:51:15
// Design Name: 
// Module Name: cm_test
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


module cm_test;
reg clk;
reg rd_cm_en;
reg wr_cm_en;
reg [5:0]cm_addr;
reg [59:0]wr_cm_data;
wire [59:0]rd_cm_data;

initial      clk = 1'b0 ;
parameter CLK_PERIOD = 10 ;
always #(CLK_PERIOD/2) clk = ~clk;
initial begin
#5;
rd_cm_en=1;
cm_addr='b000000;
#10;
cm_addr='b000001;
#10;
cm_addr='b000010;
#10;
cm_addr='b000011;
#10;
cm_addr='b000100;
#10;
cm_addr='b000101;
#10;
cm_addr='b000110;
#10;
cm_addr='b000111;
#10;
cm_addr='b001000;
#10;
cm_addr='b001001;
#10;
cm_addr='b001010;
#10;
cm_addr='b001011;
#10;
cm_addr='b001100;
#10;
cm_addr='b001101;
#10;
cm_addr='b001110;
#10;
cm_addr='b001111;
#10;
cm_addr='b010000;
#10;
cm_addr='b010001;
#10;
cm_addr='b010010;
#10;
cm_addr='b010011;
#10;
cm_addr='b010100;
#10;
cm_addr='b010101;
#10;
rd_cm_en=0;
wr_cm_en=1;
cm_addr='b010110;
wr_cm_data=60'd100000;
#10;
cm_addr='b010111;
wr_cm_data=60'd200000;
#30;


$stop;
end

context_memory cm_test(
.clk(clk),
.rd_cm_en(rd_cm_en),
.wr_cm_en(wr_cm_en),
.cm_addr(cm_addr),
.wr_cm_data(wr_cm_data),
.rd_cm_data(rd_cm_data)
);
endmodule
