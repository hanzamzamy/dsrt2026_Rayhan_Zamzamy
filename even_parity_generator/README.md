# 8-Bit Even Parity Generator

This project presents the design, simulation, and analysis of an 8-bit even parity generator at the transistor level. The primary goal is to explore and compare different logic gate implementations to achieve an optimal balance of performance, power consumption, and area.

## Implementations & Topologies

This project explores the trade-offs between different logic gate implementations and circuit topologies.

### Core Logic Gates
- **12T XOR**: The conventional CMOS implementation with 12 transistors, providing a robust, full rail-to-rail output.
- **6T XOR**: A transmission-gate-based topology that reduces the transistor count to 6 but suffers from output voltage degradation.
- **Buffered 6T XNOR**: An optimized design using a 6T XOR followed by an inverter. It maintains a low transistor count while restoring the output signal to full rail-to-rail levels.

### Circuit Topologies
- **Cascaded**: A simple, chain-like structure. While easy to design, it results in a long and variable propagation delay path, as early inputs must travel through all subsequent gates.
- **Balanced Tree**: A hierarchical structure that ensures every input signal path traverses the same number of gates. This results in a more uniform and predictable propagation delay, making it superior for high-performance applications.

The analysis compares five primary combinations:
1.  XOR 6T (Cascaded)
2.  XOR 6T (Balanced)
3.  XOR 12T (Cascaded)
4.  XOR 12T (Balanced)
5.  XNOR 6T (Balanced) - _Note: XNOR is only suitable for the balanced topology in this parity application._

## Directory Structure

- **`/schematic`**: Contains the Xschem schematic files for all logic gates and top-level parity generator designs.
- **`/simulations`**: Includes the testbenches and simulation results from NGSPICE. Each sub-directory corresponds to a specific simulation run. The `report.txt` files contain key performance metrics.
- **`/testbench`**:
    - **`/spice`**: Holds the SPICE testbench schematics.
    - **`/verilog`**: Contains the Verilog code for functional verification. This includes behavioral models of the gates and an exhaustive testbench (`tb_even_parity_gen.v`) that validates the parity generator for all 256 possible 8-bit inputs.
- **`/layout`**: (Placeholder) This directory is intended for the physical layout of the designs (e.g., using Magic).

## Simulation Results Summary

The following tables summarize the key performance metrics for the different implementations.

### Gate-Level Performance

| Gate | Propagation Delay | Rise Time | Fall Time | Dynamic Power | Static Power | Power-Delay Product |
|---|---|---|---|---|---|---|
| **NOT Gate** | 18.97 ps | 30.47 ps | 21.95 ps | 111.08 nW | 0.58 nW | 2.11 fJ |
| **XOR 6T** | 9.13 ns | 9.19 ns | 19.01 ns | 73.08 nW | 0.59 nW | 667.40 fJ |
| **XOR 12T** | 9.17 ns | 9.16 ns | 19.10 ns | 2.41 µW | 11.06 nW | 22.11 pJ |
| **XNOR 6T (Buffered)** | 9.16 ns | 20.03 ps | 15.35 ps | 361.34 nW | 1.62 nW | 3.31 pJ |

### 8-Bit Parity Generator Performance

| Implementation | Worst-Case Delay | Output Rise Time | Output Fall Time | Average Dynamic Power | Static Leakage Power | Power-Delay Product |
|---|---|---|---|---|---|---|
| **XOR 6T (Cascaded)** | 14.79 ps | 8.93 ns | 5.94 ns | 12.98 µW | 6.16 nW | 0.19 pJ |
| **XOR 6T (Balanced)** | 4.30 ns | 9.11 ns | 5.87 ns | 5.55 µW | 57.44 nW | 23.87 pJ |
| **XOR 12T (Cascaded)** | 75.02 ps | 8.95 ns | 5.82 ns | 51.17 µW | 195.35 nW | 3.84 pJ |
| **XOR 12T (Balanced)** | 4.40 ns | 60.49 ps | 60.95 ps | 22.68 µW | 104.18 nW | 99.69 pJ |
| **XNOR 6T (Balanced)** | 4.34 ns | 29.52 ps | 21.62 ps | 24.23 µW | 25.28 nW | 105.09 pJ |

## Verification

The functional correctness of the designs was validated using a hierarchical approach:
1.  **Analog Simulation (SPICE)**: Transient analysis was performed on each gate and the full 8-bit generator to confirm logical behavior and measure timing/power characteristics.
2.  **Digital Verification (Verilog)**: An exhaustive Verilog testbench was created to validate the logic for all 256 possible input combinations. All tested designs (XOR-based and XNOR-based) achieved 100% success, confirming their logical correctness.
