`timescale 1ns/1ps
// Combo II-DLD S75: DIP1..8 HIGH-active; exactly one switch selects a note.
module piano_board(input wire clk_50mhz, rst_p, input wire [7:0] key, output wire piezo);
    (* ASYNC_REG = "TRUE" *) reg [7:0] key_meta = 0, key_sync = 0;
    (* ASYNC_REG = "TRUE" *) reg rst_meta = 1, rst_sync = 1;
    always @(posedge clk_50mhz) begin
        key_meta <= key;
        key_sync <= key_meta;
        rst_meta <= rst_p;
        rst_sync <= rst_meta;
    end
    piano #(.CLK_HZ(50_000_000)) u_piano(clk_50mhz, rst_sync, key_sync, piezo);
endmodule
