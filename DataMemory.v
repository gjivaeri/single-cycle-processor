module DataMemory(address, Write_data, Read_data, MemRead, MemWrite);
input [31:0] address, Write_data; //input value from ALU and Register
input MemRead, MemWrite; //from control
output reg[31:0] Read_data; //
	
reg [31:0] register_memory[63:0]; //32bits memory which has 64 entries
initial begin
	  $readmemb("memory.mem", register_memory); //
end

always @(*)
begin
	if(MemWrite == 0 && MemRead == 1) // if MemWrite is 0 and MemRead is 1, do lw instruction
		Read_data = register_memory[address][31:0];  //input the value which is located in [address] to Read_data, ex) save mem($s2+0) into $3
end


endmodule
