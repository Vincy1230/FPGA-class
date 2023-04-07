module RAM (
    input clk,
    input [3:0] addr_in, data_in
);
    reg [3:0] data [15:0];
    always @ (posedge clk) data[addr_in] = data_in;
endmodule
