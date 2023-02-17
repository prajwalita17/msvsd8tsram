# msvsd8tsram

## ALIGN installation
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

## Simulation of CMOS Inverter 
### Pre-layout Characterization using Xschem/Ngspice
<img width="583" alt="inverter schematic" src="https://user-images.githubusercontent.com/104830557/219540453-82d875e9-9916-4fb7-84fb-2c933e35038f.png">

<img width="980" alt="inverter subcircuit" src="https://user-images.githubusercontent.com/104830557/219540467-06e5482f-fa8b-4ebe-9d1a-9032add1af5c.png">

### Post-layout Characterization using Magic/Ngspice
### Post-layout Characterization using ALign Tool
```
prajwalita17@prajwalita17-VirtualBox:~$ **cd VSD_8TSRAM/ALIGN-public/**
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

<img width="201" alt="inverter align" src="https://user-images.githubusercontent.com/104830557/219541609-31fe475f-60d4-4c6f-a395-9a13f568a452.png">

### Comparison and LVS Report

## Simulation of Function 
### Pre-layout Characterization using Xschem/Ngspice
<img width="526" alt="function schematic" src="https://user-images.githubusercontent.com/104830557/219541683-9e8ceb22-edb7-4612-86a2-fab51911d96d.png">
<img width="1150" alt="function subcircuit" src="https://user-images.githubusercontent.com/104830557/219541693-9fc49481-a42f-4c22-9e1f-dccb691ea7db.png">

<img width="1016" alt="function prelayout" src="https://user-images.githubusercontent.com/104830557/219541640-89d429dc-dd22-4fcf-afc1-546362649475.png">

### Post-layout Characterization using Magic/Ngspice
### Post-layout Characterization using Align Tool
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
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/work$ magic -T /home/prajwalita17/VSD_8TSRAM/open_pdks/sky130/sky130A/libs.tech/magic/sky130A.tech
```
File >> Read GDS >> FUNTION_0.gds

<img width="577" alt="image" src="https://user-images.githubusercontent.com/104830557/219551204-46734329-84ae-4fa4-9646-4cb035447ec9.png">



### Comparison and LVS Report



