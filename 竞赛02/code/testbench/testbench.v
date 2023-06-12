`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/03/19 20:56:15
// Design Name: 
// Module Name: testbench
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


module testbench;
    reg clk;
    reg reset;
    reg rd_cm_en;
    reg [5:0]cm_addr;
    //wire [15:0]data_out;
    
    initial      clk = 1'b0 ;
    initial reset=0;
    parameter CLK_PERIOD = 10 ;
    always #(CLK_PERIOD/2) clk = ~clk;
    
    initial begin
    rd_cm_en=1;
    #5;
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
    cm_addr='b000000;
    #10;
    reset=1;
    #30;
    $stop;
    end
    
       
    top cgra_top(
    .clk(clk),
    .reset(reset),
    .rd_cm_en(rd_cm_en),
    .cm_addr(cm_addr)
    );
endmodule
