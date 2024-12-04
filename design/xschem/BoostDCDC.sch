v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 300 -90 310 -90 {lab=GND}
N 240 -90 260 -90 {lab=Vg}
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
N 300 -190 300 -170 {lab=SW}
N 300 -30 300 -20 {lab=GND}
N 520 -60 520 -50 {lab=GND}
N 300 -140 300 -120 {lab=SW}
N 310 -90 310 -50 {lab=GND}
N 520 -190 520 -140 {lab=vo}
N 540 -190 550 -190 {lab=vo}
N 520 -70 520 -60 {lab=GND}
N 520 -140 520 -130 {lab=vo}
N 420 -240 420 -190 {lab=#net1}
N 370 -190 370 -180 {lab=SW}
N 180 -190 200 -190 {lab=#net2}
N 520 -50 520 -30 {lab=GND}
N 310 -50 310 -30 {lab=GND}
N 300 -50 300 -30 {lab=GND}
N 300 -170 300 -140 {lab=SW}
N 630 -80 630 -30 {lab=GND}
N 620 -30 630 -30 {lab=GND}
N 330 -180 370 -180 {lab=SW}
N 330 -190 330 -180 {lab=SW}
N 500 -190 540 -190 {lab=vo}
N 400 -190 440 -190 {lab=#net1}
N 300 -60 300 -50 {lab=GND}
N 550 -190 630 -190 {lab=vo}
N 630 -190 630 -140 {lab=vo}
N 300 -30 620 -30 {lab=GND}
N 110 -70 110 -30 {lab=GND}
N 110 -30 300 -30 {lab=GND}
N 110 -190 110 -130 {lab=vin}
N 370 -240 370 -230 {lab=#net1}
N 370 -240 420 -240 {lab=#net1}
C {xschem/symbols/OR1/primitives/nfet.sym} 280 -90 0 0 {name=M1 
model=nchor1ex
W=2u
L=1u
m=100}
C {devices/ind.sym} 230 -190 3 1 {name=L1
m=1
value=3m
footprint=1206
device=inductor}
C {devices/gnd.sym} 300 -20 0 0 {name=l2 lab=GND}
C {devices/capa.sym} 520 -100 0 0 {name=C1
m=1
value=18u
footprint=1206
device="ceramic capacitor"}
C {devices/vsource.sym} 30 -350 0 0 {name=Vdd value="pwl 0 0 1u 0 2u 5.0" savecurrent=false
}
C {devices/gnd.sym} 30 -280 0 0 {name=l4}
C {devices/vsource.sym} 100 -370 0 0 {name=vin value="pulse 5 0 3u 1u 1u 5u 10u" savecurrent=false}
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
tran 0.05u 10m
plot vo
plot SW
plot i(lin) 
plot i(Vout)
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
C {devices/lab_pin.sym} 240 -90 0 0 {name=p5 sig_type=std_logic lab=Vg}
C {devices/ammeter.sym} 150 -190 3 0 {name=lin savecurrent=true spice_ignore=0}
C {primitives/pfet.sym} 370 -210 3 1 {name=M2 
model=pchor1ex
W=3.3u
L=1u
m=100}
C {devices/lab_pin.sym} 310 -190 3 1 {name=p6 sig_type=std_logic lab=SW}
C {devices/res.sym} 630 -110 0 0 {name=R1
value=1000
footprint=1206
device=resistor
m=1}
C {devices/ammeter.sym} 470 -190 3 0 {name=vout savecurrent=true spice_ignore=0}
C {devices/capa.sym} 110 -100 0 0 {name=C2
m=1
value=47u
footprint=1206
device="ceramic capacitor"}
