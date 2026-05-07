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
N 100 -90 100 -70 {lab=VDD}
N 100 70 100 90 {lab=0}
N 100 40 180 40 {lab=0}
N 180 40 180 80 {lab=0}
N 100 80 180 80 {lab=0}
N 180 -80 180 -40 {lab=VDD}
N 100 -40 180 -40 {lab=VDD}
N 100 -80 180 -80 {lab=VDD}
N 40 -0 50 -0 {lab=Vin}
N 100 0 110 0 {lab=Vout}
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
C {vdd.sym} 100 -90 0 0 {name=l1 lab=VDD

}
C {gnd.sym} 100 90 0 0 {name=l2 lab=0}
C {code_shown.sym} 200 -150 0 0 {name=SIM_INVERTER
value="
.lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

* Voltage source definition
Vdd vdd 0 1.8
Vin Vin 0 pulse(0 1.8 1ns 100ps 100ps 2ns 4ns)

* Transient simulation
.tran 10ps 10ns

* DC sweep simulation (input from 0V to 1.8V)
.dc Vin 0 1.8 0.01

.control
save all
run

* Plot setting
set color0=white
set color1=black
set color2=red
set color3=blue
set xbrushwidth=3

* Show plot
plot Vin Vout
plot Vout vs Vin

* Export to svg
set hcopydevtype=svg

* Save plot
hardcopy ~/tmp/grafik_transient.svg Vin Vout
hardcopy ~/tmp/grafik_dc.svg Vout vs Vin
.endc
"}
