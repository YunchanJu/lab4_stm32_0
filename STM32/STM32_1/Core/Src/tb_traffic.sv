`timescale 1ns/1ps
module tb_traffic;
    reg clk=0,rst=1,flicker=0;always #5 clk=~clk;
    wire [3:0] red,yellow,green,left_light,wr,wg;
    traffic #(.CLK_HZ(8)) dut(clk,rst,flicker,red,yellow,green,left_light,wr,wg);
    integer cycle,sec,phase,dir,sub;reg [3:0] mask,er,ey,eg,ewr,ewg;
    task inspect(input integer t);
        begin
            sec=t/8;sub=t%8;dir=(sec/13)%4;phase=sec%13;mask=1<<dir;
            er=~mask;eg=0;ey=0;ewr=15;ewg=0;
            if(phase<11)eg=mask;else ey=mask;
            if(phase<4)begin ewr=~mask;ewg=mask;end
            else if(phase<11)begin ewr=~mask;if(sub<4)ewg=mask;end
            if({red,yellow,green,left_light,wr,wg}!=={er,ey,eg,eg,ewr,ewg})
                $fatal(1,"traffic mismatch second=%0d sub=%0d",sec,sub);
        end
    endtask
    initial begin
        @(posedge clk);#1;@(negedge clk);rst=0;
        // Two full 52-second cycles, including all half-second boundaries.
        for(cycle=0;cycle<832;cycle=cycle+1)begin
            #1;inspect(cycle);@(posedge clk);#1;@(negedge clk);
        end
        flicker=1;
        repeat(16)begin
            #1;
            if(red!==0||green!==0||left_light!==0||wg!==0||yellow!==wr)
                $fatal(1,"flicker safety outputs");
            if(yellow!==(dut.subsecond<4?4'hf:4'h0))$fatal(1,"blink");
            @(posedge clk);#1;@(negedge clk);
        end
        flicker=0;#1;
        if(green!==1)$fatal(1,"restart direction");
        rst=1;@(posedge clk);#1;
        if(dut.phase!==0||dut.direction!==0||dut.subsecond!==0)$fatal(1,"reset");
        $display("PASS traffic rewrite: 2 full cycles, 1-2-4-8 order, 11/2s phases, walk blink, flicker, reset");$finish;
    end
    initial begin #20000;$fatal(1,"timeout");end
endmodule
