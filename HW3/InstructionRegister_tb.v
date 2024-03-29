`timescale 1ns / 1ps
module InstructionRegister_tb();
reg [7:0] Data_in;
reg [3:0] Inst_write;
reg clk, rst_n;
wire [31:0] Inst;
integer k,j;

InstructionRegister dut(Data_in, Inst_write, Inst, rst_n, clk);

initial begin
	clk=0;
  	forever #10 clk = ~clk;  
end 
initial begin 
 	rst_n = 1;
 	Data_in = 8'h00;
	Inst_write = 4'h0;
 	#10 rst_n <= 0;
	#10 rst_n <= 1;
	
 	for (k = 0; k < 3; k = k + 1)begin
 		for (j = 0; j < 87; j = j + 1) begin
 	 		#10 Data_in <= $random;
 	 	end
 	 	#5 rst_n <= 0;
 	 	#5 rst_n <= 1;
 	 	for (j = 0; j < 48; j = j + 1) begin
 	 	 	#10 Data_in <= $random;
 	 	end
 	end 	
 	$finish;
end
initial begin
	// Open a db file for saving simulation data
  	$shm_open ("InstructionRegister_tb.db");
	// Collect all signals (hierarchically) from the module "InstructionRegister_tb"
  	$shm_probe (InstructionRegister_tb,"AS");
end
endmodule 