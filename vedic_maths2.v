`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:40:50 06/26/2019 
// Design Name: 
// Module Name:    vedic_maths2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module vedic_maths2(a,b,ans);
input [2:0] a,b;
output ans;
reg [5:0] ans;
reg [4:0] temp1,temp2, temp3;

reg [4:0] sum, carry;



always@(a,b)
	begin
		ans[0]=a[0]*b[0];
		temp1[0]=(a[0]*b[1]);
		temp2[0]=(a[1]*b[0]);
		//ans[1]=(a[0]*b[1])+(a[1]*b[0]); the below line adds these 2 and provides us with s and c
		half_adder(sum[0], carry[0], temp1[0], temp2[0]);
		ans[1]=sum[0];
		//ans[2]=(a[0]*b[2])+(a[2]*b[0])+(a[1]*b[1]);this line is solved below to take care of c
		temp1[1]=a[0]*b[2];
		temp2[1]=(a[2]*b[0]);
		temp3[1]=(a[1]*b[1]);
		//ans[2]=(a[0]*b[2])+(a[2]*b[0])+(a[1]*b[1]);this line is solved below to take care of c
		full_adder(sum[1], carry[1], temp1[1], temp2[1], temp3[1]);
		half_adder(temp3[0], temp3[2], carry[0], sum[1]);
		//full_adder(sum[1], carry[1], temp1[1], temp2[1],carry[0]);
		//half_adder(sum[2], carry[2], sum[1], temp3[1]);
		//full_adder(sum[2], carry[2], sum[1], temp3[1], carry[1]);
		//half_adder(sum[2], carry[2], sum[1], temp3[1]);
		ans[2]=temp3[0];
		//ans[3]=(a[2]*b[1])+(a[1]*b[2]);this is executed Below
		temp1[2]=(a[2]*b[1]);	
		temp2[2]=(a[1]*b[2]);
		full_adder(sum[3], carry[3], temp1[2], temp2[2], temp3[2]);
		half_adder(temp3[3], temp3[4], sum[3], carry[1]); 
		ans[3]=temp3[3];
		//ans[4]=(a[2]*b[2]);
		temp1[3]=(a[2]*b[2]);
		full_adder(sum[4], carry[4], temp1[3], carry[3], temp3[4]);
		ans[4]=sum[4];
		ans[5]=carry[4];
	end
	
task half_adder(
	output sum, carry,
	input a,b);
	begin
	carry=a&b;
	sum=a^b;
	end
	
	
endtask


task full_adder(
output sum, car,
input a,b,c);
reg a1,a2,a3;
	begin
	
	a1=a^b;
	a2=a&b;
	sum=a1^c;
	a3=c&a1;
	car=a3|a2;
	end
endtask
	

endmodule
