v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -10 70 -10 80 {lab=0}
N -10 -80 -10 -70 {lab=VDD}
N -100 -10 -90 -10 {lab=IN_A}
N 70 0 80 0 {lab=Y}
N -100 10 -90 10 {lab=IN_B}
C {vdd.sym} -10 -80 0 0 {name=l1 lab=VDD}
C {gnd.sym} -10 80 0 0 {name=l2 lab=0}
C {ipin.sym} -100 -10 0 0 {name=p1 lab=IN_A}
C {opin.sym} 80 0 0 0 {name=p2 lab=Y}
C {code.sym} 140 -180 0 0 {name=s1 only_toplevel=false value="tcleval(.include $::CHIP_ROOT/testbench/spice/code/xnor_6t_buf.spice)"}
C {ipin.sym} -100 10 0 0 {name=p3 lab=IN_B}
C {schematic/xnor_6t_buf.sym} -70 130 0 0 {name=x1}
