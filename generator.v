	`timescale 1ns/1ns
	module generator(clk,LED_out_first,LED_out_second);

	input clk;

	localparam sampling_frequency=5;
	
	reg [10:0] i;
	reg [15:0] outfile [10:0];
	
	reg [15:0] sine;
	
	output reg[6:0] LED_out_first,LED_out_second; //7 segmentS
	reg [3:0] LED_BCD [3:0]; //bcd
	
	initial
	begin
	
		i<=0;
		$readmemh("lut_hex.txt", outfile);

	end

	always @(posedge clk)
	begin
			
			if( i!= 1023)
			begin
				sine<=outfile[i];
				i<=i+1;
			end
			
			else	i<=0;
	end

	always @(*)
begin
 case(LED_BCD[0])
 4'b0000: LED_out_first = 7'b1000000; // "0"  
 4'b0001: LED_out_first = 7'b1111001; // "1" 
 4'b0010: LED_out_first = 7'b0100100; // "2" 
 4'b0011: LED_out_first = 7'b0110000; // "3" 
 4'b0100: LED_out_first = 7'b0011001; // "4" 
 4'b0101: LED_out_first = 7'b0010010; // "5" 
 4'b0110: LED_out_first = 7'b0000010; // "6" 
 4'b0111: LED_out_first = 7'b1111000; // "7" 
 4'b1000: LED_out_first = 7'b0000000; // "8"  
 4'b1001: LED_out_first = 7'b0010000; // "9" 
 4'b1010: LED_out_first = 7'b0001000; // "A" 
 4'b1011: LED_out_first = 7'b0000011; // "B" 
 4'b1100: LED_out_first = 7'b1000110; // "C" 
 4'b1101: LED_out_first = 7'b0100001; // "D" 
 4'b1110: LED_out_first = 7'b0000110; // "E"
 4'b1111: LED_out_first = 7'b0001110; // "F" 
 default: LED_out_first = 7'b1000000; // "0"
 endcase
end
 
 always @(*)
begin
 case(LED_BCD[1])
 4'b0000: LED_out_second = 7'b1000000; // "0"  
 4'b0001: LED_out_second = 7'b1111001; // "1" 
 4'b0010: LED_out_second = 7'b0100100; // "2" 
 4'b0011: LED_out_second = 7'b0110000; // "3" 
 4'b0100: LED_out_second = 7'b0011001; // "4" 
 4'b0101: LED_out_second = 7'b0010010; // "5" 
 4'b0110: LED_out_second = 7'b0000010; // "6" 
 4'b0111: LED_out_second = 7'b1111000; // "7" 
 4'b1000: LED_out_second = 7'b0000000; // "8"  
 4'b1001: LED_out_second = 7'b0010000; // "9" 
 4'b1010: LED_out_second = 7'b0001000; // "A" 
 4'b1011: LED_out_second = 7'b0000011; // "B" 
 4'b1100: LED_out_second = 7'b1000110; // "C" 
 4'b1101: LED_out_second = 7'b0100001; // "D" 
 4'b1110: LED_out_second = 7'b0000110; // "E"
 4'b1111: LED_out_second = 7'b0001110; // "F" 
 default: LED_out_second = 7'b1000000; // "0"
 endcase
end


	
	endmodule