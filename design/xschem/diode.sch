v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 260 -140 260 -130 {lab=#net1}
N 260 -210 260 -200 {lab=VDD}
N 260 -130 260 -120 {lab=#net1}
N 260 -40 260 -30 {lab=GND}
N 150 -70 150 -30 {
lab=GND}
N 150 -160 150 -130 {
lab=VDD}
N 300 -90 310 -90 {lab=GND}
N 310 -90 310 -40 {lab=GND}
N 260 -40 310 -40 {lab=GND}
N 260 -60 260 -30 {lab=GND}
N 250 -90 260 -90 {lab=#net1}
N 250 -130 250 -90 {lab=#net1}
N 250 -130 260 -130 {lab=#net1}
N 400 -40 400 -30 {lab=GND}
N 400 -210 400 -200 {lab=VDD}
N 400 -50 400 -40 {lab=GND}
N 400 -140 400 -130 {lab=#net2}
N 440 -80 450 -80 {lab=#net2}
N 400 -120 450 -120 {lab=#net2}
N 390 -80 400 -80 {lab=GND}
N 390 -80 390 -40 {lab=GND}
N 390 -40 400 -40 {lab=GND}
N 450 -120 450 -80 {lab=#net2}
N 400 -130 400 -110 {lab=#net2}
N 540 -40 540 -30 {lab=GND}
N 540 -210 540 -200 {lab=VDD}
N 540 -50 540 -40 {lab=GND}
N 540 -140 540 -130 {lab=#net3}
N 580 -80 590 -80 {lab=#net3}
N 540 -120 590 -120 {lab=#net3}
N 530 -80 540 -80 {lab=GND}
N 530 -80 530 -40 {lab=GND}
N 530 -40 540 -40 {lab=GND}
N 590 -120 590 -80 {lab=#net3}
N 540 -130 540 -110 {lab=#net3}
C {devices/ammeter.sym} 260 -170 0 0 {name=Vmeas savecurrent=true spice_ignore=0}
C {devices/vdd.sym} 260 -210 0 0 {name=l2 lab=VDD}
C {devices/gnd.sym} 260 -30 0 0 {name=l1 lab=GND}
C {devices/code_shown.sym} 190 -460 0 0 {name=spice
simulator=ngspice
only_toplevel=false
value="
.option savecurrent
.control
save all

* DC analysis (I/O curve)
dc Vdd 0 6 0.01
plot i(Vmeas)
plot i(Vmeas1)
plot i(Vmeas2)
write diode_tb.raw
.endc"}
C {devices/code.sym} 0 -260 0 0 {name=PTC06_MODELS
only_toplevel=true
format="tcleval( @value )"
value=".include $::LIB/mos.lib
.include $::LIB/passive.lib
.include $::LIB/diode.lib"
spice_ignore=false}
C {devices/vsource.sym} 150 -100 0 0 {name=Vdd value=5.0 savecurrent=false}
C {devices/vdd.sym} 150 -160 0 0 {name=l3}
C {devices/gnd.sym} 150 -30 0 0 {name=l4}
C {primitives/pfet.sym} 280 -90 0 1 {name=M2 
model=pchor1ex
W=2u
L=1u
m=50
}
C {devices/ammeter.sym} 400 -170 0 0 {name=Vmeas1 savecurrent=true spice_ignore=0}
C {devices/vdd.sym} 400 -210 0 0 {name=l5 lab=VDD}
C {devices/gnd.sym} 400 -30 0 0 {name=l6 lab=GND}
C {primitives/pfet.sym} 420 -80 2 0 {name=M1 
model=pchor1ex
W=3u
L=1u
m=100
}
C {devices/ammeter.sym} 540 -170 0 0 {name=Vmeas2 savecurrent=true spice_ignore=0}
C {devices/vdd.sym} 540 -210 0 0 {name=l7 lab=VDD}
C {devices/gnd.sym} 540 -30 0 0 {name=l8 lab=GND}
C {primitives/nfet.sym} 560 -80 0 1 {name=M3 
model=nchor1ex
W=2u
L=1u
m=30}
