
# 1. OpenFASOC
OpenFASoC is a project focused on automated analog generation from user specification to GDSII with fully open-sourced tools. It is led by a team of researchers at the University of Michigan and is inspired from FASoC which sits on proprietary software.

The tool is comprised of analog and mixed-signal circuit generators, which automatically create a physical design based on user specifications.

# 2. Installation
## 2.1 Installing OpenFASOC
First, cd into a directory of your choice and clone the OpenFASoC repository:

`git clone https://github.com/idea-fasoc/openfasoc`

Now go to the home location of this repository (where the README.rst file is located) and run sudo ./dependencies.sh. 

## 2.2 Installing OpenROAD
OpenROAD is an integrated chip physical design tool that takes a design from synthesized Verilog to routed layout.

An outline of steps used to build a chip using OpenROAD is shown below:

1. Initialize floorplan - define the chip size and cell rows
2. Place pins (for designs without pads )
3. Place macro cells (RAMs, embedded macros)
4. Insert substrate tap cells
5. Insert power distribution network
6. Macro Placement of macro cells
7. Global placement of standard cells
8. Repair max slew, max capacitance, and max fanout violations and long wires
9. Clock tree synthesis
10. Optimize setup/hold timing
11. Insert fill cells
12. Global routing (route guides for detailed routing)
13. Antenna repair
14. Detailed routing
15. Parasitic extraction
16. Static timing analysis

To install OpenROAD:

``` 
  cd
  git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD.git
  cd OpenROAD
  sudo ./etc/DependencyInstaller.sh
  cd
  git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts
  cd OpenROAD-flow-scripts
  ./build_openroad.sh –local
  export OPENROAD=~/OpenROAD-flow-scripts/tools/OpenROAD
  export PATH=~/OpenROAD-flow-scripts/tools/install/OpenROAD/bin:~/OpenROAD-flow-scripts/tools/install/yosys/bin:~/OpenROAD-flow-   scripts/tools/install/LSOracle/bin:$PATH
```
After install, cd into `/usr/bin` and do: `sudo ln -s /home/user/OpenROAD-dir/build/src/openroad openroad`

## 2.3 Installing Yosys
Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains. Selected features and typical applications:

Process almost any synthesizable Verilog-2005 design Built-in formal methods for checking properties and equivalence Mapping to ASIC standard cell libraries (in Liberty File Format) Mapping to Xilinx 7-Series and Lattice iCE40 and ECP5 FPGAs

To install Yosys use the following commands
``` sudo apt-get install build-essential clang bison flex \
   libreadline-dev gawk tcl-dev libffi-dev git \
   graphviz xdot pkg-config python3 libboost-system-dev \
   libboost-python-dev libboost-filesystem-dev zlib1g-dev
   
   git clone https://github.com/YosysHQ/yosys.git
   make
   sudo make install 
   make test
```
After installing Yosys, cd into `/usr/bin` and do: `sudo ln -s /home/user/yosys-dir/yosys yosys`

## 2.4 Installing Magic
Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow.

Install magic and its dependencies using the following commands. The dependencies can also be installed using Synaptic Manager. Synaptic manager can be first installed using `sudo apt install synaptic`.\

```
# Ipdate your system
    $sudo apt update
    $sudo apt install -y git
# Install build-essential tools
    $sudo apt install -y build-essential
# Install csh
    $sudo apt install -y csh
# Install x11
    $sudo apt install -y x11-apps
# Install X11
    $sudo apt install -y x11-xserver-utils
# Install OpenGL
    $sudo apt install -y libglu1-mesa-dev freeglut3-dev mesa-common-dev
# Install Tcl/Tk
    $sudo apt install -y tcl-dev tk-dev
#Install Cairo
    $sudo apt install -y libcairo2-dev
# Change to the work directory
    $cd ~/VSD_8TSRAM
# Clone the git repo
    $git clone git://opencircuitdesign.com/magic
# Change into the magic directory
    $cd magic
# Configure magic
    $./configure
# Build magic
    $make
# Install magic
    $sudo make install
```
## 2.5 Installing KLayout
KLayout is a GDS and OASIS file viewer. Downlaod the latest version of the Klayout from here. Install the following dependencies: qt5-default, qttools5-dev, libqt5xmlpatterns5-dev, qtmultimedia5-dev, libqt5multimediawidgets5 and libqt5svg5-dev.

```
sudo apt-get install -y libqt5widgets5

sudo dpkg -i klayout_0.27.11-1_amd64.deb
```
## Configuring the SKY130A path

To set the SKY130A path, got to the **~/VSD_8TSRAM/openfasoc/openfasoc/common** directory and check the contents of platform_config.json file.

``prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/openfasoc/openfasoc/common$ less platform_config.json```

<img width="398" alt="Screenshot 2023-02-24 144751" src="https://user-images.githubusercontent.com/104830557/221333984-31dff3d9-5223-4fac-bdad-e9abed109748.png">

Now modify the platform_config.json file as shown. 

<img width="586" alt="Screenshot 2023-02-24 145422" src="https://user-images.githubusercontent.com/104830557/221334050-fe7ddbea-620e-4267-9ad1-fec1b945e564.png">

# Generating the Temperature Sensor Layout

We now run a test generator to generate the layout for temperature sensor provided with OpenFASOC using these commands

```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/openfasoc/openfasoc$ cd generators/temp-sense-gen/
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/openfasoc/openfasoc/generators/temp-sense-gen$ make

```
We get this message.

```
==============================================================
   ___  _____ ______ _   _ _____  _     ____   ___   ____
  / _ \|  _  \| ____| \ | |  ___|/ \   / ___| / _ \ / ___|
 | | | | |_) ||  _| |  \| | |_  / _ \  \___ \| | | | |    
 | |_| |  __/ | |___| |\  |  _|/ ___ \  ___) | |_| | |___ 
  \___/|_|    |_____|_| \_|_| /_/   \_\|____/ \___/ \____|
===============================================================
OpenFASOC is focused on open source automated analog generation
from user specification to GDSII with fully open-sourced tools.
This project is led by a team of researchers at the University of Michigan and is inspired from FASOC
For more info, visit https://fasoc.engin.umich.edu/
IP: Temperature Sensor 
Supported Technology: Sky130A 
Supported Library: sky130hd
Targets supported:
1. make sky130hd_temp_verilog
    >> This will create the verilog file for the thermal sensor IP. It doesn't create a macro, won't create lef/def/gds files and won't run simulations 
2. make sky130hd_temp [ninv=<num>] [nhead=<num>]
    >> This will create the macro for the thermal sensor, creates the lef/def/gds/spice netlist files and performs lvs/drc checks. But this won't run simulations.
3. make sky130hd_temp_full [ninv=<num>] [nhead=<num>] [sim=pex]
    >> This will create the macro for the thermal sensor, creates the lef/def/gds/spice netlist files, performs lvs/drc checks and also runs simulations.
    >> Note: Only Pre-PEX simulations are performed, by default, under this target. To perform Post-PEX simulations as well, set sim to 'pex' as shown in the target definition
4. make clean
    >> This will clean all files generated during the run inside the run/, flow/ and work/ directories
5. make help
    >> Displays this message
  ```
  Togenerate the verilog file for the thermal sensor IP, we use the following command. This command does not create lef/def/gds file and does not run the simulation.
  
  We can then run this command. This command creates the lef/def/gds/spice netlist files and performs lvs/drc checks and won't run simulations
  ``` 
  prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/openfasoc/openfasoc/generators/temp-sense-gen$ make sky130hd_temp ninv=6 nhead=3
  ```
  Next we run this command. This will create the macro for the thermal sensor, creates the lef/def/gds/spice netlist files, performs lvs/drc checks and also runs simulations.
  ```
  prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/openfasoc/openfasoc/generators/temp-sense-gen$ make sky130hd_temp ninv=6 nhead=3 sim=pex
  ```
  Now the simulations starts with following steps. The highlights of the entire flow is show below. 
  ```
  # Parsing command line arguments...
  # Cleaning the workspace...
    target number of inverters: 6
    target number of headers: 3
  # Verilog Generation
  # Verilog Generated
  # Run Synthesis and APR
  # Floorplan
  ==========================================================================
floorplan final report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             1.68e-13   3.57e-14   5.48e-10   5.48e-10  58.0%
Combinational          9.63e-14   1.04e-13   3.96e-10   3.96e-10  42.0%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  2.65e-13   1.39e-13   9.44e-10   9.44e-10 100.0%
                           0.0%       0.0%     100.0%

==========================================================================
floorplan final report_design_area
--------------------------------------------------------------------------
Design area 1854 u^2 14% utilization.

# Global Placement
==========================================================================
global place report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             1.65e-13   5.44e-14   5.48e-10   5.48e-10  42.5%
Combinational          9.71e-14   2.42e-13   7.40e-10   7.40e-10  57.5%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  2.62e-13   2.96e-13   1.29e-09   1.29e-09 100.0%
                           0.0%       0.0%     100.0%

==========================================================================
global place report_design_area
--------------------------------------------------------------------------
Design area 2559 u^2 19% utilization.

