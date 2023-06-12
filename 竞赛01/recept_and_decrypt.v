module recept_and_decrypt (
    input clk, ena, data_enc, key,
    output clk_div,
    output [3:0] addr_out, data_out
);
    wire data_in;
    assign data_in = data_enc ^ key;
    P_to_S p_to_s (
        .clk(clk),
        .ena(ena),
        .p_in(data_in),
        .addr_out(addr_out),
        .data_out(data_out)
    );
    divider_8 div (
        .clk(clk),
        .ena(ena),
        .clk_out(clk_div)
    );
endmodule
