module xor_6t (input A, input B, output Y, inout VDD, inout GND);
    assign Y = A ^ B;
endmodule

module not_std (input A, output Y, inout VDD, inout GND);
    assign Y = ~A;
endmodule

module xnor_6t_buf (input A, input B, output Y, inout VDD, inout GND);
    wire net1;
    xor_6t x1 (.A(A), .B(B), .Y(net1), .VDD(VDD), .GND(GND));
    not_std x2 (.A(net1), .Y(Y), .VDD(VDD), .GND(GND));
endmodule
