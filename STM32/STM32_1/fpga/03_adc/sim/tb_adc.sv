`timescale 1ns/1ps
module tb_adc;
    reg clk=0,rst=1;always #5 clk=~clk;
    reg [2:0] channel=2;reg dout=0;
    wire sclk,ncs,din,valid;wire [11:0] sample;wire [7:0] led;wire [2:0] sample_channel;
    adc #(.HALF_CYCLES(4),.QUIET_CYCLES(6)) dut(clk,rst,channel,sclk,ncs,din,dout,sample,valid,led,sample_channel);
    integer frame=0,bit_count,valid_count=0;reg [15:0] cmd,reply;
    reg [2:0] previous_channel,latched_request;time last_close=0,last_fall;
    function [11:0] value(input [2:0] ch);
        case(ch)2:value=12'h320;5:value=12'h650;7:value=12'ha70;default:value={9'h10,ch};endcase
    endfunction
    initial begin
        repeat(3)@(negedge clk);rst=0;
        repeat(8)begin
            @(negedge ncs);
            if(last_close!=0 && $time-last_close<60)$fatal(1,"quiet time");
            latched_request=channel;
            reply=(frame==0)?16'h0abc:{4'h0,value(previous_channel)};
            cmd=0;
            for(bit_count=15;bit_count>=0;bit_count=bit_count-1)begin
                @(negedge sclk);dout=reply[bit_count];last_fall=$time;
                @(posedge sclk);
                if($time-last_fall!=40)$fatal(1,"SCLK half period");
                if(ncs!==0)$fatal(1,"CS released early");
                cmd={cmd[14:0],din};
                // A mid-frame requested-channel change must not alter this command.
                if(bit_count==8)channel=(frame%3==0)?5:((frame%3==1)?7:2);
            end
            @(posedge ncs);#1;last_close=$time-1;
            if(cmd!=={3'b101,latched_request,2'b11,1'b0,3'b111,4'b0000})$fatal(1,"MOSI command changed");
            if(sclk!==1)$fatal(1,"idle SCLK");
            if(frame==0)begin
                if(valid!==0||sample!==0)$fatal(1,"dummy frame not discarded");
            end else begin
                if(valid!==1||sample!==value(previous_channel)||sample_channel!==previous_channel||led!==sample[11:4])
                    $fatal(1,"sample pipeline frame %0d",frame);
                valid_count=valid_count+1;
            end
            @(posedge clk);#1;if(valid!==0)$fatal(1,"valid width");
            previous_channel=latched_request;frame=frame+1;
        end
        if(valid_count!=7)$fatal(1,"valid count");
        @(negedge clk);rst=1;@(posedge clk);#1;
        if(ncs!==1||sclk!==1||sample!==0||valid!==0)$fatal(1,"reset");
        $display("PASS ADC rewrite: 8 frames, CH2/5/7, stable MOSI, 16 clocks, quiet, dummy, pipeline/channel, LED, valid, reset");$finish;
    end
    initial begin #100000;$fatal(1,"timeout");end
endmodule
