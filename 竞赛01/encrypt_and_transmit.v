module encrypt_and_transmit (
    input clk, ena, key,
    input [3:0] addr_in, data_in,
    // output data_out,  // debug only
    output ena_out, data_enc
);
    wire data_out;      // non debugging only
    buffer buffer (
        .clk(clk),
        .ena(ena),
        .addr_in(addr_in),
        .data_in(data_in),
        .ena_out(ena_out),
        .data_out(data_out)
    );
    assign data_enc = data_out ^ key;
endmodule
