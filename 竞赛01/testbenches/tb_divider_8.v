`timescale 10ps/1ps
module tb_divider_8();
    reg clk, ena;
    wire clk_out;
    divider_8 uut(
        .clk(clk),
        .ena(ena),
        .clk_out(clk_out)
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
