v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 70 -0 80 -0 {lab=#net1}
N 0 -80 0 -70 {lab=VDD}
N 0 -80 150 -80 {lab=VDD}
N 150 -80 150 -70 {lab=VDD}
N 150 70 150 80 {lab=xxx}
N 0 80 150 80 {lab=xxx}
N -0 70 -0 80 {lab=xxx}
N -80 10 -70 10 {lab=B}
N -80 -10 -70 -10 {lab=A}
N 220 -0 230 -0 {lab=Y}
N -10 80 -0 80 {lab=xxx}
N -10 -80 -0 -80 {lab=VDD}
C {schematic/xor_6t.sym} 40 90 0 0 {name=x1}
C {schematic/not_std.sym} 40 90 0 0 {name=x2}
C {ipin.sym} -80 -10 0 0 {name=p1 lab=A
}
C {ipin.sym} -80 10 0 0 {name=p2 lab=B}
C {opin.sym} 230 0 0 0 {name=p3 lab=Y}
C {iopin.sym} -10 -80 2 0 {name=p4 lab=VDD}
C {iopin.sym} -10 80 2 0 {name=p5 lab=GND}
