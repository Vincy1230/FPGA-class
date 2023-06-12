module FPGAproj2301 (
    input clk, ena,
    output [3:0] V1_addr, V1_data,
    output V2, V3, V4,  // debug only
    // output data_out,    // debug only
    output V5_clk,
    output [3:0] V5_addr, V5_data
);
    // wire V2, V3, V4;        // non debugging only
    wire V1_ena, V3_ena;    // non debugging only
    data_source ds (
        .clk(clk),
        .ena(ena),
        .ena_out(V1_ena),
        .addr_out(V1_addr),
        .data_out(V1_data)
    );
    M_51_8 SSRG1 (
        .clk(clk),
        .ena(ena),
        .m_out(V2)
    );
    encrypt_and_transmit enc (
        .clk(clk),
        .ena(V1_ena),
        .key(V2),
        .addr_in(V1_addr),
        .data_in(V1_data),
        .ena_out(V3_ena),
        // .data_out(data_out),  // debug only
        .data_enc(V3)
    );
    M_51_8 SSRG2 (
        .clk(clk),
        .ena(ena),
        .m_out(V4)
    );
    recept_and_decrypt dec (
        .clk(clk),
        .ena(V3_ena),
        .data_enc(V3),
        .key(V4),
        .clk_div(V5_clk),
        .addr_out(V5_addr),
        .data_out(V5_data)
    );
    RAM ram (
        .clk(V5_clk),
        .addr_in(V5_addr),
        .data_in(V5_data)
    );
endmodule
