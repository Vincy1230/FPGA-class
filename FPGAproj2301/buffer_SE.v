module buffer_SE (
    // output reg flag,                // debug only
    // output reg [5:0] cnt,           // debug only
    input clk, ena,
    input [3:0] data_in,
    output reg data_out
);
    reg flag;               // non debugging only
    reg [5:0] cnt;          // non debugging only
    reg [63:0] data;
    initial begin
        flag <= 1'b0;
        cnt <= 6'b000000;
    end
    always @ (posedge ena) flag <= 1'b1;
    always @ (posedge clk) if (flag | ena) begin
        if (!cnt[5:4]) begin
            data[{cnt[3:0], 2'b00}] = data_in[0];
            data[{cnt[3:0], 2'b01}] = data_in[1];
            data[{cnt[3:0], 2'b10}] = data_in[2];
            data[{cnt[3:0], 2'b11}] = data_in[3];
        end
        data_out = data[cnt];
        cnt = cnt + 1'b1;
    end
endmodule
