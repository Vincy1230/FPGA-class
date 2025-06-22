`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/05/05 23:21:49
// Design Name: 
// Module Name: tile_test
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


module pe_test;
reg clk;
reg reset;
reg [15:0]pe_data_in;
reg [15:0]tile_in0;
reg [15:0]tile_in1;
reg [6:0]cm_data;
wire [15:0]tile_out;


initial      clk = 1'b0 ;
initial reset=0;
parameter CLK_PERIOD = 10 ;
always #(CLK_PERIOD/2) clk = ~clk;

initial begin
#5;
pe_data_in=16'd10000;
tile_in0=16'd10000;
tile_in1=16'd0;
cm_data=7'b0010010;
#10;
pe_data_in=16'd0;
tile_in0=16'd0;
tile_in1=16'd10000;
cm_data=7'b0011101;
#20;
reset=1;
#10;
$stop;

end

pe pe_test(
.clk(clk),
.reset(reset),
.op_2(pe_data_in),
.op_0(tile_in0),
.op_1(tile_in1),
.pex_config(cm_data),
.pe_out(tile_out)
);

endmodule
