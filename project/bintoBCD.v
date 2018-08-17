module bintoBCD(in, MSB, LSB);
	input[6:0] in;
	output reg[3:0] MSB, LSB;
	
	integer i;
	
	always @(in) begin
		MSB = 4'b0;
		LSB = 4'b0;
		for (i=5 ; i>=0 ; i=i-1) begin
			if (MSB>=5)
				MSB = MSB + 3;
			if (LSB >= 5)
				LSB 		= LSB + 3;
				MSB 		= MSB << 1;
				MSB[0] 	= LSB[3];
				LSB		= LSB << 1;
				LSB[0] 	= in[i];
		end
	end
endmodule 