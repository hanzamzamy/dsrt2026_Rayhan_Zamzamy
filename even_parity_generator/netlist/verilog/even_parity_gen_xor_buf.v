// sch_path: /workspace/project/even_parity_generator/schematic/even_parity_gen_xor_6t_buf.sch
module even_parity_gen_xor_6t_buf
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
wire net8 ;

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
 .A( I2 ),
 .B( I3 ),
 .GND( GND )
);


xor_6t
x3 ( 
 .VDD( VDD ),
 .Y( net3 ),
 .A( I4 ),
 .B( I5 ),
 .GND( GND )
);


xor_6t
x4 ( 
 .VDD( VDD ),
 .Y( net4 ),
 .A( I6 ),
 .B( I7 ),
 .GND( GND )
);


xor_6t
x5 ( 
 .VDD( VDD ),
 .Y( net6 ),
 .A( net1 ),
 .B( net2 ),
 .GND( GND )
);


xor_6t
x6 ( 
 .VDD( VDD ),
 .Y( net5 ),
 .A( net3 ),
 .B( net4 ),
 .GND( GND )
);


xor_6t
x7 ( 
 .VDD( VDD ),
 .Y( net7 ),
 .A( net6 ),
 .B( net5 ),
 .GND( GND )
);


not_std
x8 ( 
 .VDD( VDD ),
 .A( net7 ),
 .Y( net8 ),
 .GND( GND )
);


not_std
x9 ( 
 .VDD( VDD ),
 .A( net8 ),
 .Y( O0 ),
 .GND( GND )
);

endmodule

// expanding   symbol:  schematic/xor_6t.sym # of pins=5
// sym_path: /workspace/project/even_parity_generator/schematic/xor_6t.sym
// sch_path: /workspace/project/even_parity_generator/schematic/xor_6t.sch
module xor_6t
(
  inout wire VDD,
  output wire Y,
  input wire A,
  input wire B,
  inout wire GND
);
wire net1 ;


pfet_01v8
#(
.W ( 2 ) ,
.L ( 0.15 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "expr('int((@nf ) ,
.pd ( "expr('2*int((@nf ) ,
.as ( "expr('int((@nf ) ,
.ps ( "expr('2*int((@nf ) ,
.nrd ( "expr('0.29 ) ,
.nrs ( "expr('0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( net1 ),
 .G( A ),
 .S( VDD ),
 .B( VDD )
);


nfet_01v8
#(
.W ( 1 ) ,
.L ( 0.15 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "expr('int((@nf ) ,
.pd ( "expr('2*int((@nf ) ,
.as ( "expr('int((@nf ) ,
.ps ( "expr('2*int((@nf ) ,
.nrd ( "expr('0.29 ) ,
.nrs ( "expr('0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( net1 ),
 .G( A ),
 .S( GND ),
 .B( GND )
);


pfet_01v8
#(
.W ( 2 ) ,
.L ( 0.15 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "expr('int((@nf ) ,
.pd ( "expr('2*int((@nf ) ,
.as ( "expr('int((@nf ) ,
.ps ( "expr('2*int((@nf ) ,
.nrd ( "expr('0.29 ) ,
.nrs ( "expr('0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M3 ( 
 .D( Y ),
 .G( B ),
 .S( A ),
 .B( VDD )
);


nfet_01v8
#(
.W ( 1 ) ,
.L ( 0.15 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "expr('int((@nf ) ,
.pd ( "expr('2*int((@nf ) ,
.as ( "expr('int((@nf ) ,
.ps ( "expr('2*int((@nf ) ,
.nrd ( "expr('0.29 ) ,
.nrs ( "expr('0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M4 ( 
 .D( Y ),
 .G( B ),
 .S( net1 ),
 .B( GND )
);


pfet_01v8
#(
.W ( 2 ) ,
.L ( 0.15 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "expr('int((@nf ) ,
.pd ( "expr('2*int((@nf ) ,
.as ( "expr('int((@nf ) ,
.ps ( "expr('2*int((@nf ) ,
.nrd ( "expr('0.29 ) ,
.nrs ( "expr('0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M5 ( 
 .D( Y ),
 .G( A ),
 .S( B ),
 .B( VDD )
);


nfet_01v8
#(
.W ( 1 ) ,
.L ( 0.15 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "expr('int((@nf ) ,
.pd ( "expr('2*int((@nf ) ,
.as ( "expr('int((@nf ) ,
.ps ( "expr('2*int((@nf ) ,
.nrd ( "expr('0.29 ) ,
.nrs ( "expr('0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M6 ( 
 .D( Y ),
 .G( net1 ),
 .S( B ),
 .B( GND )
);

endmodule

// expanding   symbol:  schematic/not_std.sym # of pins=4
// sym_path: /workspace/project/even_parity_generator/schematic/not_std.sym
// sch_path: /workspace/project/even_parity_generator/schematic/not_std.sch
module not_std
(
  inout wire VDD,
  input wire A,
  output wire Y,
  inout wire GND
);

pfet_01v8
#(
.W ( 2 ) ,
.L ( 0.15 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "expr('int((@nf ) ,
.pd ( "expr('2*int((@nf ) ,
.as ( "expr('int((@nf ) ,
.ps ( "expr('2*int((@nf ) ,
.nrd ( "expr('0.29 ) ,
.nrs ( "expr('0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( pfet_01v8 ) ,
.spiceprefix ( X )
)
M1 ( 
 .D( Y ),
 .G( A ),
 .S( VDD ),
 .B( VDD )
);


nfet_01v8
#(
.W ( 1 ) ,
.L ( 0.15 ) ,
.nf ( 1 ) ,
.mult ( 1 ) ,
.ad ( "expr('int((@nf ) ,
.pd ( "expr('2*int((@nf ) ,
.as ( "expr('int((@nf ) ,
.ps ( "expr('2*int((@nf ) ,
.nrd ( "expr('0.29 ) ,
.nrs ( "expr('0.29 ) ,
.sa ( 0 ) ,
.sb ( 0 ) ,
.sd ( 0 ) ,
.model ( nfet_01v8 ) ,
.spiceprefix ( X )
)
M2 ( 
 .D( Y ),
 .G( A ),
 .S( GND ),
 .B( GND )
);

endmodule
