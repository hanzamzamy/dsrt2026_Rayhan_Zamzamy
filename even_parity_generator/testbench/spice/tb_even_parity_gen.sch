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
C {schematic/even_parity_gen.sym} 190 -140 0 0 {name=x1}
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
C {code.sym} 370 -350 0 0 {name=s1 only_toplevel=false value=".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

* --- VOLTAGE SOURCES (Power & 8-Bit Stimulus) ---
V_SUPPLY VDD 0 1.8

* Binary Counter Pattern: Periods double to test logic combinations
V_IN0 IN_0 0 pulse(0 1.8 1ns 100ps 100ps 4ns 10ns)
V_IN1 IN_1 0 pulse(0 1.8 1ns 100ps 100ps 9ns 20ns)
V_IN2 IN_2 0 pulse(0 1.8 1ns 100ps 100ps 19ns 40ns)
V_IN3 IN_3 0 pulse(0 1.8 1ns 100ps 100ps 39ns 80ns)
V_IN4 IN_4 0 pulse(0 1.8 1ns 100ps 100ps 79ns 160ns)
V_IN5 IN_5 0 pulse(0 1.8 1ns 100ps 100ps 159ns 320ns)
V_IN6 IN_6 0 pulse(0 1.8 1ns 100ps 100ps 319ns 640ns)
V_IN7 IN_7 0 pulse(0 1.8 1ns 100ps 100ps 639ns 1280ns)

* --- SIMULATION COMMANDS ---
* Run for 200ns to capture a high variety of transition states
.tran 20p 200n
.save all

.control
  run

  * --- VISUAL THEME ---
  set color0=white
  set color1=black
  set color2=red
  set color3=blue
  set color4=darkgreen
  set xbrushwidth=3

  * --- DIGITAL VERIFICATION ---
  * Convert analog voltages to binary 1 or 0
  let b0 = v(in_0) > 0.9
  let b1 = v(in_1) > 0.9
  let b2 = v(in_2) > 0.9
  let b3 = v(in_3) > 0.9
  let b4 = v(in_4) > 0.9
  let b5 = v(in_5) > 0.9
  let b6 = v(in_6) > 0.9
  let b7 = v(in_7) > 0.9

  * Sum the bits
  let sum_bits = b0 + b1 + b2 + b3 + b4 + b5 + b6 + b7

  * Calculate Modulo 2
  let mod_2 = sum_bits - 2 * floor(sum_bits / 2)

  * If sum is odd (mod_2 = 1), output 1.8V.
  * If sum is even (mod_2 = 0), output 0V.
  let ideal_parity = mod_2 * 1.8

  * Plot physical output against the mathematical ideal
  setplot tran1
  plot v(out_parity) ideal_parity title 'Physical Output vs Ideal Mathematical Parity'

  * --- TIMING & POWER ANALYSIS ---
  setplot tran1

  * Measure Worst-Case Path Delay
  * IN_0 is the fastest switching input. Measure how long it takes to reach the output.
  meas tran t_delay trig v(in_0) val=0.9 cross=1 targ v(out_parity) val=0.9 cross=1

  * Power Analysis
  meas tran avg_i avg i(V_SUPPLY)
  let p_dyn = avg_i * 1.8 * -1

  * Measure static leakage at a stable resting point (199ns)
  meas tran leak_i find i(V_SUPPLY) at=199n
  let p_stat = leak_i * 1.8 * -1

  let pdp = p_dyn * t_delay

  * Cumulative Energy Integration
  let inst_power = -i(V_SUPPLY) * 1.8
  let total_energy = integ(inst_power)

  * --- EXPORT CLEAN REPORT ---
  echo === 8-BIT PARITY GENERATOR REPORT === > report.txt
  echo Worst-Case Path Delay: >> report.txt
  print t_delay >> report.txt
  echo Average Dynamic Power: >> report.txt
  print p_dyn >> report.txt
  echo Static Leakage Power: >> report.txt
  print p_stat >> report.txt
  echo Power Delay Product: >> report.txt
  print pdp >> report.txt

  * --- EXPORT RAW DATA ---
  * This is critical for reading 8 inputs clearly
  write parity_gen_sim.raw

  * --- EXPORT PLOTS ---
  set hcopydevtype=svg
  
  * Split inputs so the graphs are readable
  hardcopy tran_inputs_0_3.svg v(in_0) v(in_1) v(in_2) v(in_3) title 'Inputs 0-3 (Fast)'
  hardcopy tran_inputs_4_7.svg v(in_4) v(in_5) v(in_6) v(in_7) title 'Inputs 4-7 (Slow)'
  hardcopy tran_output.svg v(out_parity) title 'Even Parity Output'
  hardcopy tran_current.svg -i(V_SUPPLY) title 'Total Supply Current'
  hardcopy tran_energy.svg total_energy title 'Cumulative Energy Consumption'

  * Save Digital Verification Plot
  hardcopy tran_verification.svg v(out_parity) ideal_parity title 'Verification: Physical vs Ideal Parity'

  * --- 7. SHOW PLOTS ON SCREEN ---
  plot v(in_0) v(in_1) v(in_2) v(in_3) title 'Lower 4 Bits (IN_0 to IN_3)'
  plot v(in_4) v(in_5) v(in_6) v(in_7) title 'Upper 4 Bits (IN_4 to IN_7)'
  plot v(out_parity) title '8-Bit Even Parity Output'
  plot -i(V_SUPPLY) title 'Total Supply Current'
  plot total_energy title 'Cumulative Energy'
.endc"}