Placement Analysis
---------------------------------
total displacement        917.0 u
average displacement        2.3 u
max displacement           53.7 u
original HPWL            4373.5 u
legalized HPWL           4785.2 u
delta HPWL                    9 %

[INFO DPL-0020] Mirrored 64 instances
[INFO DPL-0021] HPWL before            4785.2 u
[INFO DPL-0022] HPWL after             4700.4 u
[INFO DPL-0023] HPWL delta               -1.8 %
[INFO FLW-0012] Placement violations .

# Detailed Placement

==========================================================================
detailed place report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             1.64e-13   5.49e-14   5.48e-10   5.48e-10  42.5%
Combinational          9.70e-14   2.50e-13   7.40e-10   7.40e-10  57.5%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  2.61e-13   3.04e-13   1.29e-09   1.29e-09 100.0%
                           0.0%       0.0%     100.0%

==========================================================================
detailed place report_design_area
--------------------------------------------------------------------------
Design area 2559 u^2 19% utilization.

# Routing
[INFO GRT-0020] Min routing layer: met1
[INFO GRT-0021] Max routing layer: met5
[INFO GRT-0022] Global adjustment: 0%
[INFO GRT-0023] Grid origin: (0, 0)
[INFO GRT-0043] No OR_DEFAULT vias defined.
[INFO GRT-0088] Layer li1     Track-Pitch = 0.4600  line-2-Via Pitch: 0.3400
[INFO GRT-0088] Layer met1    Track-Pitch = 0.3400  line-2-Via Pitch: 0.3400
[INFO GRT-0088] Layer met2    Track-Pitch = 0.4600  line-2-Via Pitch: 0.3500
[INFO GRT-0088] Layer met3    Track-Pitch = 0.6800  line-2-Via Pitch: 0.6150
[INFO GRT-0088] Layer met4    Track-Pitch = 0.9200  line-2-Via Pitch: 1.0400
[INFO GRT-0088] Layer met5    Track-Pitch = 3.4000  line-2-Via Pitch: 3.1100
[INFO GRT-0019] Found 0 clock nets.
[INFO GRT-0001] Minimum degree: 2
[INFO GRT-0002] Maximum degree: 48
[INFO GRT-0003] Macros: 0
[INFO GRT-0004] Blockages: 710

[INFO GRT-0053] Routing resources analysis:
          Routing      Original      Derated      Resource
Layer     Direction    Resources     Resources    Reduction (%)
---------------------------------------------------------------
li1        Vertical            0             0          0.00%
met1       Horizontal       9240          5176          43.98%
met2       Vertical         6930          4572          34.03%
met3       Horizontal       4620          2898          37.27%
met4       Vertical         2772          1260          54.55%
met5       Horizontal        924           361          60.93%
---------------------------------------------------------------
  
[INFO GRT-0096] Final congestion report:
Layer         Resource        Demand        Usage (%)    Max H / Max V / Total Overflow
---------------------------------------------------------------------------------------
li1                  0             0            0.00%             0 /  0 /  0
met1              5176           395            7.63%             0 /  0 /  0
met2              4572           310            6.78%             0 /  0 /  0
met3              2898             0            0.00%             0 /  0 /  0
met4              1260             0            0.00%             0 /  0 /  0
met5               361             0            0.00%             0 /  0 /  0
---------------------------------------------------------------------------------------
Total            14267           705            4.94%             0 /  0 /  0

[INFO GRT-0018] Total wirelength: 8618 um
[INFO GRT-0014] Routed nets: 155

==========================================================================
global route report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             1.61e-13   7.04e-14   5.48e-10   5.48e-10  42.5%
Combinational          9.75e-14   3.30e-13   7.40e-10   7.40e-10  57.5%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  2.59e-13   4.01e-13   1.29e-09   1.29e-09 100.0%
                           0.0%       0.0%      99.9%

==========================================================================
global route report_design_area
--------------------------------------------------------------------------
Design area 2559 u^2 19% utilization.

# Check_antennas

# Timing Analysis
==========================================================================
finish report_tns
--------------------------------------------------------------------------
tns 0.00
==========================================================================
finish report_wns
--------------------------------------------------------------------------
wns 0.00
==========================================================================
finish report_worst_slack
--------------------------------------------------------------------------
worst slack INF
==========================================================================


finish report_power
--------------------------------------------------------------------------
Group                  Internal  Switching    Leakage      Total
                          Power      Power      Power      Power (Watts)
----------------------------------------------------------------
Sequential             1.64e-13   5.48e-14   5.48e-10   5.48e-10  42.5%
Combinational          9.74e-14   2.54e-13   7.40e-10   7.40e-10  57.5%
Macro                  0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
Pad                    0.00e+00   0.00e+00   0.00e+00   0.00e+00   0.0%
----------------------------------------------------------------
Total                  2.61e-13   3.09e-13   1.29e-09   1.29e-09 100.0%
                           0.0%       0.0%     100.0%

