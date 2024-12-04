v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 300 -70 310 -70 {lab=GND}
N 240 -70 260 -70 {lab=Vg}
N 100 -190 120 -190 {lab=vin}
N 100 -430 100 -400 {
lab=Vg}
N 100 -340 100 -300 {
lab=GND}
N 30 -320 30 -280 {
lab=GND}
N 30 -410 30 -380 {
lab=vin}
N 260 -190 280 -190 {lab=SW}
N 280 -190 340 -190 {lab=SW}
N 300 -10 300 0 {lab=GND}
N 520 -40 520 -30 {lab=GND}
N 310 -70 310 -30 {lab=GND}
N 520 -190 520 -140 {lab=vo}
N 540 -190 550 -190 {lab=vo}
N 520 -50 520 -40 {lab=GND}
N 520 -140 520 -130 {lab=vo}
N 180 -190 200 -190 {lab=#net1}
N 300 -30 300 -10 {lab=GND}
N 630 -80 630 -30 {lab=GND}
N 620 -30 630 -30 {lab=GND}
N 500 -190 540 -190 {lab=vo}
N 400 -190 440 -190 {lab=#net2}
N 300 -40 300 -30 {lab=GND}
N 550 -190 630 -190 {lab=vo}
N 630 -190 630 -140 {lab=vo}
N 300 -30 620 -30 {lab=GND}
N 300 -120 300 -100 {lab=#net3}
N 300 -190 300 -180 {lab=SW}
N 520 -70 520 -50 {lab=GND}
C {xschem/symbols/OR1/primitives/nfet.sym} 280 -70 0 0 {name=M1 
model=nchor1ex
W=2u
L=1u
m=100}
C {devices/ind.sym} 230 -190 3 1 {name=L1
m=1
value=22u
footprint=1206
device=inductor}
C {devices/gnd.sym} 300 0 0 0 {name=l2 lab=GND}
C {devices/capa.sym} 520 -100 0 0 {name=C1
m=1
value=4.7u
footprint=1206
device="ceramic capacitor"}
C {devices/vsource.sym} 30 -350 0 0 {name=Vdd value="pwl 0 0 1u 0 2u 3.0" savecurrent=false
}
C {devices/gnd.sym} 30 -280 0 0 {name=l4}
C {devices/vsource.sym} 100 -370 0 0 {name=vin value="pulse 5 0 3u 0.05u 0.05u 5u 10u" savecurrent=false}
C {devices/lab_pin.sym} 30 -410 1 0 {name=p3 sig_type=std_logic lab=vin}
C {devices/gnd.sym} 100 -300 0 0 {name=l5}
C {devices/lab_pin.sym} 100 -190 0 0 {name=p1 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} 520 -170 0 1 {name=p2 sig_type=std_logic lab=vo}
C {devices/lab_pin.sym} 100 -430 1 0 {name=p4 sig_type=std_logic lab=Vg}
C {devices/code_shown.sym} 440 -520 0 0 {name=spice only_toplevel=false value="
.option savecurrent
.ic V(vo) = 0
.control
save all

* Tran analysis
tran 0.05u 100u
plot vo
plot SW
plot Vg
plot i(lin) 
plot i(vout) i(vout1)
wrdata ~/Boost_tb_tran.txt v(vo)
write Boost_tb_trans.raw
.endc"}
C {devices/code.sym} 290 -460 0 0 {name=PTC06_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include $::LIB/mos.lib
.include $::LIB/passive.lib
.include $::LIB/diode.lib"
spice_ignore=false}
C {devices/lab_pin.sym} 240 -70 0 0 {name=p5 sig_type=std_logic lab=Vg}
C {devices/ammeter.sym} 150 -190 3 0 {name=lin savecurrent=true spice_ignore=0}
C {devices/lab_pin.sym} 310 -190 3 1 {name=p6 sig_type=std_logic lab=SW}
C {devices/res.sym} 630 -110 0 0 {name=R1
value=10Meg
footprint=1206
device=resistor
m=1}
C {devices/ammeter.sym} 470 -190 3 0 {name=vout savecurrent=true spice_ignore=0}
C {primitives/pts_np.sym} 370 -190 1 0 {name=D1
model=pts_np_b
area=100e-12}
C {devices/ammeter.sym} 300 -150 0 0 {name=vout1 savecurrent=true spice_ignore=0}
