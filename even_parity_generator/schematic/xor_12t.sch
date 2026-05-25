v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 60 -30 60 -20 {lab=A_inv}
N 60 -40 60 -30 {lab=A_inv}
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
N -10 -30 10 -30 {lab=A}
N -20 -30 -10 -30 {lab=A}
N 60 -30 140 -30 {lab=A_inv}
N 270 -30 270 -20 {lab=B_inv}
N 270 -40 270 -30 {lab=B_inv}
N 270 -110 270 -100 {lab=VDD}
N 270 -110 350 -110 {lab=VDD}
N 350 -110 350 -70 {lab=VDD}
N 270 -70 350 -70 {lab=VDD}
N 270 10 350 10 {lab=GND}
N 350 10 350 50 {lab=GND}
N 270 50 350 50 {lab=GND}
N 270 40 270 50 {lab=GND}
N 220 -70 230 -70 {lab=B}
N 220 -70 220 -30 {lab=B}
N 220 -30 220 10 {lab=B}
N 220 10 230 10 {lab=B}
N 200 -30 220 -30 {lab=B}
N 190 -30 200 -30 {lab=B}
N 310 -30 350 -30 {lab=B_inv}
N 140 50 270 50 {lab=GND}
N 140 -110 270 -110 {lab=VDD}
N 480 10 560 10 {lab=VDD}
N 560 -70 560 10 {lab=VDD}
N 480 -70 560 -70 {lab=VDD}
N 480 -110 480 -100 {lab=VDD}
N 480 -110 560 -110 {lab=VDD}
N 560 -110 560 -70 {lab=VDD}
N 680 10 760 10 {lab=VDD}
N 760 -70 760 10 {lab=VDD}
N 680 -70 760 -70 {lab=VDD}
N 680 -110 680 -100 {lab=VDD}
N 680 -110 760 -110 {lab=VDD}
N 760 -110 760 -70 {lab=VDD}
N 480 50 480 60 {lab=Y}
N 480 40 480 50 {lab=Y}
N 480 -40 480 -20 {lab=#net1}
N 680 -40 680 -20 {lab=#net2}
N 520 50 680 50 {lab=Y}
N 480 120 480 140 {lab=#net3}
N 480 90 560 90 {lab=GND}
N 560 90 560 170 {lab=GND}
N 480 170 560 170 {lab=GND}
N 480 200 480 210 {lab=GND}
N 480 210 560 210 {lab=GND}
N 560 170 560 210 {lab=GND}
N 680 120 680 140 {lab=#net4}
N 680 90 760 90 {lab=GND}
N 760 90 760 170 {lab=GND}
N 680 170 760 170 {lab=GND}
N 680 200 680 210 {lab=GND}
N 680 210 760 210 {lab=GND}
N 760 170 760 210 {lab=GND}
N 680 40 680 50 {lab=Y}
N 680 50 680 60 {lab=Y}
N 600 -110 680 -110 {lab=VDD}
N 680 50 760 50 {lab=Y}
N 600 210 680 210 {lab=GND}
N 390 10 440 10 {lab=A_inv}
N 560 -110 600 -110 {lab=VDD}
N 480 50 520 50 {lab=Y}
N 560 210 600 210 {lab=GND}
N 590 10 640 10 {lab=B_inv}
N 590 -70 640 -70 {lab=A}
N 390 -70 440 -70 {lab=B}
N 590 90 640 90 {lab=A_inv}
N 590 170 640 170 {lab=B_inv}
N 390 90 440 90 {lab=A}
N 390 170 440 170 {lab=B}
N 270 -30 310 -30 {lab=B_inv}
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
C {opin.sym} 760 50 0 0 {name=p2 lab=Y
}
C {iopin.sym} 60 -120 3 0 {name=p3 lab=VDD}
C {iopin.sym} 60 60 1 0 {name=p4 lab=GND}
C {lab_wire.sym} 520 -110 0 0 {name=p6 sig_type=std_logic lab=VDD}
C {lab_wire.sym} 100 -30 0 1 {name=p13 sig_type=std_logic lab=A_inv
}
C {sky130_fd_pr/pfet_01v8.sym} 250 -70 0 0 {name=M3
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
C {sky130_fd_pr/nfet_01v8.sym} 250 10 0 0 {name=M4
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
C {ipin.sym} 190 -30 0 0 {name=p5 lab=B}
C {lab_wire.sym} 520 210 2 1 {name=p12 sig_type=std_logic lab=GND

}
C {lab_wire.sym} 310 -30 0 1 {name=p14 sig_type=std_logic lab=B_inv
}
C {sky130_fd_pr/pfet_01v8.sym} 460 -70 0 0 {name=M5
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
C {sky130_fd_pr/pfet_01v8.sym} 460 10 0 0 {name=M6
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
C {sky130_fd_pr/pfet_01v8.sym} 660 -70 0 0 {name=M7
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
C {sky130_fd_pr/pfet_01v8.sym} 660 10 0 0 {name=M8
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
C {sky130_fd_pr/nfet_01v8.sym} 460 90 0 0 {name=M9
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
C {sky130_fd_pr/nfet_01v8.sym} 460 170 0 0 {name=M10
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
C {sky130_fd_pr/nfet_01v8.sym} 660 90 0 0 {name=M11
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
C {sky130_fd_pr/nfet_01v8.sym} 660 170 0 0 {name=M12
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
C {lab_wire.sym} 390 10 0 1 {name=p7 sig_type=std_logic lab=A_inv
}
C {lab_wire.sym} 590 10 0 1 {name=p9 sig_type=std_logic lab=B_inv
}
C {lab_wire.sym} 590 -70 0 1 {name=p10 sig_type=std_logic lab=A
}
C {lab_wire.sym} 390 -70 0 1 {name=p11 sig_type=std_logic lab=B
}
C {lab_wire.sym} 590 90 0 1 {name=p15 sig_type=std_logic lab=A_inv
}
C {lab_wire.sym} 590 170 0 1 {name=p16 sig_type=std_logic lab=B_inv
}
C {lab_wire.sym} 390 90 0 1 {name=p17 sig_type=std_logic lab=A

}
C {lab_wire.sym} 390 170 0 1 {name=p18 sig_type=std_logic lab=B
}
