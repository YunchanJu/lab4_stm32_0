`timescale 1ns/1ps
// New local implementation, 2026-10-26. Exactly one active key selects a note.
module piano #(parameter CLK_HZ=50_000_000)(
    input wire clk_50mhz,rst_p,
    input wire [7:0] key,
    output reg piezo
);
    reg [7:0] selected;
    reg [31:0] divider,count;
    function [31:0] note_divider(input [7:0] keys);
        begin
            case(keys)
                8'h80: note_divider=CLK_HZ/524;
                8'h40: note_divider=CLK_HZ/588;
                8'h20: note_divider=CLK_HZ/660;
                8'h10: note_divider=CLK_HZ/698;
                8'h08: note_divider=CLK_HZ/784;
                8'h04: note_divider=CLK_HZ/880;
                8'h02: note_divider=CLK_HZ/988;
                8'h01: note_divider=CLK_HZ/1046;
                default: note_divider=0;
            endcase
        end
    endfunction
    always @* divider=note_divider(key);
    always @(posedge clk_50mhz) begin
        if(rst_p) begin selected<=0;count<=0;piezo<=0;end
        else if(key!=selected) begin selected<=key;count<=0;piezo<=0;end
        else if(divider==0) begin count<=0;piezo<=0;end
        else if(count==divider-1) begin count<=0;piezo<=~piezo;end
        else count<=count+1;
    end
endmodule
