v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
P 4 1 60 -120 {}
N -160 -170 -140 -170 {lab=Vin}
N 160 -150 180 -150 {lab=Vout}
N 160 -170 170 -170 {lab=VDD}
N 170 -180 170 -170 {lab=VDD}
N 160 -130 170 -130 {lab=0}
N 170 -130 170 -120 {lab=0}
C {code_shown.sym} 290 -370 0 0 {name=s1 only_toplevel=false value="
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
"
}
C {vdd.sym} 170 -180 0 0 {name=l1 lab=VDD}
C {gnd.sym} 170 -120 0 0 {name=l2 lab=0}
C {ipin.sym} -160 -170 0 0 {name=p1 lab=Vin
}
C {opin.sym} 180 -150 0 0 {name=p2 lab=Vout
}
C {schematic/cmos_inverter.sym} 10 -150 0 0 {name=x1}
