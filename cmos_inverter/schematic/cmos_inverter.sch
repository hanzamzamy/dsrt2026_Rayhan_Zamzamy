v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 50 40 60 40 {lab=Vin}
N 50 -40 60 -40 {lab=Vin}
N 50 -40 50 40 {lab=Vin}
N 100 -10 100 10 {lab=Vout}
N 100 70 100 90 {lab=xxx}
N 100 40 180 40 {lab=xxx}
N 180 40 180 80 {lab=xxx}
N 100 80 180 80 {lab=xxx}
N 180 -80 180 -40 {lab=VDD}
N 100 -40 180 -40 {lab=VDD}
N 100 -80 180 -80 {lab=VDD}
N 40 -0 50 -0 {lab=Vin}
N 100 0 110 0 {lab=Vout}
N 100 -100 100 -70 {lab=VDD}
N 100 -100 110 -100 {lab=VDD}
N 100 90 100 100 {lab=xxx}
N 100 100 110 100 {lab=xxx}
C {sky130_fd_pr/nfet_01v8.sym} 80 40 0 0 {name=M1
W=8
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
C {sky130_fd_pr/pfet_01v8.sym} 80 -40 0 0 {name=M2
W=24
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
C {ipin.sym} 40 0 0 0 {name=p1 lab=Vin


}
C {opin.sym} 110 0 0 0 {name=p2 lab=Vout}
C {iopin.sym} 110 -100 0 0 {name=p3 lab=VDD}
C {iopin.sym} 110 100 0 0 {name=p4 lab=VSS}
