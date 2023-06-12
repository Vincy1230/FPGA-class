`timescale 10ps/1ps
module tb_P_to_S ();
    reg clk, ena, p_in;
    wire [3:0] addr_out, data_out;
    P_to_S uut (
        .clk(clk),
        .ena(ena),
        .p_in(p_in),
        .addr_out(addr_out),
        .data_out(data_out)
    );
    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end
    initial begin
                p_in = 1'b0;    ena = 1'b0;
        #100    p_in = 1'b0;    ena = 1'b1;
        #10     p_in = 1'b0;
        #10     p_in = 1'b0;
        #5                      ena = 1'b0;
        #5      p_in = 1'b0;
        #10     p_in = 1'b1;  #10 p_in = 1'b0;  #10 p_in = 1'b0;  #10 p_in = 1'b0;
        #10     p_in = 1'b0;  #10 p_in = 1'b1;  #10 p_in = 1'b0;  #10 p_in = 1'b0;
        #10     p_in = 1'b1;  #10 p_in = 1'b1;  #10 p_in = 1'b0;  #10 p_in = 1'b0;
        #10     p_in = 1'b0;  #10 p_in = 1'b0;  #10 p_in = 1'b1;  #10 p_in = 1'b0;
        #10     p_in = 1'b1;  #10 p_in = 1'b0;  #10 p_in = 1'b1;  #10 p_in = 1'b0;
        #10     p_in = 1'b0;  #10 p_in = 1'b1;  #10 p_in = 1'b1;  #10 p_in = 1'b0;
        #10     p_in = 1'b1;  #10 p_in = 1'b1;  #10 p_in = 1'b1;  #10 p_in = 1'b0;
        #10     p_in = 1'b0;  #10 p_in = 1'b0;  #10 p_in = 1'b0;  #10 p_in = 1'b1;
        #10     p_in = 1'b1;  #10 p_in = 1'b0;  #10 p_in = 1'b0;  #10 p_in = 1'b1;
        #10     p_in = 1'b0;  #10 p_in = 1'b1;  #10 p_in = 1'b0;  #10 p_in = 1'b1;
        #10     p_in = 1'b1;  #10 p_in = 1'b1;  #10 p_in = 1'b0;  #10 p_in = 1'b1;
        #10     p_in = 1'b0;  #10 p_in = 1'b0;  #10 p_in = 1'b1;  #10 p_in = 1'b1;
        #10     p_in = 1'b1;  #10 p_in = 1'b0;  #10 p_in = 1'b1;  #10 p_in = 1'b1;
        #10     p_in = 1'b0;  #10 p_in = 1'b1;  #10 p_in = 1'b1;  #10 p_in = 1'b1;
        #10     p_in = 1'b1;  #10 p_in = 1'b1;  #10 p_in = 1'b1;  #10 p_in = 1'b1;
        #100    $stop;
    end
endmodule
