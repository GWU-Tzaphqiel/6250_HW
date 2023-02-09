module DFF_tb();
reg D, clk, rst;
wire Q, Qbar;
integer i,j;

DFF dut(D, clk, rst, Q, Qbar);

initial begin
	clk=0;
  	forever #10 clk = ~clk;  
end 
initial begin 
 	rst = 1;
 	D <= 0;
 	
 	for (i = 0; i < 3; i = i + 1)begin
 		for (j = 0; j < 5; j = j + 1) begin
 	 		#10 D <= $random;
 	 	end
 	 	#5 rst <= 0;
 	 	#5 rst <= 1;
 	 	for (j = 0; j < 5; j = j + 1) begin
 	 	 	#10 D <= $random;
 	 	end
 	end 	
 	$finish;
end
initial begin
	// Open a db file for saving simulation data
  	$shm_open ("DFF_tb.db");
	// Collect all signals (hierarchically) from the module "fulladder_tb"
  	$shm_probe (DFF_tb,"AS");
end
endmodule 