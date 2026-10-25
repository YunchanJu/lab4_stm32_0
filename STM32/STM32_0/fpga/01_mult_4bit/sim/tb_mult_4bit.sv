`timescale 1ns/1ps
module tb_mult_4bit;
 reg [3:0] a,b; wire [7:0] m;
 mult_4bit dut(.a(a),.b(b),.m(m));
 integer x,y,checks=0;
 initial begin
  $dumpfile("mult_4bit.vcd"); $dumpvars(0,tb_mult_4bit);
  for(x=0;x<16;x=x+1) for(y=0;y<16;y=y+1) begin
   a=x; b=y; #1;
   if(m !== x*y) $fatal(1,"multiply a=%0d b=%0d m=%0d",x,y,m);
   checks=checks+1;
  end
  $display("PASS multiplier: %0d input pairs",checks); $finish;
 end
 initial begin #1000; $fatal(1,"timeout"); end
endmodule
