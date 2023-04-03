module InstructionRegister(Data_in, clk, rst_n, addr_a, addr_b, mux_a, mux_b);
input Data_in, clk, rst_n;
output addr_a, addr_b, mux_a, mux_b;

wire Data_in[7:0];
wire clk;
wire rst_n;
reg addr_a[4:0];
reg addr_b[4:0];
reg mux_a[4:0];
reg mux_b[4:0];
reg Inst[31:0];
integer i = 0;

always @(posedge clk or negedge rst)
begin
	if (!rst) begin
		addr_a = 5'b00000;
		addr_b = 5'b00000;
		mux_a = 5'b00000;
		mux_b = 5'b00000;
		i = 0;
	end
	else if(i == 4) begin
		addr_a = Inst[25:21];
		addr_b = Inst[20:16];
		mux_a = Inst[20:16];
		mux_b = Inst[15:11];
	end
	else begin
		//Place into correct cycle
		Inst[(7+(8*i)):(0+(8*i))] = Data_in[7:0];
		i = i + 1;
	end
end
endmodule
