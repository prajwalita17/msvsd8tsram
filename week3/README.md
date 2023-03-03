# Week 3
# Index

- [Ring Oscillator Circuit Design in Xschem](https://github.com/prajwalita17/msvsd8tsram/edit/main/week3/README.md#ring-oscillator-circuit-design-in-xschem)
- [Pre-layout Simulation of Ring Oscillator using Xschem](https://github.com/prajwalita17/msvsd8tsram/edit/main/week3/README.md#pre-layout-simulation-of-ring-oscillator-using-xschem)
- [Post-layout Simulation of Ring Oscillator using ALIGN](https://github.com/prajwalita17/msvsd8tsram/edit/main/week3/README.md#post-layout-simulation-of-ring-oscillator-using-align)
- [Post-layout Simulation of Ring Oscillator using MAGIC](https://github.com/prajwalita17/msvsd8tsram/edit/main/week3/README.md#post-layout-simulation-of-ring-oscillator-using-magic))
- [Pre-layout and Post-layout Comparison](https://github.com/prajwalita17/msvsd8tsram/blob/main/week3/README.md#pre-layout-and-post-layout-comparison)

## Ring Oscillator Circuit Design in Xschem

## Pre-layout Simulation of Ring Oscillator using Xschem
Go to the work directory `prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/work/xschem$ xschem`

<img width="1203" alt="image" src="https://user-images.githubusercontent.com/104830557/222686065-aa1ee8d2-aafc-4556-b189-0ace02b5a6c6.png">

<details>
  <summary>Netlist extracted from Xschem</summary>
  
```  
** sch_path: /home/prajwalita17/VSD_8TSRAM/work/xschem/ring_oscillator.sch
**.subckt ring_oscillator
XM1 net1 OUT VDD net3 sky130_fd_pr__pfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM2 net2 net1 VDD net4 sky130_fd_pr__pfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM3 OUT net2 VDD net5 sky130_fd_pr__pfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM4 net1 OUT GND net6 sky130_fd_pr__nfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM5 net2 net1 GND net7 sky130_fd_pr__nfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM6 OUT net2 GND net8 sky130_fd_pr__nfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
Vdd VDD GND 1.8
.save i(vdd)
**** begin user architecture code
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.tran 1p 4n
.save all
**** end user architecture code
**.ends
.GLOBAL GND
.GLOBAL VDD
.end
```
  
</details>

<details>
  <summary>Ngspice simulation</summary>
  
```
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/work/xschem$ ngspice ../../../.xschem/simulations/ring_oscillator.spice
******
** ngspice-39 : Circuit level simulation program
** The U. C. Berkeley CAD Group
** Copyright 1985-1994, Regents of the University of California.
** Copyright 2001-2022, The ngspice team.
** Please get your ngspice manual from http://ngspice.sourceforge.net/docs.html
** Please file your bug-reports at http://ngspice.sourceforge.net/bugrep.html
** Creation Date: Wed Feb 22 10:52:33 UTC 2023
******
Note: Compatibility modes selected: hs a
Warning: m=xx on .subckt line will override multiplier m hierarchy!
Circuit: ** sch_path: /home/prajwalita17/vsd_8tsram/work/xschem/ring_oscillator.sch
option SCALE: Scale is set to 1e-06 for instance and model parameters
ngspice 3 -> run
Doing analysis at TEMP = 27.000000 and TNOM = 27.000000
Initial Transient Solution
--------------------------
Node                                   Voltage
----                                   -------
net1                                  0.828177
out                                   0.828177
vdd                                        1.8
net3                                   1.57104
net2                                  0.828177
net4                                   1.57104
net5                                   1.57104
net6                                  0.201769
net7                                  0.201769
net8                                  0.201769
vdd#branch                        -7.43745e-05
 Reference value :  0.00000e+00
No. of Data Rows : 5008
ngspice 4 -> plot out
```

</details>

<img width="1053" alt="image" src="https://user-images.githubusercontent.com/104830557/222695929-630ff0f7-179a-42ba-b698-090383d42ab6.png">

## Post-layout Simulation of Ring Oscillator using ALIGN

<details>
  <summary>Input Netlist to ALIGN</summary>
  
```
.subckt ring_oscillator OUT VDD GND
XM1 net1 OUT GND GND sky130_fd_pr__nfet_01v8 L=150e-09 w=10.5e-7 nf=10 m=1
XM2 net2 net1 GND GND sky130_fd_pr__nfet_01v8 L=150e-09 w=10.5e-7 nf=10 m=1
XM3 OUT net2 GND GND sky130_fd_pr__nfet_01v8 L=150e-09 w=10.5e-7 nf=10 m=1
XM4 net1 OUT VDD VDD sky130_fd_pr__pfet_01v8 L=150e-09 w=10.5e-7 nf=10 m=1
XM5 net2 net1 VDD VDD sky130_fd_pr__pfet_01v8 L=150e-09 w=10.5e-7 nf=10 m=1
XM6 OUT net2 VDD VDD sky130_fd_pr__pfet_01v8 L=150e-09 w=10.5e-7 nf=10 m=1
.ends
```
</details>


<details>
  <summary>ALIGN virtual environment</summary>

 ```    
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ python3 -m venv general
prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ source general/bin/activate
(general) prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ python3 -m pip install pip --upgrade
Requirement already satisfied: pip in ./general/lib/python3.8/site-packages (23.0.1)
(general) prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public$ cd week3/
(general) prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/week3$ schematic2layout.py ../ALIGN-pdk-sky130/examples/ring_oscillator/ -p ../pdks/SKY130_PDK/
```
  
</details>
  
<details>
  <summary>ALIGN Layout</summary>  
  
```  
(general) prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/ALIGN-public/week3$ schematic2layout.py ../ALIGN-pdk-sky130/examples/ring_oscillator/ -p ../pdks/SKY130_PDK/
align.main INFO : Reading netlist: /home/prajwalita17/VSD_8TSRAM/ALIGN-public/ALIGN-pdk-sky130/examples/ring_oscillator/ring_oscillator.sp subckt=RING_OSCILLATOR, flat=0
align.compiler.compiler INFO : Starting topology identification...
align.compiler.compiler INFO : Power and ground nets not found. Power grid will not be constructed.
align.compiler.compiler INFO : Completed topology identification.
align.pnr.main INFO : Running Place & Route for RING_OSCILLATOR
align.pnr.build_pnr_model INFO : Reading contraint json file RING_OSCILLATOR.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file STAGE2_INV_62673116.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file INV_57920576.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file RING_OSCILLATOR.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file STAGE2_INV_62673116.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file INV_57920576.pnr.const.json
align.pnr.placer INFO : Starting bottom-up placement on STAGE2_INV_62673116 1
PnR.placer.SeqPair.SeqPair INFO : Enumerated search
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : Exhausted all permutations of seq pairs and found 1 placement solution(s)
align.pnr.placer INFO : Starting bottom-up placement on INV_57920576 2
PnR.placer.SeqPair.SeqPair INFO : Enumerated search
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : Exhausted all permutations of seq pairs and found 1 placement solution(s)
align.pnr.placer INFO : Starting bottom-up placement on RING_OSCILLATOR 0
PnR.placer.SeqPair.SeqPair INFO : Enumerated search
PnR.placer.Placer.PlacementCoreAspectRatio_ILP INFO : Exhausted all permutations of seq pairs and found 1 placement solution(s)
align.pnr.build_pnr_model INFO : Reading contraint json file RING_OSCILLATOR.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file STAGE2_INV_62673116.pnr.const.json
align.pnr.build_pnr_model INFO : Reading contraint json file INV_57920576.pnr.const.json
PnR.placer.SeqPair.SeqPair INFO : Enumerated search
PnR.placer.SeqPair.SeqPair INFO : Enumerated search
PnR.placer.SeqPair.SeqPair INFO : Enumerated search
align.pnr.router INFO : Starting top_down routing on RING_OSCILLATOR 0 restricted to None
PnR.router.Router.RouteWork INFO : GcellGlobalRouter: STAGE2_INV_62673116
PnR.router.Router.RouteWork INFO : GcellDetailRouter: STAGE2_INV_62673116
PnR.router.Router.RouteWork INFO : GcellGlobalRouter: INV_57920576
PnR.router.Router.RouteWork INFO : GcellDetailRouter: INV_57920576
PnR.router.Router.RouteWork INFO : GcellGlobalRouter: RING_OSCILLATOR
PnR.router.Router.RouteWork INFO : GcellDetailRouter: RING_OSCILLATOR
PnR.router.Router.RouteWork INFO : Create power grid: RING_OSCILLATOR
PnR.router.Router.RouteWork INFO : Power routing RING_OSCILLATOR
align.pnr.main INFO : OUTPUT json at /home/prajwalita17/VSD_8TSRAM/ALIGN-public/week3/3_pnr/STAGE2_INV_62673116_0_0.json
align.pnr.main INFO : OUTPUT gds.json /home/prajwalita17/VSD_8TSRAM/ALIGN-public/week3/3_pnr/STAGE2_INV_62673116_0_0.python.gds.json
align.pnr.main INFO : OUTPUT json at /home/prajwalita17/VSD_8TSRAM/ALIGN-public/week3/3_pnr/INV_57920576_0_0.json
align.pnr.main INFO : OUTPUT gds.json /home/prajwalita17/VSD_8TSRAM/ALIGN-public/week3/3_pnr/INV_57920576_0_0.python.gds.json
align.pnr.main INFO : OUTPUT json at /home/prajwalita17/VSD_8TSRAM/ALIGN-public/week3/3_pnr/RING_OSCILLATOR_0.json
align.pnr.main INFO : OUTPUT gds.json /home/prajwalita17/VSD_8TSRAM/ALIGN-public/week3/3_pnr/RING_OSCILLATOR_0.python.gds.json
Use KLayout to visualize the generated GDS: /home/prajwalita17/VSD_8TSRAM/ALIGN-public/week3/RING_OSCILLATOR_0.gds
Use KLayout to visualize the python generated GDS: /home/prajwalita17/VSD_8TSRAM/ALIGN-public/week3/RING_OSCILLATOR_0.python.gds
```
   
</details> 

<img width="1204" alt="image" src="https://user-images.githubusercontent.com/104830557/222703380-d2536814-6725-42c8-9186-bbe01aedcada.png">

<details>
  <summary>Extracted Netlist</summary>
  
  ```
  * SPICE3 file created from RING_OSCILLATOR_0.ext - technology: sky130A
X0 OUT m1_828_1568# GND GND sky130_fd_pr__nfet_01v8 ad=1.47e+12p pd=1.33e+07u as=5.1975e+12p ps=4.77e+07u w=1.05e+06u l=150000u
X1 OUT m1_828_1568# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X2 GND m1_828_1568# OUT GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X3 GND m1_828_1568# OUT GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X4 OUT m1_828_1568# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X5 OUT m1_828_1568# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X6 GND m1_828_1568# OUT GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X7 OUT m1_828_1568# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X8 GND m1_828_1568# OUT GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X9 GND m1_828_1568# OUT GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X10 OUT m1_828_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=1.47e+12p pd=1.33e+07u as=5.1975e+12p ps=4.77e+07u w=1.05e+06u l=150000u
X11 VDD m1_828_1568# OUT VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X12 VDD m1_828_1568# OUT VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X13 OUT m1_828_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X14 OUT m1_828_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X15 VDD m1_828_1568# OUT VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X16 OUT m1_828_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X17 VDD m1_828_1568# OUT VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X18 VDD m1_828_1568# OUT VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X19 OUT m1_828_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X20 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD VDD sky130_fd_pr__pfet_01v8 ad=1.47e+12p pd=1.33e+07u as=0p ps=0u w=1.05e+06u l=150000u
X21 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X22 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X23 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X24 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X25 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X26 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X27 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X28 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X29 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X30 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT VDD VDD sky130_fd_pr__pfet_01v8 ad=1.47e+12p pd=1.33e+07u as=0p ps=0u w=1.05e+06u l=150000u
X31 VDD OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X32 VDD OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X33 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X34 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X35 VDD OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X36 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X37 VDD OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X38 VDD OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X39 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X40 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND GND sky130_fd_pr__nfet_01v8 ad=1.47e+12p pd=1.33e+07u as=0p ps=0u w=1.05e+06u l=150000u
X41 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X42 GND STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X43 GND STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X44 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X45 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X46 GND STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X47 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X48 GND STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X49 GND STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X50 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT GND GND sky130_fd_pr__nfet_01v8 ad=1.47e+12p pd=1.33e+07u as=0p ps=0u w=1.05e+06u l=150000u
X51 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X52 GND OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X53 GND OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X54 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X55 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X56 GND OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X57 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X58 GND OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X59 GND OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
C0 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# 8.51fF
C1 VDD OUT 8.55fF
C2 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# 1.83fF
C3 m1_828_1568# OUT 1.84fF
C4 m1_828_1568# VDD 7.87fF
C5 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT 1.49fF
C6 OUT GND 6.41fF **FLOATING
C7 m1_828_1568# GND 6.52fF **FLOATING
C8 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND 5.34fF **FLOATING
C9 VDD GND 17.11fF **FLOATING
```
  
</details>
  
<details>
  <summary>Extracted Netlist</summary>
  
```
 * SPICE3 file created from RING_OSCILLATOR_0.ext - technology: sky130A
V1 VDD GND 1.8
x1 OUT GND VDD ring_oscillator
**** begin user architecture code
.tran 1p 5n
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
**** end user architecture code
.subckt ring_oscillator OUT GND VDD
X0 OUT m1_828_1568# GND GND sky130_fd_pr__nfet_01v8 ad=1.47e+12p pd=1.33e+07u as=5.1975e+12p ps=4.77e+07u w=1.05e+06u l=150000u
X1 OUT m1_828_1568# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X2 GND m1_828_1568# OUT GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X3 GND m1_828_1568# OUT GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X4 OUT m1_828_1568# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X5 OUT m1_828_1568# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X6 GND m1_828_1568# OUT GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X7 OUT m1_828_1568# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X8 GND m1_828_1568# OUT GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X9 GND m1_828_1568# OUT GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X10 OUT m1_828_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=1.47e+12p pd=1.33e+07u as=5.1975e+12p ps=4.77e+07u w=1.05e+06u l=150000u
X11 VDD m1_828_1568# OUT VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X12 VDD m1_828_1568# OUT VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X13 OUT m1_828_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X14 OUT m1_828_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X15 VDD m1_828_1568# OUT VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X16 OUT m1_828_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X17 VDD m1_828_1568# OUT VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X18 VDD m1_828_1568# OUT VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X19 OUT m1_828_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X20 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD VDD sky130_fd_pr__pfet_01v8 ad=1.47e+12p pd=1.33e+07u as=0p ps=0u w=1.05e+06u l=150000u
X21 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X22 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X23 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X24 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X25 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X26 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X27 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X28 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X29 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X30 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT VDD VDD sky130_fd_pr__pfet_01v8 ad=1.47e+12p pd=1.33e+07u as=0p ps=0u w=1.05e+06u l=150000u
X31 VDD OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X32 VDD OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X33 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X34 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X35 VDD OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X36 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X37 VDD OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X38 VDD OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X39 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X40 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND GND sky130_fd_pr__nfet_01v8 ad=1.47e+12p pd=1.33e+07u as=0p ps=0u w=1.05e+06u l=150000u
X41 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X42 GND STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X43 GND STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X44 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X45 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X46 GND STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X47 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X48 GND STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X49 GND STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# m1_828_1568# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X50 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT GND GND sky130_fd_pr__nfet_01v8 ad=1.47e+12p pd=1.33e+07u as=0p ps=0u w=1.05e+06u l=150000u
X51 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X52 GND OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X53 GND OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X54 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X55 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X56 GND OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X57 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT GND GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X58 GND OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X59 GND OUT STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# GND sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
C0 VDD STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# 8.51fF
C1 VDD OUT 8.55fF
C2 m1_828_1568# STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# 1.83fF
C3 m1_828_1568# OUT 1.84fF
C4 m1_828_1568# VDD 7.87fF
C5 STAGE2_INV_62673116_0_0_1677839736_0/li_1179_1495# OUT 1.49fF
.ends
```
</details>
 
<img width="1052" alt="image" src="https://user-images.githubusercontent.com/104830557/222762363-635a6fe2-ad07-4d8c-8ea4-8c66472d611a.png">

## Post-layout Simulation of Ring Oscillator using MAGIC

<img width="953" alt="image" src="https://user-images.githubusercontent.com/104830557/222754031-9ab2a2a6-d23b-4dfa-b0c0-7312c0ccdfe0.png">

<details>
  <summary>Extracted Netlist</summary>

```  
* SPICE3 file created from ring_oscillator1.ext - technology: sky130A
V1 vdd gnd 1.8
x1 Y vdd gnd ring_oscillator1
**** begin user architecture code
.tran 1p 5n
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
**** end user architecture code
.subckt ring_oscillator1 Y vdd gnd
X0 m1_184_112# Y vdd XM5/w_n211_n319# sky130_fd_pr__pfet_01v8 ad=2.9e+11p pd=2.58e+06u as=8.7e+11p ps=7.74e+06u w=1e+06u l=150000u
X1 m1_184_112# Y gnd VSUBS sky130_fd_pr__nfet_01v8 ad=2.9e+11p pd=2.58e+06u as=8.7e+11p ps=7.74e+06u w=1e+06u l=150000u
X2 m1_604_112# m1_184_112# vdd XM5/w_n211_n319# sky130_fd_pr__pfet_01v8 ad=2.9e+11p pd=2.58e+06u as=0p ps=0u w=1e+06u l=150000u
X3 m1_604_112# m1_184_112# gnd VSUBS sky130_fd_pr__nfet_01v8 ad=2.9e+11p pd=2.58e+06u as=0p ps=0u w=1e+06u l=150000u
X4 Y m1_604_112# vdd XM5/w_n211_n319# sky130_fd_pr__pfet_01v8 ad=2.9e+11p pd=2.58e+06u as=0p ps=0u w=1e+06u l=150000u
X5 Y m1_604_112# gnd VSUBS sky130_fd_pr__nfet_01v8 ad=2.9e+11p pd=2.58e+06u as=0p ps=0u w=1e+06u l=150000u
C0 m1_184_112# gnd 0.35fF
C1 Y vdd 0.30fF
C2 Y XM5/w_n211_n319# 1.06fF
C3 Y m1_604_112# 0.46fF
C4 XM5/w_n211_n319# vdd 1.14fF
C5 m1_604_112# vdd 0.34fF
C6 m1_604_112# XM5/w_n211_n319# 0.59fF
C7 Y m1_184_112# 0.47fF
C8 Y gnd 0.30fF
C9 m1_184_112# vdd 0.34fF
C10 m1_184_112# XM5/w_n211_n319# 0.58fF
C11 gnd vdd 0.01fF
C12 XM5/w_n211_n319# gnd 0.00fF
C13 m1_604_112# m1_184_112# 0.17fF
C14 m1_604_112# gnd 0.34fF
C18 gnd VSUBS 0.66fF
.ends
```
</details>  
  
  <img width="1052" alt="image" src="https://user-images.githubusercontent.com/104830557/222753043-558deaa3-c3fb-4fcb-9039-5c35b7d61928.png">

## Pre-layout and Post-layout Comparison


