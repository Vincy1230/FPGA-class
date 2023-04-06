`timescale 10ps/1ps
module tb_data_source ();
    reg clk, ena;
    wire [3:0] data_out;
    data_source uut (
        .clk(clk),
        .ena(ena),
        .data_out(data_out)
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
