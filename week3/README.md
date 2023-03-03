# Week 3
# Index

- [Ring Oscillator Circuit Design in Xschem](https://github.com/prajwalita17/msvsd8tsram/edit/main/week3/README.md#ring-oscillator-circuit-design-in-xschem)
- [Pre-layout Simulation of Ring Oscillator using Xschem](https://github.com/prajwalita17/msvsd8tsram/edit/main/week3/README.md#pre-layout-simulation-of-ring-oscillator-using-xschem)
- [Post-layout Simulation of Ring Oscillator using ALIGN](https://github.com/prajwalita17/msvsd8tsram/edit/main/week3/README.md#post-layout-simulation-of-ring-oscillator-using-align)
- [Post-layout Simulation of Ring Oscillator using MAGIC](https://github.com/prajwalita17/msvsd8tsram/edit/main/week3/README.md#post-layout-simulation-of-ring-oscillator-using-magic))
- [Pre-layout and Post-layout Comparison](https://github.com/prajwalita17/msvsd8tsram/blob/main/week3/README.md#pre-layout-and-post-layout-comparison)

## Ring Oscillator Circuit Design in Xschem
Go to the work directory `prajwalita17@prajwalita17-VirtualBox:~/VSD_8TSRAM/work/xschem$ xschem`

<img width="1203" alt="image" src="https://user-images.githubusercontent.com/104830557/222686065-aa1ee8d2-aafc-4556-b189-0ace02b5a6c6.png">

<details>
  <summary>Netlist</summary>
  
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

## Pre-layout Simulation of Ring Oscillator using Xschem
## Post-layout Simulation of Ring Oscillator using ALIGN
## Post-layout Simulation of Ring Oscillator using MAGIC
## Pre-layout and Post-layout Comparison


