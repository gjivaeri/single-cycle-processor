module control(Opcode, Function, RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, ALUOp, Jump);
input wire [5:0] Opcode, Function;
output reg [1:0] ALUOp;
output reg RegWrite, RegDst, ALUSrc, Branch, MemWrite, MemtoReg, Jump;

always@(*) 
begin
	case(Opcode)
	6'b000000 : begin //R-Type
		RegWrite = 1; RegDst = 1; ALUSrc = 0; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0;
		ALUOp = 2'b10; // add
		end
	
	6'b100011 : begin // Load Word
            RegWrite = 1; RegDst = 0; ALUSrc = 1; Branch = 0; MemWrite = 0; MemtoReg = 1; Jump = 0;	
            ALUOp = 2'b00; // add for lw
		end
	
	6'b000100 : begin // Beq
            RegWrite = 0; RegDst = 0; ALUSrc = 0; Branch = 1; MemWrite = 0; MemtoReg = 0; Jump = 0;
    		ALUOp = 2'b01; // sub for beq
		end

	6'b000010 : begin // Jump
            RegWrite = 0; RegDst = 0; ALUSrc = 0; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 1;
    		ALUOp = 2'b00; //Don't care
		end
		
	6'b001101 : begin // ori
            RegWrite = 1; RegDst = 0; ALUSrc = 1; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0;
    		ALUOp = 2'b00; 
		end

	6'b001000 : begin // andi
            RegWrite = 1; RegDst = 0; ALUSrc = 1; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0;
    		ALUOp = 2'b00; 
		end

	6'b101011 : begin // sw
            RegWrite = 0; RegDst = 0; ALUSrc = 1; Branch = 0; MemWrite = 1; MemtoReg = 0; Jump = 0;
    		ALUOp = 2'b00;
		end

    default : begin 
		 RegWrite = 0; RegDst = 0; ALUSrc = 0; Branch = 0; MemWrite = 0; MemtoReg = 0; Jump = 0;
			ALUOp = 2'b00; 
		end
	endcase
end
endmodule