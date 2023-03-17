WEEK 4

<img width="1200" alt="Screenshot 2023-03-17 233300" src="https://user-images.githubusercontent.com/104830557/225987100-02064e3b-6e51-4144-9bf0-159059a81eaa.png">

```
** sch_path: /home/prajwalita17/VSD_8TSRAM/work/xschem/adc1bit.sch
**.subckt adc1bit
XM1 net1 in1 net3 net3 sky130_fd_pr__nfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM6 net3 in2 net2 net3 sky130_fd_pr__nfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM7 net2 net1 vdd vdd sky130_fd_pr__pfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM4 out net2 vdd vdd sky130_fd_pr__pfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM2 vdd net1 net1 vdd sky130_fd_pr__pfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM3 vdd net4 net4 vdd sky130_fd_pr__pfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM5 vss net4 net4 vss sky130_fd_pr__nfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM8 out net4 vss vss sky130_fd_pr__nfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
XM9 vss net4 net3 vss sky130_fd_pr__nfet_01v8 L=0.15 W=1 nf=1 ad='int((nf+1)/2) * W/nf * 0.29' as='int((nf+2)/2) * W/nf * 0.29'
+ pd='2*int((nf+1)/2) * (W/nf + 0.29)' ps='2*int((nf+2)/2) * (W/nf + 0.29)' nrd='0.29 / W' nrs='0.29 / W'
+ sa=0 sb=0 sd=0 mult=1 m=1
V1 vdd GND 1.8
.save i(v1)
V3 vss GND 0
.save i(v3)
V4 in1 GND 1
.save i(v4)
V2 in2 GND sin(1.5 1.5 50MEG 0.5n)
.save i(v2)
**** begin user architecture code
.tran 4n 100n
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.save all
**** end user architecture code
**.ends
.GLOBAL GND
```
<img width="772" alt="Screenshot 2023-03-17 233426" src="https://user-images.githubusercontent.com/104830557/225987122-f19a034b-3ae7-491a-a65c-d22d9cb4a896.png">

<img width="1054" alt="Screenshot 2023-03-17 233507" src="https://user-images.githubusercontent.com/104830557/225987241-be5d0f5b-b4a1-4437-8c44-c46eebbd2031.png">

```
.subckt adc1bit in1 in2 out vdd vss
XM1 net1 in1 net3 net3 sky130_fd_pr__nfet_01v8 L=150e-09 w=10.5e-7 nf=2 m=1
XM2 net3 net4 vss vss sky130_fd_pr__nfet_01v8 L=150e-09 w=10.5e-7 nf=10 m=1
XM3 out net4 gnd gnd sky130_fd_pr__nfet_01v8 L=150e-09 w=10.5e-7 nf=10 m=1
XM4 net2 in2 net3 net3 sky130_fd_pr__nfet_01v8 L=150e-09 w=10.5e-7 nf=10 m=1
XM5 net4 net4 vss vss sky130_fd_pr__nfet_01v8 L=150e-09 w=10.5e-7 nf=10 m=1
XM6 net2 net1 vdd vdd sky130_fd_pr__pfet_01v8 L=150e-09 w=10.5e-7 nf=2 m=1
XM7 net1 net1 vdd vdd sky130_fd_pr__pfet_01v8 L=150e-09 w=10.5e-7 nf=2 m=1
XM8 out net2 vdd vdd sky130_fd_pr__pfet_01v8 L=150e-09 w=10.5e-7 nf=2 m=1
XM9 net4 net4 vdd vdd sky130_fd_pr__pfet_01v8 L=150e-09 w=10.5e-7 nf=2 m=1
.ends
```

<img width="731" alt="Screenshot 2023-03-17 233858" src="https://user-images.githubusercontent.com/104830557/225987266-ccebd94e-f11f-4741-9d74-c3dc3a35b7f4.png">

