`timescale 1ns / 1ps

module blinky_tb;
    reg clk = 0;
    reg rst = 0;
    wire led;

    blinky #(.DIVIDE_N(24)) dut (
        .clk(clk),
        .rst(rst),
        .led(led)
    );

    localparam real CLK_PERIOD_NS = 41.666666666666667;

    initial begin
        $dumpfile("tb/blinky_tb.vcd");
        $dumpvars(0, blinky_tb);

        $display("Starting 24 MHz clock simulation with a small divider ratio...");

        // Hold reset low for a few clock cycles.
        rst = 0;
        repeat (4) @(posedge clk);
        rst = 1;

        // Observe the divider-driven LED behavior over a short window.
        repeat (10) begin
            #(1000); // 1 us
            $display("[%0t ns] led = %b cnt = %b", $time, led, dut.cnt);
        end

        $display("Simulation complete.");
        $finish;
    end

    always begin
        #(CLK_PERIOD_NS / 2) clk = ~clk;
    end
endmodule
