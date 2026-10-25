`timescale 1ns/1ps
module multiply_unsigned #(parameter WIDTH=4)(
 input wire [WIDTH-1:0] a,b,
 output wire [2*WIDTH-1:0] product);
 assign product = a * b;
endmodule
module mult_4bit(input wire [3:0] a,b, output wire [7:0] m);
 multiply_unsigned #(.WIDTH(4)) u_multiply(.a(a),.b(b),.product(m));
endmodule
