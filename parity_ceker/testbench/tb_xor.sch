v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 0 70 -0 80 {lab=0}
N -0 -80 -0 -70 {lab=VDD}
N -80 -10 -70 -10 {lab=IN_A}
N 70 0 80 0 {lab=Y}
N -80 10 -70 10 {lab=IN_B}
C {vdd.sym} 0 -80 0 0 {name=l1 lab=VDD}
C {gnd.sym} 0 80 0 0 {name=l2 lab=0}
C {ipin.sym} -80 -10 0 0 {name=p1 lab=IN_A}
C {opin.sym} 80 0 0 0 {name=p2 lab=Y}
C {code.sym} 140 -180 0 0 {name=s1 only_toplevel=false value=".lib /foss/pdks/sky130A/libs.tech/ngspice/sky130.lib.spice tt

* --- 0. VOLTAGE SOURCES ---
V_SUPPLY VDD 0 1.8
* IN_A period is 40ns, IN_B period is 20ns to test all 4 states (00, 01, 10, 11)
V_A IN_A 0 pulse(0 1.8 1ns 100ps 100ps 19ns 40ns)
V_B IN_B 0 pulse(0 1.8 1ns 100ps 100ps 9ns 20ns)

* --- 1. SIMULATION COMMANDS ---
.tran 10p 100n
.dc V_A 0 1.8 0.01
.save all

.control
  run
  
  * --- 2. VISUAL THEME (WHITE BACKGROUND) ---
  set color0=white
  set color1=black
  set color2=red
  set color3=blue
  set color4=darkgreen
  set xbrushwidth=3

  * --- 3. TIMING & POWER ANALYSIS ---
  setplot tran1
  
  * Universal Delay: measures time between first input crossing and first output crossing
  meas tran t_delay trig v(in_a) val=0.9 cross=1 targ v(y) val=0.9 cross=1
  
  * Power Analysis
  meas tran avg_i avg i(V_SUPPLY)
  let p_dyn = avg_i * 1.8 * -1

  meas tran leak_i find i(V_SUPPLY) at=99n
  let p_stat = leak_i * 1.8 * -1

  let pdp = p_dyn * t_delay

  * --- 4. EXPORT CLEAN REPORT ---
  * Note: Avoid double quotes to prevent Xschem parsing errors
  echo === UNIVERSAL GATE REPORT === > report.txt
  echo Propagation Delay: >> report.txt
  print t_delay >> report.txt
  echo Dynamic Power: >> report.txt
  print p_dyn >> report.txt
  echo Static Power: >> report.txt
  print p_stat >> report.txt
  echo Power Delay Product: >> report.txt
  print pdp >> report.txt

  * --- 5. ADVANCED DATA PROCESSING & RAW EXPORT ---
  setplot tran1
  let inst_power = -i(V_SUPPLY) * 1.8
  let total_energy = integ(inst_power)

  * Export pristine raw simulation data for Gaw / GTKWave
  write universal_gate.raw

  * --- 6. EXPORT PLOTS (SVG) ---
  set hcopydevtype=svg
  
  * Save DC Sweeps
  setplot dc1
  hardcopy dc_vtc.svg v(y) vs v(in_a) title 'DC: VTC'
  hardcopy dc_gain.svg v(y) vs v(in_a) deriv(v(y)) xl 0 1.8 yl -5 1.8 title 'DC: VTC and Noise Margins'
  
  * Save Transient Plots (Separated cleanly)
  setplot tran1
  hardcopy tran_inputs.svg v(in_a) v(in_b) title 'Transient: Logic Inputs'
  hardcopy tran_output.svg v(y) title 'Transient: Logic Output'
  hardcopy tran_current.svg -i(V_SUPPLY) title 'Transient: Total Supply Current'
  hardcopy tran_energy.svg total_energy title 'Transient: Cumulative Energy'
  hardcopy tran_leakage.svg -i(V_SUPPLY) yl 0 10n title 'Transient: Static Leakage Zoom'
  
  * --- 7. SHOW PLOTS ON SCREEN ---
  * DC Plots
  setplot dc1
  plot v(y) vs v(in_a) title 'VTC'
  plot v(y) vs v(in_a) deriv(v(y)) xl 0 1.8 yl -5 1.8 title 'VTC and Noise Margins'
  
  * Transient Plots (Separated cleanly)
  setplot tran1
  plot v(in_a) v(in_b) title 'Logic Inputs (IN_A, IN_B)'
  plot v(y) title 'Logic Output (Y)'
  plot -i(V_SUPPLY) title 'Total Supply Current (Crowbar & Dynamic)'
  plot total_energy title 'Cumulative Energy Consumption'
  plot -i(V_SUPPLY) yl 0 10n title 'Static Leakage Current Zoom'
.endc"}
C {schematic/xor_6t.sym} 40 90 0 0 {name=x1}
C {ipin.sym} -80 10 0 0 {name=p3 lab=IN_B}
