module InstructionRegister(Data_in, Inst_write, Inst, rst_n, clk);
// declare port directions
input Data_in, rst_n, clk;
output Inst;

// declare port types/sizes
wire [7:0] Data_in;
wire [3:0]Inst_write;
wire rst_n;
reg [31:0]Inst;
wire clk;

// internal registers
reg [31:0]Inst_out_q;
integer i = 0;

//registers to clock in inputs
reg [7:0] Data_in_q;
reg [3:0] Inst_write;

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n) begin
		Inst[31:0] <= 32'h00000000;
		i = 0;
	end
	else begin
		if(i == 4) begin
			Inst <= Inst_out_q;
			i = 0;
		end
		else begin
			//Place into correct cycle
			Inst_out_q[(7+(8*i)):(0+(8*i))] <= Data_in_q[7:0];
			i = i + 1;
		end
	end
end
endmodule