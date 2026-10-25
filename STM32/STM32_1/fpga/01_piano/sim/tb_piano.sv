`timescale 1ns/1ps
module tb_piano;
    reg clk=0,rst=1; always #5 clk=~clk;
    reg [7:0] key=0;wire piezo;
    piano #(.CLK_HZ(100000)) dut(clk,rst,key,piezo);
    integer hz[0:7],n,k,half_period;
    reg expected;
    task step;begin @(posedge clk);#1;end endtask
    initial begin
        hz[0]=262;hz[1]=294;hz[2]=330;hz[3]=349;
        hz[4]=392;hz[5]=440;hz[6]=494;hz[7]=523;
        step;@(negedge clk);rst=0;
        for(n=0;n<8;n=n+1)begin
            @(negedge clk);key=8'h80>>n;step;
            if(piezo!==0)$fatal(1,"new note starts LOW");
            half_period=100000/(2*hz[n]);expected=0;
            for(k=1;k<=6*half_period;k=k+1)begin
                step;if(k%half_period==0)expected=~expected;
                if(piezo!==expected)$fatal(1,"note=%0d cycle=%0d",n,k);
            end
        end
        // All non-one-hot combinations must remain silent, not pick a priority.
        for(n=0;n<256;n=n+1)if(n==0 || (n&(n-1))!=0)begin
            @(negedge clk);key=n;repeat(3)step;
            if(piezo!==0)$fatal(1,"invalid key %h",key);
        end
        @(negedge clk);key=8'h80;repeat(200)step;
        @(negedge clk);rst=1;step;
        if(piezo!==0)$fatal(1,"reset while sounding");
        $display("PASS piano rewrite: 8 frequencies, 3 periods/note, all invalid key masks, live reset");$finish;
    end
    initial begin #200000;$fatal(1,"timeout");end
endmodule
