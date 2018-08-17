module countdown(En, enSet, CLK, T, select, Q);
	input En, enSet, CLK; 
	input[6:0] T;
	output reg[1:0] select;
	output reg[6:0] Q;
	
	reg[22:0] counter;
	reg prevCounter;
	reg prevCLK;
	reg prevEnSet;
	
	initial begin
		counter 		= 22'b0;
		prevCounter = counter[22];
		prevCLK 		= CLK;
		select 		= 2'b00;
		prevEnSet	= enSet;
		Q 				= T;
	end

	always @(*) begin
		if (En & ~enSet) begin
			if (prevEnSet == 1'b1 && prevEnSet == 1'b0) select = 2'b0;		// NGT of enSet			
			if (prevCLK == 1'b0 & CLK == 1'b1) begin 								// PGT of CLK
				counter = counter + 1;
				if (prevCounter == 1'b0 & counter[22] == 1'b1) begin			// PGT of Counter[22]
					if (Q == 1'b0) begin
						select = select + 1;
						if (select == 2'b10) select = 2'b11;
						Q = T;
					end
					Q = Q - 1;
				end
			end
		end
		else begin
			counter = 1'd0;
			select = (enSet ? 2'bz : 2'b0);
			Q = T;
		end
		prevCounter = counter[22];
		prevCLK = CLK;
		prevEnSet = enSet;
	end
endmodule
