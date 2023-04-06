module FPGAproj2301 (
    input clk, ena,
    output reg F, flag,
    output reg [5:0] cnt
);
    initial begin
        flag <= 1'b0;
        cnt <= 6'b111111;
    end
    always @ (posedge ena) flag <= 1'b1;
    always @ (posedge clk) if (flag | ena) begin
        cnt = cnt + 1'b1;
        F = !cnt[5:2];
    end
endmodule
