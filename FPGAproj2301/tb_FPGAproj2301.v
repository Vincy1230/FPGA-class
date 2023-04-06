`timescale 10ps/1ps
module tb_FPGAproj2301 ();
    reg clk, ena;
    wire F, flag;
    wire [5:0] cnt;
    FPGAproj2301 uut (
        .clk(clk),
        .ena(ena),
        .F(F),
        .flag(flag),
        .cnt(cnt)
    );
    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end
    initial begin
        ena = 1'b0;
        #100 ena = 1'b1;
        #25 ena = 1'b0;
        #1000 $stop;
    end
endmodule
