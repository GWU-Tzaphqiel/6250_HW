module InstructionRegister_tb();
reg Data_in[7:0], clk, rst_n;
wire addr_a[5:0], addr_b[5:0], mux_a[5:0], mux_b[5:0];
integer k,j;

InstructionRegister dut(Data_in, clk, rst_n, addr_a, addr_b, mux_a, mux_b);

initial begin
	clk=0;
  	forever #10 clk = ~clk;  
end 
initial begin 
 	rst_n = 1;
 	Data_in <= 0;
 	
 	for (k = 0; k < 3; k = k + 1)begin
 		for (j = 0; j < 16; j = j + 1) begin
 	 		#10 Data_in[7:0] <= $random;
 	 	end
 	 	#5 rst <= 0;
 	 	#5 rst <= 1;
 	 	for (j = 0; j < 6; j = j + 1) begin
 	 	 	#10 Data_in[7:0] <= $random;
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