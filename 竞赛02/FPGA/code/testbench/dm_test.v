`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/05 23:32:25
// Design Name: 
// Module Name: dm0_test
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


module dm_test;
reg clk;
reg rd_dm_en;
reg wr_dm_en;
reg [5:0]dm_addr;
reg [15:0]wr_dm_data;
wire [15:0]rd_dm_data;

initial clk = 1'b0;
parameter CLK_PERIOD = 10 ;
always #(CLK_PERIOD/2) clk = ~clk;

initial begin
#5;
rd_dm_en=1;
dm_addr=4'd0;
#10;
dm_addr=4'd1;
#10;
dm_addr=4'd2;
#10;
dm_addr=4'd3;
#10;
dm_addr=4'd4;
#10;
rd_dm_en=0;
wr_dm_en=1;
dm_addr=4'd5;
wr_dm_data=16'd1000;
#10;
dm_addr=4'd6;
wr_dm_data=16'd2000;
#10;
dm_addr=4'd7;
wr_dm_data=16'd3000;
#10;
dm_addr=4'd8;
wr_dm_data=16'd4000;
#30;

$stop;
end
data_memory dm_test(
.clk(clk),
.rd_dm_en(rd_dm_en),
.wr_dm_en(wr_dm_en),
.dm_addr(dm_addr),
.wr_dm_data(wr_dm_data),
.rd_dm_data(rd_dm_data)
);
endmodule
