module alu_mips(a, b, control, outalu, zero);
input [31:0] a, b;
input [3:0] control;
output reg [31:0] outalu;
output zero;

reg signed [15:0] immediate_offset;

always@(control, a, b, immediate_offset)
begin
	case(control)
		0 : outalu=a&b;
		1 : outalu= a|b;
		4 : outalu=a+b;
		6 : outalu=a-b;
		7 : outalu=a<b?1:0;
		12 : outalu=~(a|b);
		13 : outalu=a|immediate_offset; //ori's opcode is 0xD
                		
		default : outalu=0;
	endcase
end

assign zero=outalu==0?1:0;

endmodule
