v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 40 80 40 90 {lab=Y}
N 40 90 40 100 {lab=Y}
N 40 90 130 90 {lab=Y}
N -10 130 -0 130 {lab=A}
N -10 90 -10 130 {lab=A}
N -10 50 -10 90 {lab=A}
N -10 50 -0 50 {lab=A}
N -30 90 -10 90 {lab=A}
N 40 130 120 130 {lab=#net1}
N 120 130 120 170 {lab=#net1}
N 40 160 40 170 {lab=#net1}
N 40 170 120 170 {lab=#net1}
N 40 50 120 50 {lab=VDD}
N 120 10 120 50 {lab=VDD}
N 40 10 120 10 {lab=VDD}
N 40 10 40 20 {lab=VDD}
N 40 0 40 10 {lab=VDD}
N 40 170 40 180 {lab=#net1}
C {sky130_fd_pr/pfet_01v8.sym} 20 50 0 0 {name=M1
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
C {sky130_fd_pr/nfet_01v8.sym} 20 130 0 0 {name=M2
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
C {ipin.sym} -30 90 0 0 {name=p1 lab=A
}
C {opin.sym} 130 90 0 0 {name=p2 lab=Y}
C {iopin.sym} 40 0 3 0 {name=p3 lab=VDD
}
C {iopin.sym} 40 180 1 0 {name=p4 lab=GND}
