//Mux from Lab 1
module mux (c,a,b,s);
input a,b,s;
output c;

not I1 (wire1, s);
and I2 (wire2, a, wire1);
and I3 (wire3, b, wire1);

or I4 (c, wire2, wire3);

endmodule

//DFF from HW1 Question 1 minus rst and Qbar
module DFF(D, clk, Q);
input D, clk;
output reg Q;

always @(posedge clk)
begin
	Q = D;
end
endmodule

module HW1_Problem3(a, b, c, clk, y);
input a, b, c, clk;
output y;

wire w_nand_out;
wire w_dff0_out;
wire w_dff1_out;
wire w_mux_out;
reg mux_out;
reg dff0_out;
reg dff1_out;
reg nand_out;

mux U0(w_mux_out, a, b, c);
DFF U1(a, clk, w_dff0_out);
DFF U2(w_mux_out, clk, w_dff1_out);
nand(w_nand_out, w_dff0_out, w_dff1_out);
DFF U3(w_nand_out, clk, y);

assign w_mux_out = mux_out;
assign w_nand_out = nand_out;
assign w_dff0_out = dff0_out;
assign w_dff1_out = dff1_out;
endmodule
