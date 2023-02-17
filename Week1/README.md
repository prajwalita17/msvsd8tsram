# msvsd8tsram

## 1. ALIGN installation
ALIGN is an open source automatic layout generator for analog circuits. Install ALIGN and all its dependencies using the following commands.
```
# Home directory
    $cd ~/VSD_8TSRAM
# Clone the ALIGN source
    $git clone https://github.com/ALIGN-analoglayout/ALIGN-public
    $cd ALIGN-public
# Install virtual environment for python
    $sudo apt -y install python3.8-venv
# Install the latest pip
    $sudo apt-get -y install python3-pip
# Create python virtual envronment and install dependencies
    $python3 -m venv general
    $source general/bin/activate
    $python3 -m pip install pip --upgrade
    $pip install align
    $pip install pandas
    $pip install scipy
    $pip install nltk
    $pip install gensim
    $pip install setuptools wheel pybind11 scikit-build cmake ninja
# Install ALIGN as a user
    $pip install -v .
# Install ALIGN  as a developer
    $pip install -e .
    $pip install -v -e .[test] --no-build-isolation
    $pip install wheel setuptools pip --upgrade
    $pip3 install wheel setuptools pip --upgrade
    $pip install -v --no-build-isolation -e . --no-deps --install-option='-DBUILD_TESTING=ON'
    
# Making ALIGN Portable to Sky130 tehnology
# Clone the following Repository inside ALIGN-public directory
    $git clone https://github.com/ALIGN-analoglayout/ALIGN-pdk-sky130

# Move SKY130_PDK folder to ~/VSD_8TSRAM/ALIGN-public/pdks. 
#Everytime we start the tool in new terminal, run the following commands.

# Running ALIGN TOOL
    $python -m venv general
    $source general/bin/activate
    $python3 -m pip install pip --upgrade
    $mkdir work
    $cd work
# General syntax to give inputs

    $schematic2layout.py <NETLIST_DIR> -p <PDK_DIR> -c
EXAMPLE 1:
    $schematic2layout.py ../ALIGN-pdk-sky130/examples/five_transistor_ota -p ../pdks/SKY130_PDK/
    
```

## 2. Simulation of CMOS Inverter 
### 2.a. Pre-layout Characterization using Xschem/Ngspice
<img width="583" alt="inverter schematic" src="https://user-images.githubusercontent.com/104830557/219540453-82d875e9-9916-4fb7-84fb-2c933e35038f.png">

<img width="980" alt="inverter subcircuit" src="https://user-images.githubusercontent.com/104830557/219540467-06e5482f-fa8b-4ebe-9d1a-9032add1af5c.png">

### 2.b. Post-layout Characterization using Magic/Ngspice
### 2.c. Post-layout Characterization using ALign Tool
```
.subckt inv A B vdd vss
XM1 B A vdd vdd sky130_fd_pr__pfet_01v8 w=21e-7 l=0.15n nf=10 m=1
XM2 B A vss vss sky130_fd_pr__nfet_01v8 w=21e-7 l=0.15n nf=10 m=1
.ends
```
```
prajwalita17@prajwalita17-VirtualBox:~$ cd VSD_8TSRAM/ALIGN-public/
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ python3 -m venv general
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ source general/bin/activate
(general) prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ python3 -m pip install pip --upgrade
Requirement already satisfied: pip in ./general/lib/python3.8/site-packages (23.0)
(general) prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ cd work/
(general) prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/work$ schematic2layout.py ../ALIGN-pdk-sky130/examples/inv/ -p ../pdks/SKY130_PDK/
align.main INFO : Reading netlist: /home/prajwalita17/VSD_8TSRAM/ALIGN-public/ALIGN-pdk-sky130/examples/inv/inv.sp subckt=INV, flat=0
align.compiler.compiler INFO : Starting topology identification...
align.compiler.compiler INFO : Power and ground nets not found. Power grid will not be constructed.
align.compiler.compiler INFO : Completed topology identification.
align.pnr.main INFO : Running Place & Route for INV
align.pnr.build_pnr_model INFO : Reading contraint json file INV.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file INV.pnr.const.json
align.pnr.placer INFO : Starting bottom-up placement on INV 0
PnR.placer.SeqPair.SeqPair INFO : Enumerated search
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : Exhausted all permutations of seq pairs and found 1 placement solution(s)
align.pnr.build_pnr_model INFO : Reading contraint json file INV.pnr.const.json
PnR.placer.SeqPair.SeqPair INFO : Enumerated search
align.pnr.router INFO : Starting top_down routing on INV 0 restricted to None
PnR.router.Router.RouteWork INFO : GcellGlobalRouter: INV
PnR.router.Router.RouteWork INFO : GcellDetailRouter: INV
PnR.router.Router.RouteWork INFO : Create power grid: INV
PnR.router.Router.RouteWork INFO : Power routing INV
align.pnr.main INFO : OUTPUT json at /home/prajwalita17/VSD_8TSRAM/ALIGN-public/work/3_pnr/INV_0.json
align.pnr.main INFO : OUTPUT gds.json /home/prajwalita17/VSD_8TSRAM/ALIGN-public/work/3_pnr/INV_0.python.gds.json
Use KLayout to visualize the generated GDS: /home/prajwalita17/VSD_8TSRAM/ALIGN-public/work/INV_0.gds
Use KLayout to visualize the python generated GDS: /home/prajwalita17/VSD_8TSRAM/ALIGN-public/work/INV_0.python.gds
```

```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/work$ klayout INV_0.lef
```

