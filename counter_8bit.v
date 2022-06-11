`timescale 1ns / 1ps

module counter_8bit(mode,clr,ld,d_in,clk,count);
input mode,clr,ld,clk;
input [0:7] d_in;
output reg [0:7] count=8'b0;

always @(posedge clk)
if(ld)
count<=d_in;
else if(clr)
count<=0;
else if(mode)
count<=count+1;
else
count<=count-1;

endmodule
