`timescale 1ns/1ps
// New local 52-second controller. Logical LED polarity is active-HIGH.
// A direction occupies 13 seconds: green 11 s, yellow 2 s.
module traffic #(parameter CLK_HZ=50_000_000)(
    input wire clk_50mhz,rst_p,flicker,
    output reg [3:0] led_red,led_yellow,led_green,led_left,
    output reg [3:0] led_walk_red,led_walk_green
);
    reg [31:0] subsecond;
    reg [3:0] phase;
    reg [1:0] direction;
    wire end_second=(subsecond==CLK_HZ-1);
    wire blink_on=(subsecond<CLK_HZ/2);
    reg [3:0] selected;
    always @(posedge clk_50mhz)begin
        if(rst_p)begin subsecond<=0;phase<=0;direction<=0;end
        else begin
            if(end_second)subsecond<=0;else subsecond<=subsecond+1;
            if(flicker)begin phase<=0;direction<=0;end
            else if(end_second)begin
                if(phase==12)begin phase<=0;direction<=direction+1'b1;end
                else phase<=phase+1'b1;
            end
        end
    end
    always @*begin
        selected=4'b0001<<direction;
        led_red=4'hf;led_yellow=0;led_green=0;led_left=0;
        led_walk_red=4'hf;led_walk_green=0;
        if(flicker)begin
            led_red=0;
            led_yellow=blink_on?4'hf:4'h0;
            led_walk_red=blink_on?4'hf:4'h0;
        end else begin
            led_red=~selected;
            if(phase<11)begin led_green=selected;led_left=selected;end
            else led_yellow=selected;
            if(phase<4)begin led_walk_red=~selected;led_walk_green=selected;end
            else if(phase<11)begin
                led_walk_red=~selected;
                led_walk_green=blink_on?selected:4'h0;
            end
        end
    end
endmodule
