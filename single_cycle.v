module single_cycle(rst, clk, seg);
//declare needed port , variasble
//PC
  input  rst, clk;
  output[4:0] seg;
  wire[3:0] digit;
  wire out_clk;
  
  // 50MHz -> 1Hz  divide
  clk_dll u0(rst, clk, out_clk); 
  
  // counter 
  counter u1(rst, out_clk, digit); 
   
  // 7-segment decoder   
  seg7 u2(digit, seg);

//Instruction memory
wire [31:0] Next_PC, Instruction, Adder; 
reg [31:0] PC;

//Control
wire RegWrite, RegDst, AluSrc, Branch, MemWrite, MemtoReg, Jump;
wire [5:0] Opcode, Function;
wire [1:0] ALUOp;

//Register
wire [4:0] Reg_Write_address, Read_reg1, Read_reg2;
wire [31:0] Write_data, Read_data1, Read_data2;

//ALU
wire [31:0] aludec, ALU_result;
wire Zero;

//ALU control
//MUX
//Adder


//Data memory
wire [31:0] MUX;
wire [31:0] Dm_Read_data, Dm_Write_data;

assign Next_PC = PC + 32'd4; //pc counter +4
assign Opcode = Instruction[31:26];
assign Function = Instruction[5:0];
assign Read_reg1 = Instruction[25:21]; //decide read register
assign Read_reg2 = Instruction[20:16];
assign Reg_Write_address = (RegDst) ? Instruction[15:11] : Instruction[20:16]; //if RegDst is 1, rd will enter into Reg_write



//insert input

control Control(Opcode, Function, RegWrite, RegDst, AluSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump);
register Reg(Read_data1, Read_data2, RegWrite, Read_reg1, Read_reg2, Write_reg, Write_data); 
alu_mips alu(aludec, ALU_result, Zero);
DataMemmory DM(MUX, Read_data, Write_data); 

endmodule