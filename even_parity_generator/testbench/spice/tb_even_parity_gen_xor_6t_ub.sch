v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 120 -260 120 -250 {lab=VDD}
N 120 -30 120 -20 {lab=0}
N 200 -210 210 -210 {lab=OUT_PARITY}
N 30 -210 40 -210 {lab=IN_0}
N 30 -190 40 -190 {lab=IN_1}
N 30 -170 40 -170 {lab=IN_2}
N 30 -150 40 -150 {lab=IN_3}
N 30 -130 40 -130 {lab=IN_4}
N 30 -110 40 -110 {lab=IN_5}
N 30 -90 40 -90 {lab=IN_6}
N 30 -70 40 -70 {lab=IN_7}
C {vdd.sym} 120 -260 0 0 {name=l1 lab=VDD}
C {gnd.sym} 120 -20 0 0 {name=l2 lab=0}
C {opin.sym} 210 -210 0 0 {name=p1 lab=OUT_PARITY}
C {ipin.sym} 30 -210 0 0 {name=p2 lab=IN_0}
C {ipin.sym} 30 -190 0 0 {name=p3 lab=IN_1
}
C {ipin.sym} 30 -170 0 0 {name=p4 lab=IN_2}
C {ipin.sym} 30 -150 0 0 {name=p5 lab=IN_3}
C {ipin.sym} 30 -130 0 0 {name=p6 lab=IN_4}
C {ipin.sym} 30 -110 0 0 {name=p7 lab=IN_5}
C {ipin.sym} 30 -90 0 0 {name=p8 lab=IN_6}
C {ipin.sym} 30 -70 0 0 {name=p9 lab=IN_7}
C {code.sym} 370 -350 0 0 {name=s1 only_toplevel=false value="tcleval(.include $::CHIP_ROOT/testbench/spice/code/even_parity_gen_xor_6t_ub.spice)"}
C {schematic/even_parity_gen_xor_6t_ub.sym} 190 -140 0 0 {name=x1}
