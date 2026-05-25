module even_parity_gen
(
  output wire O0,
  inout wire VDD,
  inout wire GND,
  input wire I0,
  input wire I1,
  input wire I2,
  input wire I3,
  input wire I4,
  input wire I5,
  input wire I6,
  input wire I7
);
wire net1 ;
wire net2 ;
wire net3 ;
wire net4 ;
wire net5 ;
wire net6 ;

xor_12t
x1 ( 
 .VDD( VDD ),
 .Y( net1 ),
 .A( I0 ),
 .B( I1 ),
 .GND( GND )
);


xor_12t
x2 ( 
 .VDD( VDD ),
 .Y( net2 ),
 .A( I2 ),
 .B( I3 ),
 .GND( GND )
);


xor_12t
x3 ( 
 .VDD( VDD ),
 .Y( net3 ),
 .A( I4 ),
 .B( I5 ),
 .GND( GND )
);


xor_12t
x4 ( 
 .VDD( VDD ),
 .Y( net4 ),
 .A( I6 ),
 .B( I7 ),
 .GND( GND )
);


xor_12t
x5 ( 
 .VDD( VDD ),
 .Y( net6 ),
 .A( net1 ),
 .B( net2 ),
 .GND( GND )
);


xor_12t
x6 ( 
 .VDD( VDD ),
 .Y( net5 ),
 .A( net3 ),
 .B( net4 ),
 .GND( GND )
);


xor_12t
x7 ( 
 .VDD( VDD ),
 .Y( O0 ),
 .A( net6 ),
 .B( net5 ),
 .GND( GND )
);

endmodule
