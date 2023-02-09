module DFF(D, clk, rst, Q, Qbar);
input D, clk, rst;
output reg Q, Qbar;

always @(posedge clk or negedge rst)
begin
	if (!rst) begin
		Q = 1'b0;
		Qbar = 1'b1;
	end
	else begin
		Q = D;
		Qbar = ~Q;
	end
end
endmodule
