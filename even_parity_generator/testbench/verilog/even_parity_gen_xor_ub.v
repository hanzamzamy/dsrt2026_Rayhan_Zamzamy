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

xor_6t
x1 ( 
 .VDD( VDD ),
 .Y( net1 ),
 .A( I0 ),
 .B( I1 ),
 .GND( GND )
);


xor_6t
x2 ( 
 .VDD( VDD ),
 .Y( net2 ),
 .A( net1 ),
 .B( I2 ),
 .GND( GND )
);


xor_6t
x3 ( 
 .VDD( VDD ),
 .Y( net3 ),
 .A( net2 ),
 .B( I3 ),
 .GND( GND )
);


xor_6t
x4 ( 
 .VDD( VDD ),
 .Y( net4 ),
 .A( net3 ),
 .B( I4 ),
 .GND( GND )
);


xor_6t
x5 ( 
 .VDD( VDD ),
 .Y( net5 ),
 .A( net4 ),
 .B( I5 ),
 .GND( GND )
);


xor_6t
x6 ( 
 .VDD( VDD ),
 .Y( net6 ),
 .A( net5 ),
 .B( I6 ),
 .GND( GND )
);


xor_6t
x7 ( 
 .VDD( VDD ),
 .Y( O0 ),
 .A( net6 ),
 .B( I7 ),
 .GND( GND )
);

endmodule
