`timescale 10ps/1ps
module tb_M_51_8 ();
    reg clk, ena;
    wire m_out;
    M_51_8 uut (
        .clk(clk),
        .ena(ena),
        .m_out(m_out)
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
