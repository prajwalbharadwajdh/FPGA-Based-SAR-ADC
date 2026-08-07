`timescale 1ns / 1ps

module sar_counter_tb;

    // Inputs
    reg clk;
    reg rst;
    reg ena;

    // Outputs
    wire [7:0] out;
    wire conversion_done;

    // Instantiate the Unit Under Test (UUT)
    sar_counter uut (
        .ena(ena),
        .clk(clk),
        .rst(rst),
        .out(out),
        .conversion_done(conversion_done)
    );

    // Clock generation (10 ns period)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin

        // Initialize inputs
        rst = 1;
        ena = 0;

        // Hold reset
        #20;
        rst = 0;

        // Comparator responses
        // Each value is sampled during the decision cycle

        ena = 1; #20;   // Bit7 = 1
        ena = 0; #20;   // Bit6 = 0
        ena = 1; #20;   // Bit5 = 1
        ena = 1; #20;   // Bit4 = 1
        ena = 0; #20;   // Bit3 = 0
        ena = 1; #20;   // Bit2 = 1
        ena = 0; #20;   // Bit1 = 0
        ena = 1; #20;   // Bit0 = 1

        // Wait for conversion to complete
        #50;

        $display("--------------------------------");
        $display("Final Digital Output = %b", out);
        $display("Conversion Done = %b", conversion_done);
        $display("--------------------------------");

        $stop;
    end

endmodule
