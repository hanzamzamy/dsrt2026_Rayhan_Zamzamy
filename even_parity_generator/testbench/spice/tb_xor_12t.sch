v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 70 -0 80 {lab=0}
N -0 -80 -0 -70 {lab=VDD}
N -80 -10 -70 -10 {lab=IN_A}
N 70 0 80 0 {lab=Y}
N -80 10 -70 10 {lab=IN_B}
C {vdd.sym} 0 -80 0 0 {name=l1 lab=VDD}
C {gnd.sym} 0 80 0 0 {name=l2 lab=0}
C {ipin.sym} -80 -10 0 0 {name=p1 lab=IN_A}
C {opin.sym} 80 0 0 0 {name=p2 lab=Y}
C {code.sym} 140 -180 0 0 {name=s1 only_toplevel=false value="tcleval(.include $::CHIP_ROOT/testbench/spice/code/xor_12t.spice)"}
C {ipin.sym} -80 10 0 0 {name=p3 lab=IN_B}
C {schematic/xor_12t.sym} 40 90 0 0 {name=x1}
