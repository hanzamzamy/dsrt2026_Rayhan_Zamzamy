// sch_path: /workspace/project/parity_ceker/schematic/even_parity_gen.sch
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
wire net7 ;

xnor_6t_buf
x1 ( 
 .VDD( VDD ),
 .A( I0 ),
 .Y( net1 ),
 .B( I1 ),
 .GND( GND )
);


xnor_6t_buf
x2 ( 
 .VDD( VDD ),
 .A( I2 ),
 .Y( net2 ),
 .B( I3 ),
 .GND( GND )
);


xnor_6t_buf
x3 ( 
 .VDD( VDD ),
 .A( I4 ),
 .Y( net3 ),
 .B( I5 ),
 .GND( GND )
);


xnor_6t_buf
x4 ( 
 .VDD( VDD ),
 .A( I6 ),
 .Y( net4 ),
 .B( I7 ),
 .GND( GND )
);


xnor_6t_buf
x5 ( 
 .VDD( VDD ),
 .A( net1 ),
 .Y( net6 ),
 .B( net2 ),
 .GND( GND )
);


xnor_6t_buf
x6 ( 
 .VDD( VDD ),
 .A( net3 ),
 .Y( net5 ),
 .B( net4 ),
 .GND( GND )
);


xnor_6t_buf
x7 ( 
 .VDD( VDD ),
 .A( net6 ),
 .Y( net7 ),
 .B( net5 ),
 .GND( GND )
);


not_std
x8 ( 
 .VDD( VDD ),
 .A( net7 ),
 .Y( O0 ),
 .GND( GND )
);

endmodule
