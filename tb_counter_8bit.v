`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2022 11:20:26 PM
// Design Name: 
// Module Name: tb_counter_8bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_counter_8bit();
reg mode,clr,ld,clk;
reg [0:7] d_in;
wire [0:7] count;

initial 
$monitor($time,"count=%h;d_in=%h;mode=%b,clr=%b,ld=%b,clk=%b",count,d_in,mode,clr,ld,clk);

initial
begin
clk=1'b0;
forever #5 clk=~clk;
end

initial
d_in=8'b10101010;

initial
begin
 ld=1'b0;clr=1'b0;mode=1'b1;
#30 ld=1'b0;clr=1'b0;mode=1'b0;
#10 clr=1'b1;
#10 clr=1'b0; ld=1'b1;
#10 ld=1'b0;mode=1'b1;
end

initial
#100 $finish;

endmodule