<img width="1021" alt="inverter lef" src="https://user-images.githubusercontent.com/104830557/219664288-e8fece07-0477-41e3-b1a6-a248969f3182.png">

```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/work$ klayout INV_0.gds
```
![image](https://user-images.githubusercontent.com/104830557/219664164-96acafd1-039e-49ab-9df4-bf08f789a6de.png)


```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/work$ magic -T /home/prajwalita17/VSD_8TSRAM/open_pdks/sky130/sky130A/libs.tech/magic/sky130A.tech
```
File >> Read GDS >> INV_0.gds

<img width="878" alt="inv post align" src="https://user-images.githubusercontent.com/104830557/219609124-7ecb7ab2-b295-4cff-b9e0-401446152e08.png">


```
extract do local
extract all
ext2spice cthresh 0 rthresh 0
ext2spice
```

```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/week1$ ngspice INV_0.spice 
******
** ngspice-39 : Circuit level simulation program
** The U. C. Berkeley CAD Group
** Copyright 1985-1994, Regents of the University of California.
** Copyright 2001-2022, The ngspice team.
** Please get your ngspice manual from http://ngspice.sourceforge.net/docs.html
** Please file your bug-reports at http://ngspice.sourceforge.net/bugrep.html
** Creation Date: Mon Feb 13 14:54:43 UTC 2023
******
Note: No compatibility mode selected!
Circuit: * spice3 file created from inv_0.ext - technology: sky130a
Doing analysis at TEMP = 27.000000 and TNOM = 27.000000
Initial Transient Solution
--------------------------
Node                                   Voltage
----                                   -------
b                                          1.8
a                                            0
vss                                          0
vdd                                        1.8
vin#branch                                   0
vdd#branch                         -2.0428e-11
vgnd#branch                       -5.38166e-14
 Reference value :  3.31750e-08
No. of Data Rows : 6080
ngspice 1 -> 
x0 = 4.63529e-08, y0 = 0.815385
x0 = 1.74118e-08, y0 = 0.179487
```
<img width="1013" alt="image" src="https://user-images.githubusercontent.com/104830557/219606263-05d06b25-4215-4815-ac47-25975a15d21e.png">



### 2.d. Comparison and LVS Report

## 3. Simulation of Function 
### 3.a. Pre-layout Characterization using Xschem/Ngspice
<img width="526" alt="function schematic" src="https://user-images.githubusercontent.com/104830557/219541683-9e8ceb22-edb7-4612-86a2-fab51911d96d.png">
<img width="1150" alt="function subcircuit" src="https://user-images.githubusercontent.com/104830557/219541693-9fc49481-a42f-4c22-9e1f-dccb691ea7db.png">

<img width="1016" alt="function prelayout" src="https://user-images.githubusercontent.com/104830557/219541640-89d429dc-dd22-4fcf-afc1-546362649475.png">

### 3.b. Post-layout Characterization using Magic/Ngspice

<img width="1202" alt="image" src="https://user-images.githubusercontent.com/104830557/219727444-4fea077e-af22-4450-aa66-1b1d15e42b4d.png">

```
* SPICE3 file created from function.ext - technology: sky130A
.subckt function A C E B D E F VDD GND
X0 XM12/a_15_n100# F XM12/a_n73_n100# VSUBS sky130_fd_pr__nfet_01v8 ad=2.9e+11p pd=2.58e+06u as=2.9e+11p ps=2.58e+06u w=1e+06u l=150000u
X1 m1_1264_182# A XM1/a_n73_n100# XM1/w_n211_n319# sky130_fd_pr__pfet_01v8 ad=5.8e+11p pd=5.16e+06u as=2.9e+11p ps=2.58e+06u w=1e+06u l=150000u
X2 XM2/a_15_n100# B m1_1264_182# XM2/w_n211_n319# sky130_fd_pr__pfet_01v8 ad=2.9e+11p pd=2.58e+06u as=0p ps=0u w=1e+06u l=150000u
X3 m1_3006_n82# C XM3/a_n73_n100# XM3/w_n211_n319# sky130_fd_pr__pfet_01v8 ad=5.8e+11p pd=5.16e+06u as=2.9e+11p ps=2.58e+06u w=1e+06u l=150000u
X4 XM4/a_15_n100# D m1_3006_n82# XM4/w_n211_n319# sky130_fd_pr__pfet_01v8 ad=2.9e+11p pd=2.58e+06u as=0p ps=0u w=1e+06u l=150000u
X5 m1_4678_n84# E m1_4312_n1180# XM5/w_n211_n319# sky130_fd_pr__pfet_01v8 ad=5.8e+11p pd=5.16e+06u as=2.9e+11p ps=2.58e+06u w=1e+06u l=150000u
X6 m1_5520_n72# F m1_4678_n84# XM6/w_n211_n319# sky130_fd_pr__pfet_01v8 ad=2.9e+11p pd=2.58e+06u as=0p ps=0u w=1e+06u l=150000u
X7 XM7/a_15_n100# m1_1276_n1342# XM7/a_n73_n100# VSUBS sky130_fd_pr__nfet_01v8 ad=2.9e+11p pd=2.58e+06u as=2.9e+11p ps=2.58e+06u w=1e+06u l=150000u
X8 XM9/a_15_n100# C XM9/a_n73_n100# VSUBS sky130_fd_pr__nfet_01v8 ad=2.9e+11p pd=2.58e+06u as=2.9e+11p ps=2.58e+06u w=1e+06u l=150000u
X9 GND B XM8/a_n73_n100# VSUBS sky130_fd_pr__nfet_01v8 ad=2.9e+11p pd=2.58e+06u as=2.9e+11p ps=2.58e+06u w=1e+06u l=150000u
X10 XM10/a_15_n100# D XM10/a_n73_n100# VSUBS sky130_fd_pr__nfet_01v8 ad=2.9e+11p pd=2.58e+06u as=2.9e+11p ps=2.58e+06u w=1e+06u l=150000u
X11 XM11/a_15_n100# E m1_4312_n1180# VSUBS sky130_fd_pr__nfet_01v8 ad=2.9e+11p pd=2.58e+06u as=2.9e+11p ps=2.58e+06u w=1e+06u l=150000u
10:58
R0 m1_1448_n1220# m1_3118_n1212# sky130_fd_pr__res_generic_m2 w=550000u l=7.71e+06u
R1 m1_5520_n72# m1_5520_n72# sky130_fd_pr__res_generic_m2 w=490000u l=520000u
R2 m1_4312_n1180# m1_5520_n72# sky130_fd_pr__res_generic_m2 w=575000u l=8.33e+06u
R3 m1_3006_n82# m1_4678_n84# sky130_fd_pr__res_generic_m2 w=340000u l=7.97e+06u
C0 m2_2160_n88# m2_982_n792# 0.08fF
C1 m2_1632_n1756# E 0.00fF
C2 m1_1264_182# XM2/a_15_n100# 0.17fF
C3 m1_1264_182# XM3/a_n73_n100# 0.00fF
C4 m1_1448_n1220# XM2/w_n211_n319# 0.00fF
C5 XM4/w_n211_n319# XM3/w_n211_n319# 0.03fF
C6 m2_982_n792# m1_4792_n1196# 0.03fF
C7 m1_1276_n1342# XM7/a_n73_n100# 0.03fF
C8 F XM10/a_15_n100# 0.00fF
C9 B XM7/a_n73_n100# 0.00fF
C10 B XM9/a_15_n100# 0.00fF
C11 XM4/w_n211_n319# XM10/a_n73_n100# 0.00fF
C12 m2_3346_n88# XM2/w_n211_n319# 0.00fF
C13 m1_4312_n1180# XM3/a_n73_n100# 0.00fF
C14 m1_4792_n1196# m2_1632_n1756# 0.00fF
C15 D XM5/w_n211_n319# 0.00fF
C16 A GND 0.00fF
C17 D m2_3346_n88# 0.23fF
C18 m2_2160_n88# XM2/a_15_n100# 0.04fF
C19 XM8/a_n73_n100# XM2/w_n211_n319# 0.00fF
C20 XM3/w_n211_n319# XM9/a_n73_n100# 0.00fF
C21 XM10/a_15_n100# XM12/a_n73_n100# 0.00fF
C22 XM11/a_15_n100# XM12/a_15_n100# 0.00fF
C23 m2_2160_n88# XM3/a_n73_n100# 0.01fF
C24 m2_6056_n836# F 0.00fF
C25 m2_982_n792# A 0.34fF
C26 m1_4678_n84# XM5/w_n211_n319# 0.13fF
C27 XM10/a_n73_n100# XM9/a_n73_n100# 0.00fF
C28 XM1/a_n73_n100# XM7/a_n73_n100# 0.00fF
C29 m1_4312_n1180# XM9/a_15_n100# 0.00fF
C30 B m2_3346_n88# 0.00fF
C31 D XM10/a_15_n100# 0.04fF
C32 m2_3346_n88# m1_4678_n84# 0.14fF
C33 E XM9/a_15_n100# 0.00fF
C34 C XM2/w_n211_n319# 0.01fF
C35 F XM4/w_n211_n319# 0.00fF
C36 XM1/w_n211_n319# m2_982_n792# 0.04fF
C37 m1_1264_182# m1_1448_n1220# 0.02fF
C38 m1_1264_182# XM5/w_n211_n319# 0.05fF
C39 GND m1_5520_n72# 0.01fF
C40 GND XM7/a_15_n100# 0.00fF
C41 D C 0.05fF
C42 m1_1276_n1342# XM8/a_n73_n100# 0.00fF
C43 m1_1264_182# m2_3346_n88# 0.00fF
C44 B XM8/a_n73_n100# 0.03fF
C45 XM5/w_n211_n319# m1_4312_n1180# 0.20fF
C46 A XM2/a_15_n100# 0.00fF
C47 A XM3/a_n73_n100# 0.00fF
C48 m2_982_n792# m1_5520_n72# 0.07fF
C49 m2_982_n792# XM7/a_15_n100# 0.01fF
C50 F XM12/a_15_n100# 0.04fF
C51 m2_3346_n88# m1_4312_n1180# 0.18fF
C52 E XM5/w_n211_n319# 0.44fF
C53 XM4/w_n211_n319# XM2/w_n211_n319# 0.00fF
C54 B C 0.05fF
C55 m2_3346_n88# E 0.24fF
C56 m1_1264_182# XM8/a_n73_n100# 0.00fF
C57 m2_1632_n1756# XM7/a_15_n100# 0.00fF
C58 m2_2160_n88# XM5/w_n211_n319# 0.02fF
C59 XM1/w_n211_n319# XM3/a_n73_n100# 0.00fF
C60 m1_3118_n1212# m1_4312_n1180# 0.00fF
C61 m1_4792_n1196# XM5/w_n211_n319# 0.00fF
C62 D XM4/w_n211_n319# 0.38fF
C63 m2_2160_n88# m2_3346_n88# 0.12fF
C64 m1_4312_n1180# XM10/a_15_n100# 0.00fF
C65 A XM7/a_n73_n100# 0.00fF
C66 XM12/a_n73_n100# XM12/a_15_n100# 0.16fF
C67 m1_4792_n1196# m2_3346_n88# 0.00fF
C68 m2_982_n792# m1_3006_n82# 0.02fF
C69 m1_1264_182# C 0.05fF
C70 F XM6/w_n211_n319# 0.39fF
C71 E XM10/a_15_n100# 0.00fF
C72 B XM4/w_n211_n319# 0.00fF
C73 m2_1632_n1756# m1_3006_n82# 0.00fF
C74 C m1_4312_n1180# 0.00fF
C75 XM5/w_n211_n319# XM4/a_15_n100# 0.00fF
C76 m1_4678_n84# XM4/w_n211_n319# 0.00fF
C77 XM1/w_n211_n319# XM7/a_n73_n100# 0.00fF
C78 D XM9/a_n73_n100# 0.00fF
C79 m2_3346_n88# XM4/a_15_n100# 0.00fF
C80 A m1_1448_n1220# 0.00fF
C81 XM12/a_n73_n100# XM6/w_n211_n319# 0.00fF
C82 m2_982_n792# GND 0.09fF
C83 m1_3006_n82# XM2/a_15_n100# 0.00fF
C84 m1_1264_182# XM4/w_n211_n319# 0.06fF
C85 m2_6056_n836# E 0.00fF
C86 m2_2160_n88# C 0.01fF
C87 m1_3006_n82# XM3/a_n73_n100# 0.16fF
C88 XM7/a_n73_n100# XM7/a_15_n100# 0.16fF
C89 m1_1276_n1342# XM9/a_n73_n100# 0.00fF
C90 F XM11/a_15_n100# 0.00fF
C91 B XM9/a_n73_n100# 0.00fF
C92 D XM6/w_n211_n319# 0.00fF
C93 m1_4312_n1180# XM4/w_n211_n319# 0.02fF
C94 m2_1632_n1756# GND 0.72fF
C95 XM1/w_n211_n319# m1_1448_n1220# 0.00fF
C96 E XM4/w_n211_n319# 0.01fF
C97 XM3/w_n211_n319# XM2/w_n211_n319# 0.03fF
C98 m2_982_n792# m2_1632_n1756# 0.19fF
C99 m1_4312_n1180# XM12/a_15_n100# 0.00fF
C100 XM11/a_15_n100# XM12/a_n73_n100# 0.00fF
C101 XM5/w_n211_n319# m1_5520_n72# 0.00fF
C102 m1_4678_n84# XM6/w_n211_n319# 0.15fF
C103 m1_1448_n1220# XM7/a_15_n100# 0.04fF
C104 m2_2160_n88# XM4/w_n211_n319# 0.11fF
C105 D XM3/w_n211_n319# 0.00fF
C106 m1_4312_n1180# XM9/a_n73_n100# 0.00fF
C107 m2_3346_n88# m1_5520_n72# 0.00fF
C108 E XM12/a_15_n100# 0.00fF
C109 m2_982_n792# XM2/a_15_n100# 0.00fF
C110 D XM10/a_n73_n100# 0.03fF
C111 D XM11/a_15_n100# 0.00fF
C112 m2_982_n792# XM3/a_n73_n100# 0.00fF
C113 m1_1264_182# XM6/w_n211_n319# 0.04fF
C114 B XM3/w_n211_n319# 0.01fF
C115 XM4/a_15_n100# XM4/w_n211_n319# 0.08fF
C116 XM1/w_n211_n319# C 0.00fF
C117 XM8/a_n73_n100# XM7/a_15_n100# 0.00fF
C118 m2_2160_n88# XM9/a_n73_n100# 0.00fF
C119 GND XM7/a_n73_n100# 0.00fF
C120 m1_4312_n1180# XM6/w_n211_n319# 0.00fF
C121 GND XM9/a_15_n100# 0.00fF
C122 B XM10/a_n73_n100# 0.00fF
C123 m2_3346_n88# m1_3006_n82# 0.20fF
C124 E XM6/w_n211_n319# 0.01fF
C125 m2_982_n792# XM7/a_n73_n100# 0.03fF
C126 F XM12/a_n73_n100# 0.03fF
C127 m2_982_n792# XM9/a_15_n100# 0.01fF
C128 m1_1264_182# XM3/w_n211_n319# 0.06fF
C129 C XM7/a_15_n100# 0.00fF
C130 XM3/a_n73_n100# XM2/a_15_n100# 0.01fF
C131 m2_2160_n88# XM6/w_n211_n319# 0.00fF
C132 m1_3118_n1212# m1_3006_n82# 0.03fF
C133 m1_4792_n1196# XM6/w_n211_n319# 0.00fF
C134 m2_1632_n1756# XM7/a_n73_n100# 0.00fF
C135 m1_1448_n1220# GND 0.05fF
C136 m2_1632_n1756# XM9/a_15_n100# 0.01fF
C137 m1_4312_n1180# XM3/w_n211_n319# 0.00fF
C138 m2_6056_n836# m1_5520_n72# 0.00fF
C139 m1_4312_n1180# XM10/a_n73_n100# 0.00fF
C140 m2_3346_n88# GND 0.00fF
C141 E XM3/w_n211_n319# 0.00fF
C142 m1_4312_n1180# XM11/a_15_n100# 0.16fF
C143 m2_982_n792# m1_1448_n1220# 0.02fF
C144 m2_982_n792# XM5/w_n211_n319# 0.00fF
C145 E XM10/a_n73_n100# 0.00fF
C146 C m1_3006_n82# 0.04fF
C147 E XM11/a_15_n100# 0.04fF
C148 m2_2160_n88# XM3/w_n211_n319# 0.08fF
C149 m2_982_n792# m2_3346_n88# 0.68fF
C150 F m1_4678_n84# 0.03fF
C151 D XM12/a_n73_n100# 0.00fF
C152 m1_3118_n1212# GND 0.04fF
C153 D XM2/w_n211_n319# 0.00fF
C154 m2_1632_n1756# m1_1448_n1220# 0.11fF
C155 XM8/a_n73_n100# GND 0.16fF
C156 XM10/a_15_n100# GND 0.05fF
C157 m1_4792_n1196# XM11/a_15_n100# 0.05fF
C158 m2_982_n792# m1_3118_n1212# 0.02fF
C159 m1_1264_182# F 0.05fF
C160 m2_982_n792# XM8/a_n73_n100# 0.00fF
C161 m2_982_n792# XM10/a_15_n100# 0.00fF
C162 m1_4678_n84# XM12/a_n73_n100# 0.00fF
C163 B XM2/w_n211_n319# 0.46fF
C164 C GND 0.04fF
C165 XM4/w_n211_n319# m1_3006_n82# 0.25fF
C166 XM9/a_n73_n100# XM7/a_15_n100# 0.00fF
C167 m1_3118_n1212# m2_1632_n1756# 0.18fF
C168 F m1_4312_n1180# 0.00fF
C169 m2_1632_n1756# XM8/a_n73_n100# 0.00fF
C170 m2_3346_n88# XM2/a_15_n100# 0.00fF
C171 m2_1632_n1756# XM10/a_15_n100# 0.00fF
C172 m2_3346_n88# XM3/a_n73_n100# 0.00fF
C173 A XM3/w_n211_n319# 0.00fF
C174 m2_982_n792# C 0.33fF
C175 D m1_4678_n84# 0.00fF
C176 F E 0.05fF
C177 m1_1264_182# XM2/w_n211_n319# 0.28fF
C178 m1_5520_n72# XM6/w_n211_n319# 0.18fF
C179 m2_2160_n88# F 0.00fF
C180 m2_1632_n1756# C 0.01fF
C181 m1_4312_n1180# XM12/a_n73_n100# 0.00fF
C182 XM4/w_n211_n319# GND 0.00fF
C183 XM1/w_n211_n319# XM3/w_n211_n319# 0.00fF
C184 B m1_1276_n1342# 0.01fF
C185 m1_1264_182# D 0.05fF
C186 E XM12/a_n73_n100# 0.00fF
C187 D m1_4312_n1180# 0.07fF
C188 m2_982_n792# XM4/w_n211_n319# 0.00fF
C189 C XM2/a_15_n100# 0.00fF
C190 C XM3/a_n73_n100# 0.03fF
C191 m2_2160_n88# XM2/w_n211_n319# 0.05fF
C192 GND XM12/a_15_n100# 0.05fF
C193 m1_1264_182# m1_1276_n1342# 0.00fF
C194 D E 0.01fF
C195 F XM4/a_15_n100# 0.00fF
C196 m1_4792_n1196# XM12/a_n73_n100# 0.05fF
C197 m1_1264_182# B 0.09fF
C198 m1_3118_n1212# XM9/a_15_n100# 0.04fF
C199 m1_1264_182# m1_4678_n84# 0.04fF
C200 XM8/a_n73_n100# XM7/a_n73_n100# 0.00fF
C201 GND XM9/a_n73_n100# 0.01fF
C202 XM10/a_15_n100# XM9/a_15_n100# 0.00fF
C203 m2_982_n792# XM12/a_15_n100# 0.00fF
C204 m2_2160_n88# D 0.01fF
C205 XM1/a_n73_n100# B 0.00fF
C206 m1_4678_n84# m1_4312_n1180# 0.16fF
C207 m2_3346_n88# XM5/w_n211_n319# 0.11fF
C208 m2_982_n792# XM9/a_n73_n100# 0.03fF
C209 E m1_4678_n84# 0.05fF
C210 XM4/w_n211_n319# XM2/a_15_n100# 0.00fF
C211 C XM9/a_15_n100# 0.04fF
C212 m1_3006_n82# XM3/w_n211_n319# 0.19fF
C213 GND XM6/w_n211_n319# 0.00fF
C214 m1_1264_182# m1_4312_n1180# 0.02fF
C215 m1_1264_182# XM1/a_n73_n100# 0.16fF
C216 m1_1448_n1220# XM8/a_n73_n100# 0.02fF
C217 m2_1632_n1756# XM9/a_n73_n100# 0.00fF
C218 m2_2160_n88# B 0.01fF
C219 m1_3006_n82# XM10/a_n73_n100# 0.00fF
C220 m2_2160_n88# m1_4678_n84# 0.00fF
C221 A XM2/w_n211_n319# 0.01fF
C222 m1_3118_n1212# m2_3346_n88# 0.00fF
C223 m1_4792_n1196# m1_4678_n84# 0.02fF
C224 D XM4/a_15_n100# 0.03fF
C225 m1_1264_182# E 0.05fF
C226 m2_982_n792# XM6/w_n211_n319# 0.02fF
C227 F m1_5520_n72# 0.10fF
C228 E m1_4312_n1180# 0.18fF
C229 C XM5/w_n211_n319# 0.00fF
C230 m1_1264_182# m2_2160_n88# 0.37fF
C231 XM3/a_n73_n100# XM9/a_n73_n100# 0.00fF
C232 XM3/w_n211_n319# GND 0.00fF
C233 XM1/w_n211_n319# XM2/w_n211_n319# 0.03fF
C234 m2_3346_n88# C 0.01fF
C235 m1_4678_n84# XM4/a_15_n100# 0.00fF
C236 XM10/a_n73_n100# GND 0.00fF
C237 m2_2160_n88# m1_4312_n1180# 0.02fF
C238 XM1/a_n73_n100# m2_2160_n88# 0.00fF
C239 XM11/a_15_n100# GND 0.00fF
C240 m2_982_n792# XM3/w_n211_n319# 0.05fF
C241 A m1_1276_n1342# 0.03fF
C242 A B 0.04fF
C243 m2_2160_n88# E 0.00fF
C244 m1_4792_n1196# E 0.00fF
C245 m2_982_n792# XM10/a_n73_n100# 0.00fF
C246 m2_982_n792# XM11/a_15_n100# 0.00fF
C247 m1_1264_182# XM4/a_15_n100# 0.00fF
C248 C XM8/a_n73_n100# 0.00fF
C249 C XM10/a_15_n100# 0.00fF
C250 m2_1632_n1756# XM3/w_n211_n319# 0.00fF
C251 XM5/w_n211_n319# XM4/w_n211_n319# 0.03fF
C252 XM9/a_n73_n100# XM9/a_15_n100# 0.16fF
C253 XM1/w_n211_n319# m1_1276_n1342# 0.00fF
C254 XM4/a_15_n100# m1_4312_n1180# 0.01fF
C255 m2_1632_n1756# XM10/a_n73_n100# 0.00fF
C256 m2_1632_n1756# XM11/a_15_n100# 0.00fF
C257 XM1/w_n211_n319# B 0.01fF
C258 m2_3346_n88# XM4/w_n211_n319# 0.09fF
C259 m1_1264_182# A 0.10fF
C260 E XM4/a_15_n100# 0.00fF
C261 XM3/w_n211_n319# XM2/a_15_n100# 0.00fF
C262 XM1/a_n73_n100# A 0.03fF
C263 XM3/a_n73_n100# XM3/w_n211_n319# 0.10fF
C264 m1_3118_n1212# XM4/w_n211_n319# 0.00fF
C265 F GND 0.04fF
C266 m1_1276_n1342# XM7/a_15_n100# 0.03fF
C267 m1_4678_n84# m1_5520_n72# 0.16fF
C268 B XM7/a_15_n100# 0.00fF
C269 m1_1448_n1220# XM9/a_n73_n100# 0.00fF
C270 m2_2160_n88# XM4/a_15_n100# 0.07fF
C271 m1_1264_182# XM1/w_n211_n319# 0.21fF
C272 D m1_3006_n82# 0.03fF
C273 XM1/a_n73_n100# XM1/w_n211_n319# 0.09fF
C274 m2_2160_n88# A 0.00fF
10:58
C275 m2_982_n792# F 0.30fF
C276 C XM4/w_n211_n319# 0.00fF
C277 m1_1264_182# m1_5520_n72# 0.00fF
C278 GND XM12/a_n73_n100# 0.00fF
C279 GND XM2/w_n211_n319# 0.00fF
C280 XM5/w_n211_n319# XM6/w_n211_n319# 0.03fF
C281 B m1_3006_n82# 0.00fF
C282 XM8/a_n73_n100# XM9/a_n73_n100# 0.00fF
C283 m1_4312_n1180# m1_5520_n72# 0.00fF
C284 XM10/a_n73_n100# XM9/a_15_n100# 0.00fF
C285 m2_3346_n88# XM6/w_n211_n319# 0.02fF
C286 XM1/w_n211_n319# m2_2160_n88# 0.00fF
C287 m2_982_n792# XM12/a_n73_n100# 0.00fF
C288 m2_982_n792# XM2/w_n211_n319# 0.03fF
C289 D GND 0.04fF
C290 E m1_5520_n72# 0.00fF
C291 m1_1264_182# m1_3006_n82# 0.05fF
C292 C XM9/a_n73_n100# 0.03fF
C293 m2_1632_n1756# XM2/w_n211_n319# 0.00fF
C294 XM5/w_n211_n319# XM3/w_n211_n319# 0.00fF
C295 m2_2160_n88# m1_5520_n72# 0.00fF
C296 m2_982_n792# D 0.30fF
C297 m1_1276_n1342# GND 0.03fF
C298 m1_4312_n1180# m1_3006_n82# 0.00fF
C299 B GND 0.08fF
C300 m2_3346_n88# XM3/w_n211_n319# 0.02fF
C301 m1_4678_n84# GND 0.00fF
C302 D m2_1632_n1756# 0.00fF
C303 m2_3346_n88# XM10/a_n73_n100# 0.00fF
C304 E m1_3006_n82# 0.00fF
C305 XM2/a_15_n100# XM2/w_n211_n319# 0.08fF
C306 XM3/a_n73_n100# XM2/w_n211_n319# 0.01fF
C307 m2_982_n792# m1_1276_n1342# 0.04fF
C308 XM1/w_n211_n319# A 0.40fF
C309 m2_982_n792# B 0.35fF
C310 m2_982_n792# m1_4678_n84# 0.01fF
C311 m1_3118_n1212# XM3/w_n211_n319# 0.00fF
C312 m2_2160_n88# m1_3006_n82# 0.06fF
C313 m2_1632_n1756# m1_1276_n1342# 0.00fF
C314 m1_3118_n1212# XM10/a_n73_n100# 0.02fF
C315 B m2_1632_n1756# 0.01fF
C316 m1_4312_n1180# GND 0.05fF
C317 XM10/a_n73_n100# XM10/a_15_n100# 0.16fF
C318 A XM7/a_15_n100# 0.00fF
C319 m1_1264_182# m2_982_n792# 0.03fF
C320 E GND 0.04fF
C321 C XM3/w_n211_n319# 0.39fF
C322 XM4/w_n211_n319# XM6/w_n211_n319# 0.00fF
C323 XM1/a_n73_n100# m2_982_n792# 0.00fF
C324 m2_982_n792# m1_4312_n1180# 0.16fF
C325 F XM5/w_n211_n319# 0.01fF
C326 m1_1264_182# m2_1632_n1756# 0.00fF
C327 B XM2/a_15_n100# 0.04fF
C328 C XM10/a_n73_n100# 0.00fF
C329 XM4/a_15_n100# m1_3006_n82# 0.16fF
C330 B XM3/a_n73_n100# 0.00fF
C331 m2_2160_n88# GND 0.00fF
C332 m2_982_n792# E 0.28fF
C333 F m2_3346_n88# 0.01fF
C334 D XM9/a_15_n100# 0.00fF
C335 m1_4792_n1196# GND 0.05fF
C336 m2_1632_n1756# m1_4312_n1180# 0.00fF
C337 A VSUBS 0.10fF
C338 m2_6056_n836# VSUBS 0.04fF
C339 m2_1632_n1756# VSUBS 0.74fF
C340 m2_3346_n88# VSUBS 0.21fF
C341 m2_2160_n88# VSUBS 0.59fF
C342 F VSUBS 0.40fF
C343 E VSUBS 0.26fF
C344 D VSUBS 0.35fF
C345 C VSUBS 0.41fF
C346 B VSUBS 0.32fF
C348 m1_4792_n1196# VSUBS 0.24fF
C355 GND VSUBS 1.83fF
.ends
```


```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/work/magic$ ngspice function.spice 
******
** ngspice-39 : Circuit level simulation program
** The U. C. Berkeley CAD Group
** Copyright 1985-1994, Regents of the University of California.
** Copyright 2001-2022, The ngspice team.
** Please get your ngspice manual from http://ngspice.sourceforge.net/docs.html
** Please file your bug-reports at http://ngspice.sourceforge.net/bugrep.html
** Creation Date: Mon Feb 13 14:54:43 UTC 2023
******
​
Note: No compatibility mode selected!
​
​
Circuit: * spice3 file created from function.ext - technology: sky130a
​
ngspice 1 -> run
Doing analysis at TEMP = 27.000000 and TNOM = 27.000000
​
Warning: singular matrix:  check node x1.m1_1276_n1342#
​
Note: Starting dynamic gmin stepping
Trying gmin =   1.0000E-03 Note: One successful gmin step
Trying gmin =   1.0000E-04 Note: One successful gmin step
Trying gmin =   1.0000E-05 Note: One successful gmin step
Trying gmin =   1.0000E-06 Note: One successful gmin step
Trying gmin =   1.0000E-07 Note: One successful gmin step
Trying gmin =   1.0000E-08 Note: One successful gmin step
Trying gmin =   1.0000E-09 Note: One successful gmin step
Trying gmin =   1.0000E-10 Note: One successful gmin step
Trying gmin =   1.0000E-11 Note: One successful gmin step
Trying gmin =   1.0000E-12 Note: One successful gmin step
Trying gmin =   1.0000E-12 Note: One successful gmin step
Warning: singular matrix:  check node x1.m1_1276_n1342#
​
Warning: Dynamic gmin stepping failed
Note: Starting true gmin stepping
Trying gmin =   1.0000E-03 Warning: singular matrix:  check node x1.m1_1276_n1342#
​
Warning: Further gmin increment
Trying gmin =   5.6234E-03 Warning: singular matrix:  check node x1.m1_1276_n1342#
​
Warning: Further gmin increment
Trying gmin =   8.6596E-03 Warning: singular matrix:  check node x1.m1_1276_n1342#
​
Warning: Further gmin increment
Trying gmin =   9.6466E-03 Warning: singular matrix:  check node x1.m1_1276_n1342#
​
Warning: Further gmin increment
Trying gmin =   9.9105E-03 Warning: Further gmin increment
Trying gmin =   9.9775E-03 Warning: Further gmin increment
Trying gmin =   9.9944E-03 Warning: Further gmin increment
Trying gmin =   9.9986E-03 Warning: Further gmin increment
Trying gmin =   9.9996E-03 Warning: Last gmin step failed
Warning: True gmin stepping failed
Note: Starting source stepping
Supplies reduced to   0.0000% 
Trying gmin =   1.0000E-02 Note: One successful gmin step
Trying gmin =   1.0000E-03 Note: One successful gmin step
Trying gmin =   1.0000E-04 Note: One successful gmin step
Trying gmin =   1.0000E-05 Note: One successful gmin step
Trying gmin =   1.0000E-06 Note: One successful gmin step
Trying gmin =   1.0000E-07 Note: One successful gmin step
Trying gmin =   1.0000E-08 Note: One successful gmin step
Trying gmin =   1.0000E-09 Note: One successful gmin step
Trying gmin =   1.0000E-10 Note: One successful gmin step
Trying gmin =   1.0000E-11 Note: One successful gmin step
Trying gmin =   1.0000E-12 Note: One successful gmin step
Note: One successful source step
Supplies reduced to   0.1000% Supplies reduced to   0.0000% Warning: source stepping failed
Note: Transient op started
Note: Transient op finished successfully
​
Initial Transient Solution
--------------------------
​
Node                                   Voltage
----                                   -------
a                                            0
b                                            0
c                                            0
d                                            0
e                                            0
f                                            0
vdd                                        1.8
x1.vsubs                             0.0427753
net1                                   1.79889
net2                                   1.79889
net3                                   1.79806
y                                      1.79762
net4                                0.00121611
net5                                 0.0012145
v1#branch                         -3.28305e-07
v7#branch                          5.54314e-08
v6#branch                          7.04087e-08
v5#branch                          3.71802e-08
v4#branch                          4.85773e-08
v3#branch                          1.57349e-08
v2#branch                          3.04627e-08
​
 Reference value :  0.00000e+00
No. of Data Rows : 1313
ngspice 2 -> plot y
ngspice 3 -> plot a b c d e f y
ngspice 4 -> 
```
### 3.c. Post-layout Characterization using Align Tool
```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ python3 -m venv general
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ source general/bin/activate
(general) prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ python3 -m pip install pip --upgrade
Requirement already satisfied: pip in ./general/lib/python3.8/site-packages (23.0)
(general) prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ cd work/
(general) prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/work$ schematic2layout.py ../ALIGN-pdk-sky130/examples/function/ -p ../pdks/SKY130_PDK/
align.main INFO : Reading netlist: /home/prajwalita17/VSD_8TSRAM/ALIGN-public/ALIGN-pdk-sky130/examples/function/function.sp subckt=FUNCTION, flat=0
align.compiler.compiler INFO : Starting topology identification...
align.compiler.compiler INFO : Power and ground nets not found. Power grid will not be constructed.
align.compiler.compiler INFO : Completed topology identification.
align.pnr.main INFO : Running Place & Route for FUNCTION
align.pnr.build_pnr_model INFO : Reading contraint json file FUNCTION.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file INV_986780.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file FUNCTION.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file INV_986780.pnr.const.json
align.pnr.placer INFO : Starting bottom-up placement on INV_986780 1
PnR.placer.SeqPair.SeqPair INFO : Enumerated search
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : Exhausted all permutations of seq pairs and found 1 placement solution(s)
align.pnr.placer INFO : Starting bottom-up placement on FUNCTION 0
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : Required 1 perturbations to generate a feasible solution.
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : ..... 10 %
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : ..... 20 %
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : ..... 30 %
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : ..... 40 %
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : ..... 50 %
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : ..... 60 %
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : ..... 70 %
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : ..... 80 %
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : ..... 90 %
align.pnr.build_pnr_model INFO : Reading contraint json file FUNCTION.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file INV_986780.pnr.const.json
PnR.placer.SeqPair.SeqPair INFO : Enumerated search
align.pnr.router INFO : Starting top_down routing on FUNCTION 0 restricted to None
PnR.router.Router.RouteWork INFO : GcellGlobalRouter: INV_986780
PnR.router.Router.RouteWork INFO : GcellDetailRouter: INV_986780
PnR.router.Router.RouteWork INFO : GcellGlobalRouter: FUNCTION
PnR.router.Router.RouteWork INFO : GcellDetailRouter: FUNCTION
PnR.router.Router.RouteWork INFO : Create power grid: FUNCTION
PnR.router.Router.RouteWork INFO : Power routing FUNCTION
align.pnr.main INFO : OUTPUT json at /home/prajwalita17/VSD_8TSRAM/ALIGN-public/work/3_pnr/INV_986780_0_0.json
align.pnr.main INFO : OUTPUT gds.json /home/prajwalita17/VSD_8TSRAM/ALIGN-public/work/3_pnr/INV_986780_0_0.python.gds.json
align.pnr.main INFO : OUTPUT json at /home/prajwalita17/VSD_8TSRAM/ALIGN-public/work/3_pnr/FUNCTION_0.json
align.pnr.main INFO : OUTPUT gds.json /home/prajwalita17/VSD_8TSRAM/ALIGN-public/work/3_pnr/FUNCTION_0.python.gds.json
Use KLayout to visualize the generated GDS: /home/prajwalita17/VSD_8TSRAM/ALIGN-public/work/FUNCTION_0.gds
Use KLayout to visualize the python generated GDS: /home/prajwalita17/VSD_8TSRAM/ALIGN-public/work/FUNCTION_0.python.gds
```
```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/work$ klayout FUNCTION_0.lef
```
![image](https://user-images.githubusercontent.com/104830557/219663626-13ced715-c7f9-4b92-a705-8a7c3a9ad342.png)

```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/work$ klayout FUNCTION_0.gds
```
<img width="994" alt="func gds" src="https://user-images.githubusercontent.com/104830557/219663250-45238b68-d530-4c8b-9611-b5e9cc9bbae7.png">

```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/work$ magic -T /home/prajwalita17/VSD_8TSRAM/open_pdks/sky130/sky130A/libs.tech/magic/sky130A.tech
```

File >> Read GDS >> FUNCTION_0.gds

![image](https://user-images.githubusercontent.com/104830557/219610696-aeba8305-731d-4933-a3e0-8a370463b16b.png)



### 3.d Comparison and LVS Report



