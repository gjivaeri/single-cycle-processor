module Register(Read_data1, Read_data2, RegWrite, Read_reg1, Read_reg2, Write_reg, Write_data);
input wire RegWrite;
input wire [4:0] Read_reg1, Read_reg2;
input wire [4:0] Write_reg;
input wire [31:0] Write_data;
output reg [31:0] Read_data1, Read_data2;

reg [31:0] mem[31:0];  

always @(*) 
	begin
	Read_data1 = mem[Read_reg1][31:0]; //read_reg1 is rs which reads data, input the value to Read_data1 from read_reg1's address
	end

always @(*)
	begin
		if ((Read_reg2 == Write_reg) && RegWrite) 
    // if reg2 is write_register and RegWrite? is 1, input Write_data to Read_data2 
			Read_data2 = Write_data;
		else
			Read_data2 = mem[Read_reg2][31:0];
	end
endmodule