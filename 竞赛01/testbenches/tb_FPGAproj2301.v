`timescale 10ps/1ps
module tb_FPGAproj2301 ();
    reg clk, ena;
    wire [3:0] V1_addr, V1_data;
    wire V2, V3, V4;    // debug only
    // wire data_out;      // debug only
    wire V5_clk;
    wire [3:0] V5_addr, V5_data;
    FPGAproj2301 uut (
        .clk(clk),
        .ena(ena),
        .V1_addr(V1_addr),
        .V1_data(V1_data),
        .V2(V2),        // debug only
        .V3(V3),        // debug only
        .V4(V4),        // debug only
        // .data_out(data_out),    // debug only
        .V5_clk(V5_clk),
        .V5_addr(V5_addr),
        .V5_data(V5_data)
    );
    initial begin
                    clk = 1'b1;
        forever #5  clk = ~clk;
    end
    initial begin
                ena = 1'b0;
        #97     ena = 1'b1;
        #25     ena = 1'b0;
        #2000   $stop;
    end
endmodule
