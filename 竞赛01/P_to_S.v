module P_to_S (
    input clk, ena, p_in,
    output reg [3:0] addr_out, data_out
);
    reg flag;
    reg [2:0] cnt;
    reg [7:0] shift_reg;
    initial begin
        flag <= 1'b0;
        cnt <= 3'b000;
    end
    always @ (posedge ena) flag <= 1'b1;
    always @ (posedge clk) if (flag | ena) begin
        if (!cnt) {addr_out, data_out} <= shift_reg;
        shift_reg[6:0] <= shift_reg[7:1];
        shift_reg[7] <= p_in;
        cnt <= cnt + 1'b1;
    end
endmodule
