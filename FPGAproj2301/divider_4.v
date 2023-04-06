module divider_4 (
    input clk, ena,
    output reg clk_out
);
    reg flag, cnt;
    initial begin
        flag <= 1'b0;
        cnt <= 1'b1;
        clk_out <= 1'b0;
    end
    always @ (posedge ena) flag <= 1'b1;
    always @ (posedge clk) if (flag | ena) begin
        if (cnt) clk_out <= !clk_out;
        cnt <= !cnt;
    end
endmodule
