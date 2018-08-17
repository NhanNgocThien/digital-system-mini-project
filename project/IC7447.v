module IC7447(input[3:0] in, input En, output reg[0:6] out);
	always @(*)
	begin
		if (En == 1'b0)    out = 7'b1111111;
		else
		case(in)
			4'b0000: out = 7'b0000001; // "0" 
			4'b0001: out = 7'b1001111; // "1" 
			4'b0010: out = 7'b0010010; // "2" 
			4'b0011: out = 7'b0000110; // "3" 
			4'b0100: out = 7'b1001100; // "4" 
			4'b0101: out = 7'b0100100; // "5" 
			4'b0110: out = 7'b0100000; // "6" 
			4'b0111: out = 7'b0001111; // "7" 
			4'b1000: out = 7'b0000000; // "8"  
			4'b1001: out = 7'b0000100; // "9" 
			default: out = 7'b0000001; // "0"
		endcase
	end 
endmodule 