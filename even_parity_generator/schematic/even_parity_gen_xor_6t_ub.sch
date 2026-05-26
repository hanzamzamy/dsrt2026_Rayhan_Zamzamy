v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -730 -170 -730 -160 {lab=VDD}
N -650 -250 -640 -250 {lab=VDD}
N -650 -220 -640 -220 {lab=GND}
N -730 -20 -730 -10 {lab=GND}
N -830 -100 -800 -100 {lab=I0}
N -830 -80 -800 -80 {lab=I1}
N -640 -70 -610 -70 {lab=I2}
N -450 -60 -420 -60 {lab=I3}
N -260 -50 -230 -50 {lab=I4}
N -70 -40 -40 -40 {lab=I5}
N 120 -30 150 -30 {lab=I6}
N 310 -20 340 -20 {lab=I7}
N -540 -160 -540 -150 {lab=VDD}
N -540 -10 -540 0 {lab=GND}
N -660 -90 -610 -90 {lab=#net1}
N -350 -150 -350 -140 {lab=VDD}
N -350 0 -350 10 {lab=GND}
N -470 -80 -420 -80 {lab=#net2}
N -160 -140 -160 -130 {lab=VDD}
N -160 10 -160 20 {lab=GND}
N -280 -70 -230 -70 {lab=#net3}
N 30 -130 30 -120 {lab=VDD}
N 30 20 30 30 {lab=GND}
N -90 -60 -40 -60 {lab=#net4}
N 220 -120 220 -110 {lab=VDD}
N 220 30 220 40 {lab=GND}
N 100 -50 150 -50 {lab=#net5}
N 410 -110 410 -100 {lab=VDD}
N 410 40 410 50 {lab=GND}
N 290 -40 340 -40 {lab=#net6}
N 480 -30 500 -30 {lab=O0}
C {iopin.sym} -650 -250 0 1 {name=p1 lab=VDD}
C {iopin.sym} -650 -220 0 1 {name=p2 lab=GND}
C {lab_wire.sym} -730 -170 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -640 -250 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -640 -220 0 1 {name=p5 sig_type=std_logic lab=GND}
C {lab_wire.sym} -730 -10 2 1 {name=p6 sig_type=std_logic lab=GND}
C {ipin.sym} -830 -100 0 0 {name=p20 lab=I0}
C {ipin.sym} -830 -80 0 0 {name=p21 lab=I1}
C {ipin.sym} -640 -70 0 0 {name=p22 lab=I2}
C {ipin.sym} -450 -60 0 0 {name=p23 lab=I3}
C {ipin.sym} -260 -50 0 0 {name=p24 lab=I4}
C {ipin.sym} -70 -40 0 0 {name=p25 lab=I5}
C {ipin.sym} 120 -30 0 0 {name=p26 lab=I6}
C {ipin.sym} 310 -20 0 0 {name=p27 lab=I7}
C {opin.sym} 500 -30 0 0 {name=p29 lab=O0}
C {schematic/xor_6t.sym} -690 0 0 0 {name=x1}
C {lab_wire.sym} -540 -160 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -540 0 2 1 {name=p8 sig_type=std_logic lab=GND}
C {schematic/xor_6t.sym} -500 10 0 0 {name=x2}
C {lab_wire.sym} -350 -150 0 0 {name=p9 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -350 10 2 1 {name=p10 sig_type=std_logic lab=GND}
C {schematic/xor_6t.sym} -310 20 0 0 {name=x3}
C {lab_wire.sym} -160 -140 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -160 20 2 1 {name=p12 sig_type=std_logic lab=GND}
C {schematic/xor_6t.sym} -120 30 0 0 {name=x4}
C {lab_wire.sym} 30 -130 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 30 30 2 1 {name=p14 sig_type=std_logic lab=GND}
C {schematic/xor_6t.sym} 70 40 0 0 {name=x5}
C {lab_wire.sym} 220 -120 0 0 {name=p15 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 220 40 2 1 {name=p16 sig_type=std_logic lab=GND}
C {schematic/xor_6t.sym} 260 50 0 0 {name=x6}
C {lab_wire.sym} 410 -110 0 0 {name=p17 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 410 50 2 1 {name=p18 sig_type=std_logic lab=GND}
C {schematic/xor_6t.sym} 450 60 0 0 {name=x7}
