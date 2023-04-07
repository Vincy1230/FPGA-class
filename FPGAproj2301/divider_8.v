module divider_8 (
    input clk, ena,
    output reg clk_out
);
    reg flag;
    reg [1:0] cnt;
    initial begin
        flag <= 1'b0;
        cnt <= 2'b00;
	    clk_out <= 1'b0;
    end
    always @ (posedge ena) flag = 1'b1;
    always @ (posedge clk) if (flag) begin
        if (!cnt) clk_out <= !clk_out;
        cnt <= cnt + 1'b1;
    end
endmodule
