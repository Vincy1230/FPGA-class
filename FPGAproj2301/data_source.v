module data_source (
    input clk, ena,
    output reg [3:0] data_out
);
    reg flag;
    initial begin
        flag <= 1'b0;
        data_out <= 4'b0000;
    end
    always @ (posedge ena) flag <= 1'b1;
    always @ (posedge clk) if (flag | ena)
        data_out <= data_out + 1'b1;
endmodule
