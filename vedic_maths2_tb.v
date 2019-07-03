`timescale 1ns / 1ps
//THIS IS CODE FOR TESTBENCH OF VEDIC MULTIPLIER
module vedic_maths2_tb(a,b,ans);

	//Inputs
	output reg [2:0] a;
	reg [3:0] a1,b1;
	output reg [2:0] b;

	// Outputs
	input wire [5:0] ans;
	// Instantiate the Unit Under Test (UUT)
	vedic_maths2 v1(.a(a), .b(b), .ans(ans));// IN THIS LINE I HAVE MAPPED TB VARIABLES TO VEDIC MATHS PORTS
initial
	begin
		$monitor("ANS=%d	INPUTS A=%d	B=%d", ans, a, b);// THIS LINE PRINTS WHENEVER THERE IS A CHANGE IN VALUES OF ANS,A,B
	end

//INPUTS FOR TESTING ARE GIVEN BELOW
initial 
	begin
	a1=3'd1;
	#10;
	while(a1<=3'd7)
	begin
		#10;
		b1=3'd1;
		while(b1<=3'd7)
		begin
		#10;
			a=a1;
			b=b1;
			b1=b1+1;
		end
		a1=a1+1;
	end
end

initial begin
#800 $finish;
end
endmodule
