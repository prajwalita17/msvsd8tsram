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



