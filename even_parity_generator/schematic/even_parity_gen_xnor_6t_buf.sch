v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -360 -440 -360 -430 {lab=VDD}
N 120 -380 130 -380 {lab=VDD}
N 120 -350 130 -350 {lab=GND}
N -360 -290 -360 -280 {lab=GND}
N -360 -230 -360 -220 {lab=VDD}
N -360 -80 -360 -70 {lab=GND}
N -360 -20 -360 -10 {lab=VDD}
N -360 130 -360 140 {lab=GND}
N -360 190 -360 200 {lab=VDD}
N -360 340 -360 350 {lab=GND}
N -130 -330 -130 -320 {lab=VDD}
N -130 -180 -130 -170 {lab=GND}
N -130 90 -130 100 {lab=VDD}
N -130 240 -130 250 {lab=GND}
N -230 -260 -210 -260 {lab=#net1}
N -230 -360 -230 -260 {lab=#net1}
N -280 -360 -230 -360 {lab=#net1}
N -230 -240 -210 -240 {lab=#net2}
N -230 -240 -230 -150 {lab=#net2}
N -280 -150 -230 -150 {lab=#net2}
N 100 -120 100 -110 {lab=VDD}
N 100 30 100 40 {lab=GND}
N -230 160 -210 160 {lab=#net3}
N -230 60 -230 160 {lab=#net3}
N -280 60 -230 60 {lab=#net3}
N -230 180 -210 180 {lab=#net4}
N -230 180 -230 270 {lab=#net4}
N -280 270 -230 270 {lab=#net4}
N 0 -30 20 -30 {lab=#net5}
N -0 -30 -0 170 {lab=#net5}
N -50 170 -0 170 {lab=#net5}
N 0 -50 20 -50 {lab=#net6}
N -0 -250 0 -50 {lab=#net6}
N -50 -250 0 -250 {lab=#net6}
N -460 260 -440 260 {lab=I6}
N -460 280 -440 280 {lab=I7}
N -460 50 -440 50 {lab=I4}
N -460 70 -440 70 {lab=I5}
N -460 -160 -440 -160 {lab=I2}
N -460 -140 -440 -140 {lab=I3}
N -460 -370 -440 -370 {lab=I0}
N -460 -350 -440 -350 {lab=I1}
N 180 -40 200 -40 {lab=#net7}
N 270 30 270 40 {lab=GND}
N 270 -120 270 -110 {lab=VDD}
N 340 -40 360 -40 {lab=xxx}
C {schematic/xnor_6t_buf.sym} -420 -230 0 0 {name=x1}
C {iopin.sym} 120 -380 0 1 {name=p1 lab=VDD}
C {iopin.sym} 120 -350 0 1 {name=p2 lab=GND}
C {lab_wire.sym} -360 -440 0 0 {name=p3 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 130 -380 0 1 {name=p4 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 130 -350 0 1 {name=p5 sig_type=std_logic lab=GND}
C {lab_wire.sym} -360 -280 2 1 {name=p6 sig_type=std_logic lab=GND}
C {schematic/xnor_6t_buf.sym} -420 -20 0 0 {name=x2}
C {lab_wire.sym} -360 -230 0 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -360 -70 2 1 {name=p8 sig_type=std_logic lab=GND}
C {schematic/xnor_6t_buf.sym} -420 190 0 0 {name=x3}
C {lab_wire.sym} -360 -20 0 0 {name=p9 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -360 140 2 1 {name=p10 sig_type=std_logic lab=GND}
C {schematic/xnor_6t_buf.sym} -420 400 0 0 {name=x4}
C {lab_wire.sym} -360 190 0 0 {name=p11 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -360 350 2 1 {name=p12 sig_type=std_logic lab=GND}
C {schematic/xnor_6t_buf.sym} -190 -120 0 0 {name=x5}
C {lab_wire.sym} -130 -330 0 0 {name=p13 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -130 -170 2 1 {name=p14 sig_type=std_logic lab=GND}
C {schematic/xnor_6t_buf.sym} -190 300 0 0 {name=x6}
C {lab_wire.sym} -130 90 0 0 {name=p15 sig_type=std_logic lab=VDD}
C {lab_wire.sym} -130 250 2 1 {name=p16 sig_type=std_logic lab=GND}
C {schematic/xnor_6t_buf.sym} 40 90 0 0 {name=x7}
C {lab_wire.sym} 100 -120 0 0 {name=p17 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 100 40 2 1 {name=p18 sig_type=std_logic lab=GND}
C {ipin.sym} -460 -370 0 0 {name=p20 lab=I0}
C {ipin.sym} -460 -350 0 0 {name=p21 lab=I1}
C {ipin.sym} -460 -160 0 0 {name=p22 lab=I2}
C {ipin.sym} -460 -140 0 0 {name=p23 lab=I3}
C {ipin.sym} -460 50 0 0 {name=p24 lab=I4}
C {ipin.sym} -460 70 0 0 {name=p25 lab=I5}
C {ipin.sym} -460 260 0 0 {name=p26 lab=I6}
C {ipin.sym} -460 280 0 0 {name=p27 lab=I7}
C {schematic/not_std.sym} 160 50 0 0 {name=x8}
C {lab_wire.sym} 270 -120 0 0 {name=p19 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 270 40 2 1 {name=p28 sig_type=std_logic lab=GND}
C {opin.sym} 360 -40 0 0 {name=p29 lab=O0}
