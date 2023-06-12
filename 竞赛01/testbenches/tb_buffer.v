`timescale 10ps/1ps
module tb_buffer ();
    reg clk, ena;
    reg [3:0] addr_in, data_in;
    wire data_out;
    // wire flag;              // debug only
    // wire [5:0] cnt;         // debug only
    buffer uut (
        // .flag(flag),        // debug only
        // .cnt(cnt),          // debug only
        .clk(clk),
        .ena(ena),
	    .addr_in(addr_in),
        .data_in(data_in),
        .data_out(data_out)
    );
    initial begin
        clk = 1'b1;
        forever #5 clk = ~clk;
    end
    initial begin
                                                        ena = 1'b0;
        #100                                            ena = 1'b1;
        #5      addr_in = 4'b0000;  data_in = 4'b0000;
        #10     addr_in = 4'b0001;  data_in = 4'b0001;
        #10     addr_in = 4'b0010;  data_in = 4'b0010;
        #5                                              ena = 1'b0;
        #5      addr_in = 4'b0011;  data_in = 4'b0100;
        #10     addr_in = 4'b0100;  data_in = 4'b1000;
        #10     addr_in = 4'b0101;  data_in = 4'b1001;
        #10     addr_in = 4'b0110;  data_in = 4'b1010;
        #10     addr_in = 4'b0111;  data_in = 4'b1100;
        #10     addr_in = 4'b1000;  data_in = 4'b1101;
        #10     addr_in = 4'b1001;  data_in = 4'b1110;
        #10     addr_in = 4'b1010;  data_in = 4'b1111;
        #10     addr_in = 4'b1011;  data_in = 4'b1111;
        #10     addr_in = 4'b1100;  data_in = 4'b1111;
        #10     addr_in = 4'b1101;  data_in = 4'b0000;
        #10     addr_in = 4'b1110;  data_in = 4'b0000;
        #10     addr_in = 4'b1111;  data_in = 4'b0000;
        #10     addr_in = 4'b0000;  data_in = 4'b1010;
        #10     addr_in = 4'b0001;  data_in = 4'b1010;
        #2000   $stop;
    end
endmodule
