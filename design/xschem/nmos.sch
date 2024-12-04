v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 260 -30 270 -30 {lab=GND}
N 270 -30 270 10 {lab=GND}
N 260 10 270 10 {lab=GND}
N 260 0 260 10 {lab=GND}
N 40 -80 50 -80 {lab=VDD}
N 200 -30 220 -30 {lab=Vg}
N 260 -80 260 -70 {lab=Vd}
N 50 -80 50 -70 {lab=VDD}
N 260 -150 260 -140 {lab=VDD}
N 110 -80 110 -70 {lab=Vg}
N 260 -70 260 -60 {lab=Vd}
N 110 -10 110 -0 {lab=GND}
N 50 -10 50 0 {lab=GND}
C {xschem/symbols/OR1/primitives/nfet.sym} 240 -30 0 0 {name=M1 
model=nchor1ex
W=10u
L=5u
m=10}
C {devices/gnd.sym} 260 10 0 0 {name=l1 lab=GND}
C {devices/code.sym} 50 -280 0 0 {name=PTC06_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include $::LIB/mos.lib
.include $::LIB/passive.lib
.include $::LIB/diode.lib"
spice_ignore=false}
C {devices/code_shown.sym} 380 -240 0 0 {name=spice
simulator=ngspice
only_toplevel=false
value="
.option savecurrent
.control
save all

* DC analysis (I/O curve)
dc V2 0 6.0 0.01
plot Vd Vg
plot i(Vmeas)
write nmos_tb.raw
.endc"}
C {devices/ammeter.sym} 260 -110 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {devices/vsource.sym} 110 -40 0 0 {name=V1 value=5 savecurrent=false}
C {devices/vsource.sym} 50 -40 0 0 {name=V2 value=5 savecurrent=false}
C {devices/vdd.sym} 260 -150 0 0 {name=l2 lab=VDD}
C {devices/gnd.sym} 110 0 0 0 {name=l3 lab=GND}
C {devices/gnd.sym} 50 0 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} 110 -80 0 0 {name=p1 sig_type=std_logic lab=Vg}
C {devices/lab_pin.sym} 40 -80 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 200 -30 0 0 {name=p3 sig_type=std_logic lab=Vg}
C {devices/lab_pin.sym} 260 -70 0 0 {name=p4 sig_type=std_logic lab=Vd}
