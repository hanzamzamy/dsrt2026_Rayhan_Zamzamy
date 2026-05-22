`timescale 1ns / 1ps

module tb_parity;

    reg [7:0] test_in;
    wire out_parity;
    integer i;
    integer error_count;
    reg expected_parity;

    wire vdd_net;
    wire gnd_net;

    assign vdd_net = 1'b1;
    assign gnd_net = 1'b0;

    even_parity_gen uut (
        .I0(test_in[0]),
        .I1(test_in[1]),
        .I2(test_in[2]),
        .I3(test_in[3]),
        .I4(test_in[4]),
        .I5(test_in[5]),
        .I6(test_in[6]),
        .I7(test_in[7]),
        .O0(out_parity),
        .VDD(vdd_net), // Tie power high
        .GND(gnd_net)  // Tie ground low
    );

    initial begin
        $display("========================================");
        $display("Starting Exhaustive 8-Bit Verification...");
        $display("========================================");
        error_count = 0;

        // Loop through all 256 possible input combinations
        for (i = 0; i < 256; i = i + 1) begin
            test_in = i; // Apply the binary pattern to the inputs
            #10; // Wait 10ns for the logic gates to "settle"

            // Calculate the mathematical ideal
            // Verilog's reduction XOR (^test_in) returns 1 if the sum is odd.
            // Inverting it (~^) returns 1 if the sum is even.
            expected_parity = ^test_in;

            // Compare your physical circuit's output to the mathematical ideal
            if (out_parity !== expected_parity) begin
                $display("FAIL -> Input: %b | Expected: %b | Got: %b", test_in, expected_parity, out_parity);
                error_count = error_count + 1;

            end else begin
                $display("OK -> Input: %b | Expected: %b | Got: %b", test_in, expected_parity, out_parity);
            end
        end

        if (error_count == 0) begin
            $display("SUCCESS: All 256 logic states passed!");
        end else begin
            $display("FAILED with %0d errors.", error_count);
        end
        $display("========================================");

        $finish; // End simulation
    end

endmodule
