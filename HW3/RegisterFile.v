module RegisterFile(addr_a, addr_b, write_addr, write_data, read_a, read_b, write, rst_n, data_a, data_b, clk);

// declare port types/sizes
input addr_a, addr_b, write_addr, write_data, read_a, read_b, write, rst_n, clk;
output data_a, data_b;

// internal variables
wire [4:0] addr_a;
wire [4:0] addr_b;
wire write_addr;
wire [7:0]write_data;
wire read_a;
wire read_b;
wire write;
wire rst_n;
wire clk;
reg [7:0]data_a;
reg [7:0]data_b;

//internal registers
reg [7:0] registers [0:31];  // 32x8 memory
reg [7:0] data_a_q;
reg [7:0] data_b_q;
integer i;

//registers to clock in inputs
reg [4:0] addr_a_q;
reg [4:0] addr_b_q;
reg write_addr_q;
reg [7:0] write_data_q;
reg read_a_q;
reg read_b_q;
reg write_q;

//Init Reg 0
registers[0] = 8'h00;

always @(posedge clk or negedge rst_n)
begin
	if (!rst_n) begin
		data_a 			<= 8'h00;
		data_b 			<= 8'h00;
		addr_a_q 		<= 5'b00000;
		addr_b_q 		<= 5'b00000;
		write_addr_q    <= 0;
        write_data_q    <= 8'h00;
        read_a_q      	<= 0;
		read_b_q      	<= 0;
		write_q      	<= 0;
	end
	else begin
		addr_a_q		<= addr_a;
		addr_b_q		<= addr_b;
		write_addr_q    <= write_addr;
        write_data_q    <= write_data;
        read_a_q      	<= read_a;
		read_b_q      	<= read_b;
		write_q      	<= write;
		
		if (read_a_q)begin
			data_a_q <= registers[addr_a_q];
		end
		if (read_b_q)begin
			data_b_q <= registers[addr_b_q];
		end
		if (write_q && (write_addr_q != 5'b00000))begin
			registers[write_addr_q] <= write_data_q;
		end
		
		data_a <= data_a_q;
		data_b <= data_b_q;
	end
end
endmodule