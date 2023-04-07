module buffer (
    // output reg flag,                // debug only
    // output reg [6:0] cnt,           // debug only
    input clk, ena,
    input [3:0] addr_in, data_in,
    output reg ena_out, data_out
);
    reg flag;               // non debugging only
    reg [6:0] cnt;          // non debugging only
    reg [7:0] data [15:0];
    initial begin
        flag <= 1'b0;
        cnt <= 7'b0000000;
        ena_out <= 1'b0;
    end
    always @ (posedge ena) flag = 1'b1;
    // allow read-during-write behavior
    always @ (posedge clk) if (flag) begin
        if (!cnt[6:4]) data[cnt[3:0]] = {addr_in, data_in};
        data_out = data[cnt[6:3]][cnt[2:0]];
        cnt = cnt + 1'b1;
        ena_out = 1'b1;
    end
    // // avoid read-during-write behavior
    // always @ (posedge clk) if (flag) begin
    //     if (!cnt) data_out <= data_in[0];
    //     else data_out <= data[cnt[6:3]][cnt[2:0]];
    // end
    // always @ (posedge clk) if (flag) begin
    //     if (!cnt[6:4]) data[cnt[3:0]] = {addr_in, data_in};
    //     cnt = cnt + 1'b1;
    //     ena_out = 1'b1;
    // end
endmodule
