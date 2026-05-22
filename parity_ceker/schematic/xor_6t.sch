v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 60 -30 60 -20 {lab=#net1}
N 60 -40 60 -30 {lab=#net1}
N 60 -30 160 -30 {lab=#net1}
N 60 -110 60 -100 {lab=VDD}
N 60 -120 60 -110 {lab=VDD}
N 60 -110 140 -110 {lab=VDD}
N 140 -110 140 -70 {lab=VDD}
N 60 -70 140 -70 {lab=VDD}
N 60 10 140 10 {lab=GND}
N 140 10 140 50 {lab=GND}
N 60 50 140 50 {lab=GND}
N 60 40 60 50 {lab=GND}
N 60 50 60 60 {lab=GND}
N 10 -70 20 -70 {lab=A}
N 10 -70 10 -30 {lab=A}
N 10 -30 10 10 {lab=A}
N 10 10 20 10 {lab=A}
N 280 -30 280 -20 {lab=Y}
N 280 -40 280 -30 {lab=Y}
N 280 -30 380 -30 {lab=Y}
N 280 -110 280 -100 {lab=A}
N 280 -120 280 -110 {lab=A}
N 360 -110 360 -70 {lab=VDD}
N 280 -70 360 -70 {lab=VDD}
N 280 10 360 10 {lab=GND}
N 360 10 360 50 {lab=GND}
N 280 40 280 50 {lab=#net1}
N 280 50 280 60 {lab=#net1}
N 230 -70 240 -70 {lab=#net2}
N 230 -70 230 -30 {lab=#net2}
N 230 -30 230 10 {lab=#net2}
N 230 10 240 10 {lab=#net2}
N 210 -30 230 -30 {lab=#net2}
N -10 -30 10 -30 {lab=A}
N -20 -30 -10 -30 {lab=A}
N -10 -200 -10 -30 {lab=A}
N -10 -200 280 -200 {lab=A}
N 280 -200 280 -120 {lab=A}
N 280 60 280 140 {lab=#net1}
N 160 140 280 140 {lab=#net1}
N 160 -30 160 140 {lab=#net1}
N 460 40 470 40 {lab=Y}
N 460 -30 460 40 {lab=Y}
N 460 -110 460 -30 {lab=Y}
N 460 -110 470 -110 {lab=Y}
N 380 -30 460 -30 {lab=Y}
N 530 -110 540 -110 {lab=B}
N 530 40 540 40 {lab=B}
N 540 -30 540 40 {lab=B}
N 540 -110 540 -30 {lab=B}
N 370 -50 380 -50 {lab=Y}
N 370 -50 370 -30 {lab=Y}
N 500 -110 500 -70 {lab=VDD}
N 500 -70 560 -70 {lab=VDD}
N 560 -110 560 -70 {lab=VDD}
N 500 0 500 40 {lab=GND}
N 500 0 560 -0 {lab=GND}
N 560 -0 560 40 {lab=GND}
N 280 -200 500 -200 {lab=A}
N 500 -200 500 -150 {lab=A}
N 280 140 500 140 {lab=#net1}
N 500 80 500 140 {lab=#net1}
N 540 -30 580 -30 {lab=B}
C {sky130_fd_pr/pfet_01v8.sym} 40 -70 0 0 {name=M1
W=2
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 40 10 0 0 {name=M2
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {ipin.sym} -20 -30 0 0 {name=p1 lab=A}
C {opin.sym} 380 -50 0 0 {name=p2 lab=Y
}
C {iopin.sym} 60 -120 3 0 {name=p3 lab=VDD}
C {iopin.sym} 60 60 1 0 {name=p4 lab=GND}
C {sky130_fd_pr/pfet_01v8.sym} 260 -70 0 0 {name=M3
W=2
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 260 10 0 0 {name=M4
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 500 -130 1 0 {name=M5
W=2
L=0.15
nf=1
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 500 60 3 0 {name=M6
W=1
L=0.15
nf=1 
mult=1
ad="expr('int((@nf + 1)/2) * @W / @nf * 0.29')"
pd="expr('2*int((@nf + 1)/2) * (@W / @nf + 0.29)')"
as="expr('int((@nf + 2)/2) * @W / @nf * 0.29')"
ps="expr('2*int((@nf + 2)/2) * (@W / @nf + 0.29)')"
nrd="expr('0.29 / @W ')" nrs="expr('0.29 / @W ')"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {ipin.sym} 580 -30 2 0 {name=p8 lab=B}
C {lab_wire.sym} 130 -110 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 360 -80 1 0 {name=p7 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 560 -80 1 0 {name=p9 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 130 50 2 1 {name=p10 sig_type=std_logic lab=GND

}
C {lab_wire.sym} 360 20 1 1 {name=p11 sig_type=std_logic lab=GND

}
C {lab_wire.sym} 560 10 1 1 {name=p12 sig_type=std_logic lab=GND

}
C {lab_wire.sym} 540 -30 0 1 {name=p5 sig_type=std_logic lab=B}
C {lab_wire.sym} 230 -30 0 0 {name=p13 sig_type=std_logic lab=B}
