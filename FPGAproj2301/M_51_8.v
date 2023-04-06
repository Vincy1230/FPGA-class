module M_51_8 (
    input clk, ena,
    output reg m_out
);
    reg flag;
    reg[4:0] shift_reg;
    initial begin
        flag <= 1'b0;
        shift_reg <= 5'b10101;
    end
    always @ (posedge ena) flag <= 1'b1;
    always @ (posedge clk) if (flag | ena) begin
        shift_reg[0] <= shift_reg[1] ^ shift_reg[4];
        {m_out, shift_reg[4:1]} <= shift_reg[4:0];
    end
endmodule
