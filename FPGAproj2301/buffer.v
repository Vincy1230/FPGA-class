module buffer (
    // output reg flag,                // debug only
    // output reg [5:0] cnt,           // debug only
    input clk, ena,
    input [3:0] data_in,
    output reg data_out
);
    reg flag;               // non debugging only
    reg [5:0] cnt;          // non debugging only
    reg [3:0] data [15:0];
    initial begin
        flag <= 1'b0;
        cnt <= 6'b000000;
    end
    always @ (posedge ena) flag <= 1'b1;
    // allow read-during-write behavior
    always @ (posedge clk) if (flag | ena) begin
        if (!cnt[5:4]) data[cnt[3:0]] = data_in;
        data_out = data[cnt[5:2]][cnt[1:0]];
        cnt = cnt + 1'b1;
    end
    // avoid read-during-write behavior
    // always @ (posedge clk) if (flag | ena) begin
    //     if (!cnt) data_out <= data_in[0];
    //     else data_out <= data[cnt[5:2]][cnt[1:0]];
    // end
    // always @ (posedge clk) if (flag | ena) begin
    //     if (!cnt[5:4]) data[cnt[3:0]] = data_in;
    //     cnt = cnt + 1'b1;
    // end
endmodule
