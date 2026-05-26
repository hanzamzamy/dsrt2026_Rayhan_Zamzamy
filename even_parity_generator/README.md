# 8-Bit Even Parity Generator

This project presents the design, simulation, and analysis of an 8-bit even parity generator at the transistor level. The primary goal is to explore and compare different logic gate implementations to achieve an optimal balance of performance, power consumption, and area using open-source EDA tools.

## Prerequisites

To reproduce the results of this project, a containerized environment is used to ensure a consistent and standardized toolchain.

1.  **Docker & Docker Compose**: Must be installed on your system.
2.  **X11 Server (for Windows/macOS)**: Required to render GUI applications like Xschem.
    *   **Windows**: Use [VcXsrv](https://sourceforge.net/projects/vcxsrv/) or the built-in X-server with WSLg.
    *   **macOS**: Use [XQuartz](https://www.xquartz.org/).

## Reproduction Workflow

This project is designed to be run inside a specific Docker container that provides all the necessary open-source EDA tools (NGSPICE, Xschem, Icarus Verilog, etc.).

### 1. Clone the Repository

First, clone the project repository. This project uses Git LFS to track large simulation output files (`.raw`). If you wish to avoid downloading these files to save space and time, you can set the following environment variable before cloning.

```bash
export GIT_LFS_SKIP_SMUDGE=1
git clone https://github.com/hanzamzamy/dsrt2026_Rayhan_Zamzamy.git dsrt2026_Rayhan_Zamzamy
cd dsrt2026_Rayhan_Zamzamy
```

### 2. Set Up the Environment

The provided `docker_env` directory contains the necessary files to build and run the development environment.

1.  **Navigate to the `docker_env` directory:**
    ```bash
    cd docker_env
    ```

2.  **Build and start the container:**
    This command builds a custom Docker image based on `hpretl/iic-osic-tools` with ZSH support and starts a container named `dsrt`. It mounts the project directory into `/workspace` inside the container.
    ```bash
    mkdir home workspace
    docker compose up -d --build
    ```

3.  **Copy project to container:** 
    To make the project accessible from the container, copy it to mounted endpoint.
    ```bash
    cp ../even_parity_generator workspace
    ```

4.  **Access the container's shell:**
    ```bash
    docker compose exec ic_design zsh
    ```
    You are now inside the container.

### 3. Run Analog Simulations (NGSPICE)

The analog simulations are performed using NGSPICE to measure performance metrics.

1.  **Navigate to the simulation directory:**
    ```bash
    cd /workspace/even_parity_generator/simulation/spice/<simulation-name>
    ```

2.  **Run a simulation:**
    You can run any of the testbench files. For example, to simulate the balanced 6T XOR implementation:
    ```bash
    ngspice -b tb_<simulation-name>.spice
    ```
    This will generate a `report.txt` file with the simulation results and a large `.raw` file containing the waveform data.

    **Note on LFS**: The `.raw` waveform files are tracked using Git LFS. If you skipped downloading them during the clone, you must run the simulations to generate them locally.

### 4. Run Digital Verification (Verilog)

An exhaustive digital verification is performed using Icarus Verilog to confirm the logical correctness of the designs for all 256 possible 8-bit inputs.

1.  **Navigate to the testbench directory:**
    ```bash
    cd /workspace/even_parity_generator/simulation/verilog/<testbench-name>
    ```

2.  **Run the testbench:**
    The following commands run the testbench.
    ```bash
    export LD_LIBRARY_PATH=/foss/tools/iverilog/lib:$LD_LIBRARY_PATH
    ./<testbench-name>
    ```

### 5. Developing

Almost all works done from root directory of this project. Xschem and Magic called from root to ensure their respective `rc` file loaded to do setup such as PDK selection, etc. So, make sure to be at root.
```bash
cd /workspace/even_parity_generator/
```

## Implementations & Topologies

This project explores the trade-offs between different logic gate implementations and circuit topologies.

### Core Logic Gates
- **12T XOR**: The conventional CMOS implementation with 12 transistors, providing a robust, full rail-to-rail output.
- **6T XOR**: A transmission-gate-based topology that reduces the transistor count to 6 but suffers from output voltage degradation.
- **Buffered 6T XNOR**: An optimized design using a 6T XNOR followed by an inverter. It maintains a low transistor count while restoring the output signal to full rail-to-rail levels.

### Circuit Topologies
- **Cascaded**: A simple, chain-like structure. While easy to design, it results in a long and variable propagation delay path.
- **Balanced Tree**: A hierarchical structure that ensures every input signal path traverses the same number of gates, resulting in a more uniform and predictable propagation delay.

The analysis compares five primary combinations:
1.  XOR 6T (Cascaded)
2.  XOR 6T (Balanced)
3.  XOR 12T (Cascaded)
4.  XOR 12T (Balanced)
5.  XNOR 6T (Buffered, Balanced)

## Directory Structure

- **`/schematic`**: Contains the Xschem (`.sch`) files for all logic gates and top-level designs.
- **`/netlist`**: Contains the generated netlists.
    - **`/spice`**: SPICE (`.spice`) netlists for analog simulation.
    - **`/verilog`**: Verilog (`.v`) netlists for digital verification.
- **`/simulation`**: Holds testbenches and simulation results.
    - **`/spice`**: NGSPICE testbenches, output reports.
    - **`/verilog`**: Contains the compiled Verilog simulation executables.
- **`/testbench`**:
    - **`/spice`**: Xschem schematics (`.sch`) for the SPICE testbenches.
    - **`/verilog`**: Verilog source code for functional verification.
- **`/layout`**: Intended for physical layout files.
- **`/report`**: Contains the final project report.

## Verification

The functional correctness of the designs was validated using a hierarchical approach:
1.  **Analog Simulation (SPICE)**: Transient analysis was performed on each gate and the full 8-bit generator to confirm logical behavior and measure timing/power characteristics.
2.  **Digital Verification (Verilog)**: An exhaustive Verilog testbench was created to validate the logic for all 256 possible input combinations.

## Simulation Results Summary

The following tables summarize the key performance metrics for the different implementations, as measured from the SPICE simulations.

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

### Digital Verification Results

| Implementation | Success | Fail | Success Rate |
| :--- | :---: | :---: | :---: |
| XOR (Balanced) | 256 | 0 | 100% |
| XOR (Unbalanced) | 256 | 0 | 100% |
| XNOR (Balanced) | 256 | 0 | 100% |

## Todo
- [x] Gate-level schematic
- [x] Gate-level simulation
- [x] Circuit-level schematic
- [x] Circuit-level simulation
- [] Gate-level Layout
- [] Circuit-level Layout
- [] Final report