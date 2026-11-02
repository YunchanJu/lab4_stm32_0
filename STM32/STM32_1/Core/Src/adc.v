`timescale 1ns/1ps
// New local pipelined 16-clock ADC interface. No physical ADC model is claimed.
// Protocol assumption: a frame returns the PREVIOUS command's channel sample.
// SCLK idles HIGH, DIN changes at falling edges, DOUT is sampled rising.
module adc #(parameter HALF_CYCLES=25,parameter QUIET_CYCLES=4)(
    input wire clk_50mhz,rst_p,
    input wire [2:0] add_sel,
    output reg adc_sclk,adc_ncs,adc_din,
    input wire adc_dout,
    output reg [11:0] sample,
    output reg data_valid,
    output wire [7:0] led_out,
    output reg [2:0] sample_channel
);
    localparam QUIET=0,FALL=1,RISE=2,FINISH=3;
    reg [1:0] state;
    reg [31:0] delay_count;
    reg [4:0] bit_left;
    reg [15:0] command,received;
    reg [2:0] current_channel,previous_channel;
    reg have_previous;
    assign led_out=sample[11:4];
    always @(posedge clk_50mhz)begin
        if(rst_p)begin
            state<=QUIET;delay_count<=0;bit_left<=15;
            adc_sclk<=1;adc_ncs<=1;adc_din<=0;
            command<=0;received<=0;sample<=0;data_valid<=0;
            current_channel<=0;previous_channel<=0;have_previous<=0;sample_channel<=0;
        end else begin
            data_valid<=0;
            case(state)
                QUIET:begin
                    if(delay_count==QUIET_CYCLES-1)begin
                        delay_count<=0;adc_ncs<=0;received<=0;bit_left<=15;
                        current_channel<=add_sel;
                        command<={3'b101,add_sel,2'b11,1'b0,3'b111,4'b0000};
                        adc_din<=1;state<=FALL;
                    end else delay_count<=delay_count+1;
                end
                FALL:begin
                    if(delay_count==HALF_CYCLES-1)begin
                        delay_count<=0;adc_sclk<=0;adc_din<=command[bit_left];state<=RISE;
                    end else delay_count<=delay_count+1;
                end
                RISE:begin
                    if(delay_count==HALF_CYCLES-1)begin
                        delay_count<=0;adc_sclk<=1;received<={received[14:0],adc_dout};
                        if(bit_left==0)state<=FINISH;
                        else begin bit_left<=bit_left-1'b1;state<=FALL;end
                    end else delay_count<=delay_count+1;
                end
                FINISH:begin
                    // Retain CS LOW for a half-clock after the final sample edge.
                    if(delay_count==HALF_CYCLES-1)begin
                        delay_count<=0;adc_ncs<=1;adc_din<=0;state<=QUIET;
                        if(have_previous)begin
                            sample<=received[11:0];sample_channel<=previous_channel;data_valid<=1;
                        end
                        previous_channel<=current_channel;have_previous<=1;
                    end else delay_count<=delay_count+1;
                end
                default:begin state<=QUIET;delay_count<=0;adc_ncs<=1;adc_sclk<=1;end
            endcase
        end
    end
endmodule