==========================================================================
finish report_design_area
--------------------------------------------------------------------------
Design area 2559 u^2 19% utilization.

# Place and Route finished

# DRC
Loading DRC CIF style.
No errors found.
[INFO]: DONE with /home/prajwalita17/VSD_8TSRAM/openfasoc/openfasoc/generators/temp-sense-gen/flow/reports/sky130hd/tempsense//6_final_drc.rpt

# DRC finished

# LVS
Contents of circuit 1:  Circuit: 'tempsenseInst_error'
Circuit tempsenseInst_error contains 152 device instances.
  Class: SLC                   instances:   1
  Class: sky130_fd_sc_hd__o221ai_1 instances:   1
  Class: sky130_fd_sc_hd__mux4_1 instances:   1
  Class: sky130_fd_sc_hd__mux4_2 instances:   1
  Class: sky130_fd_sc_hd__dfrtp_1 instances:   4
  Class: sky130_fd_sc_hd__inv_1 instances:  55
  Class: sky130_fd_sc_hd__or3_1 instances:   1
  Class: sky130_fd_sc_hd__conb_1 instances:   1
  Class: sky130_fd_sc_hd__a221oi_4 instances:   1
  Class: sky130_fd_sc_hd__decap_4 instances:   2
  Class: sky130_fd_sc_hd__or2_2 instances:   1
  Class: sky130_fd_sc_hd__nand2_1 instances:   3
  Class: sky130_fd_sc_hd__nand3b_1 instances:   2
  Class: sky130_fd_sc_hd__dfrtn_1 instances:  43
  Class: HEADER                instances:   3
  Class: sky130_fd_sc_hd__o211a_1 instances:   2
  Class: sky130_fd_sc_hd__o2111a_2 instances:   1
  Class: sky130_fd_sc_hd__or3b_2 instances:   1
  Class: sky130_fd_sc_hd__nor3_1 instances:  21
  Class: sky130_fd_sc_hd__nor3_2 instances:   4
  Class: sky130_fd_sc_hd__o311a_1 instances:   1
  Class: sky130_fd_sc_hd__or2b_1 instances:   1
  Class: sky130_fd_sc_hd__nor2_1 instances:   1
Circuit contains 158 nets.
Contents of circuit 2:  Circuit: 'tempsenseInst_error'
Circuit tempsenseInst_error contains 152 device instances.
  Class: SLC                   instances:   1
  Class: sky130_fd_sc_hd__o221ai_1 instances:   1
  Class: sky130_fd_sc_hd__mux4_1 instances:   1
  Class: sky130_fd_sc_hd__mux4_2 instances:   1
  Class: sky130_fd_sc_hd__dfrtp_1 instances:   4
  Class: sky130_fd_sc_hd__inv_1 instances:  55
  Class: sky130_fd_sc_hd__or3_1 instances:   1
  Class: sky130_fd_sc_hd__conb_1 instances:   1
  Class: sky130_fd_sc_hd__a221oi_4 instances:   1
  Class: sky130_fd_sc_hd__decap_4 instances:   2
  Class: sky130_fd_sc_hd__or2_2 instances:   1
  Class: sky130_fd_sc_hd__nand2_1 instances:   3
  Class: sky130_fd_sc_hd__nand3b_1 instances:   2
  Class: sky130_fd_sc_hd__dfrtn_1 instances:  43
  Class: HEADER                instances:   3
  Class: sky130_fd_sc_hd__o211a_1 instances:   2
  Class: sky130_fd_sc_hd__o2111a_2 instances:   1
  Class: sky130_fd_sc_hd__or3b_2 instances:   1
  Class: sky130_fd_sc_hd__nor3_1 instances:  21
  Class: sky130_fd_sc_hd__nor3_2 instances:   4
  Class: sky130_fd_sc_hd__o311a_1 instances:   1
  Class: sky130_fd_sc_hd__or2b_1 instances:   1
  Class: sky130_fd_sc_hd__nor2_1 instances:   1
Circuit contains 158 nets.

Circuit 1 contains 152 devices, Circuit 2 contains 152 devices.
Circuit 1 contains 158 nets,    Circuit 2 contains 158 nets.


Final result: 
Circuits match uniquely.
# LVS finished
# Macro Generated
# Generating spice netlists for the macro
spice netlists created for different temperatures to run the prePEX simulations
Exiting tool....
DRC is clean!
LVS is clean!
```
  
  
  
  
  
  