```
* SPICE3 file created from ADC1BIT_0.ext - technology: sky130A
V1 VDD GND 1.8
V2 VSS GND 0
V3 IN1 GND 1
V4 IN2 GND SIN(1.5 1.5 50MEG 0.5n)
x1 OUT VDD VSS IN1 IN2 adc1bit
**** begin user architecture code
.tran 4n 100n
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
**** end user architecture code
.subckt adc1bit OUT VDD VSS IN1 IN2
X0 m1_946_2912# m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=1.47e+12p pd=1.33e+07u as=8.694e+12p ps=7.956e+07u w=1.05e+06u l=150000u
X1 m1_946_2912# m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X2 VSUBS m1_914_2072# m1_946_2912# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X3 VSUBS m1_914_2072# m1_946_2912# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X4 m1_946_2912# m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X5 m1_946_2912# m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X6 VSUBS m1_914_2072# m1_946_2912# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X7 m1_946_2912# m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X8 VSUBS m1_914_2072# m1_946_2912# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X9 VSUBS m1_914_2072# m1_946_2912# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X10 VDD m1_2978_1568# m1_1978_2072# VDD sky130_fd_pr__pfet_01v8 ad=1.9635e+12p pd=1.844e+07u as=2.94e+11p ps=2.66e+06u w=1.05e+06u l=150000u
X11 m1_2978_1568# m1_2978_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=2.94e+11p pd=2.66e+06u as=0p ps=0u w=1.05e+06u l=150000u
X12 VDD m1_2978_1568# m1_2978_1568# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X13 m1_1978_2072# m1_2978_1568# VDD VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X14 m1_946_2912# m1_1978_2072# VDD VDD sky130_fd_pr__pfet_01v8 ad=2.94e+11p pd=2.66e+06u as=0p ps=0u w=1.05e+06u l=150000u
X15 VDD m1_1978_2072# m1_946_2912# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X16 m1_914_2072# m1_914_2072# VDD VDD sky130_fd_pr__pfet_01v8 ad=2.94e+11p pd=2.66e+06u as=0p ps=0u w=1.05e+06u l=150000u
X17 VDD m1_914_2072# m1_914_2072# VDD sky130_fd_pr__pfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X18 m1_2978_1568# NMOS_S_54487678_X1_Y1_1679036484_0/a_200_252# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=2.94e+11p pd=2.66e+06u as=0p ps=0u w=1.05e+06u l=150000u
X19 VSUBS NMOS_S_54487678_X1_Y1_1679036484_0/a_200_252# m1_2978_1568# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X20 VSUBS m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X21 VSUBS m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X22 VSUBS m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X23 VSUBS m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X24 VSUBS m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X25 VSUBS m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X26 VSUBS m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X27 m1_914_2072# m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=1.47e+12p pd=1.33e+07u as=0p ps=0u w=1.05e+06u l=150000u
X28 VSUBS m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X29 VSUBS m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X30 m1_914_2072# m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X31 m1_914_2072# m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X32 VSUBS m1_914_2072# m1_914_2072# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X33 m1_914_2072# m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X34 VSUBS m1_914_2072# m1_914_2072# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X35 VSUBS m1_914_2072# m1_914_2072# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X36 m1_914_2072# m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X37 VSUBS m1_914_2072# m1_914_2072# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X38 VSUBS m1_914_2072# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X39 VSUBS m1_914_2072# m1_914_2072# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X40 m1_1978_2072# NMOS_S_79666698_X5_Y1_1679036485_0/a_200_252# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=1.47e+12p pd=1.33e+07u as=0p ps=0u w=1.05e+06u l=150000u
X41 m1_1978_2072# NMOS_S_79666698_X5_Y1_1679036485_0/a_200_252# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X42 VSUBS NMOS_S_79666698_X5_Y1_1679036485_0/a_200_252# m1_1978_2072# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X43 VSUBS NMOS_S_79666698_X5_Y1_1679036485_0/a_200_252# m1_1978_2072# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X44 m1_1978_2072# NMOS_S_79666698_X5_Y1_1679036485_0/a_200_252# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X45 m1_1978_2072# NMOS_S_79666698_X5_Y1_1679036485_0/a_200_252# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X46 VSUBS NMOS_S_79666698_X5_Y1_1679036485_0/a_200_252# m1_1978_2072# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X47 m1_1978_2072# NMOS_S_79666698_X5_Y1_1679036485_0/a_200_252# VSUBS VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X48 VSUBS NMOS_S_79666698_X5_Y1_1679036485_0/a_200_252# m1_1978_2072# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
X49 VSUBS NMOS_S_79666698_X5_Y1_1679036485_0/a_200_252# m1_1978_2072# VSUBS sky130_fd_pr__nfet_01v8 ad=0p pd=0u as=0p ps=0u w=1.05e+06u l=150000u
C0 NMOS_S_54487678_X1_Y1_1679036484_0/a_200_252# m1_2978_1568# 0.11fF
C1 OUT VDD 0.39fF
C2 m1_1978_2072# m1_914_2072# 0.04fF
C3 IN2 m1_914_2072# 0.04fF
C4 m1_914_2072# m1_2978_1568# 0.01fF
C5 VSUBS VDD 0.26fF
C6 m1_1978_2072# VDD 3.53fF
C7 IN2 VDD 0.02fF
C8 VDD m1_2978_1568# 2.73fF
C9 IN1 m1_914_2072# 0.00fF
C10 IN1 VDD 0.03fF
C11 VDD m1_914_2072# 2.71fF
C12 VSUBS m1_946_2912# 0.00fF
C13 m1_946_2912# m1_1978_2072# 0.11fF
C14 m1_1978_2072# VSS 0.23fF
C15 IN2 VSS 0.03fF
C16 m1_2978_1568# VSS 0.13fF
C17 m1_1978_2072# NMOS_S_79666698_X5_Y1_1679036485_0/a_200_252# 0.56fF
C18 OUT m1_2978_1568# 0.00fF
C19 IN1 m1_946_2912# 0.00fF
C20 VSUBS m1_1978_2072# 0.15fF
C21 VSUBS IN2 0.00fF
C22 m1_946_2912# m1_914_2072# 0.58fF
C23 VSUBS m1_2978_1568# 0.40fF
C24 IN2 m1_1978_2072# 0.01fF
C25 m1_1978_2072# m1_2978_1568# 0.34fF
C26 IN2 m1_2978_1568# 0.02fF
C27 m1_914_2072# VSS 0.43fF
C28 m1_946_2912# VDD 0.80fF
C29 VDD VSS 0.65fF
C30 OUT m1_914_2072# 0.02fF
C31 IN1 VSUBS 0.01fF
C32 IN1 m1_1978_2072# 0.00fF
C33 IN1 IN2 0.00fF
C34 VSUBS m1_914_2072# 1.57fF
C35 IN1 m1_2978_1568# 0.05fF
.ends
```
<img width="1052" alt="Screenshot 2023-03-18 000553" src="https://user-images.githubusercontent.com/104830557/225990079-5af58d18-09c1-48e9-abb3-b7d898b4aa58.png">

<img width="799" alt="Screenshot 2023-03-18 000651" src="https://user-images.githubusercontent.com/104830557/225990235-ac8ca302-9ab3-44c7-9dc9-5f9d75b7219b.png">
