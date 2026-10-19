`timescale 1ns/1ps
module bcd_to_binary(input wire [3:0] ten,one,
 output wire [6:0] binary, output wire valid);
 assign binary = ten * 7'd10 + one;
 assign valid = (ten <= 9) && (one <= 9);
endmodule
module bcd_conv(input wire [3:0] one,ten,
 output wire [6:0] bin,output wire valid);
 bcd_to_binary u_convert(.ten(ten),.one(one),.binary(bin),.valid(valid));
endmodule
