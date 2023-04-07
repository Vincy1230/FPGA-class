module data_source (
    input clk, ena,
    output reg ena_out,
    output [3:0] addr_out, data_out
);
    reg flag;
    reg [3:0] cnt, out;
    initial begin
        flag <= 1'b0;
        cnt <= 4'b0000;
        ena_out <= 1'b0;
    end
    always @ (posedge ena) flag <= 1'b1;
    always @ (posedge clk) if (flag | ena) begin
        ena_out <= 1'b1;
        out <= cnt;
        cnt <= cnt + 1'b1;
    end
    assign addr_out = out;
    assign data_out = out;
endmodule
