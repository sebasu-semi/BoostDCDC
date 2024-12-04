v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 330 -100 340 -100 {lab=GND}
N 270 -100 290 -100 {lab=Vg}
N 310 -200 370 -200 {lab=SW}
N 330 -200 330 -180 {lab=SW}
N 330 -40 330 -30 {lab=GND}
N 330 -150 330 -130 {lab=SW}
N 340 -100 340 -60 {lab=GND}
N 400 -250 400 -240 {lab=Vo}
N 400 -250 450 -250 {lab=Vo}
N 450 -250 450 -200 {lab=Vo}
N 400 -200 400 -190 {lab=SW}
N 340 -60 340 -40 {lab=GND}
N 330 -60 330 -40 {lab=GND}
N 330 -180 330 -150 {lab=SW}
N 360 -190 400 -190 {lab=SW}
N 360 -200 360 -190 {lab=SW}
N 430 -200 470 -200 {lab=Vo}
N 330 -70 330 -60 {lab=GND}
N 330 -40 340 -40 {lab=GND}
C {devices/opin.sym} 470 -200 0 0 {name=p1 lab=Vo}
C {devices/ipin.sym} 310 -200 0 0 {name=p2 lab=SW}
C {devices/ipin.sym} 270 -100 0 0 {name=p3 lab=Vg}
C {devices/iopin.sym} 330 -30 0 1 {name=p4 lab=GND}
C {primitives/pfet.sym} 400 -220 3 1 {name=M1 
model=pchor1ex
W=6.6u
L=2u
m=100
}
C {primitives/nfet.sym} 310 -100 0 0 {name=M2 
model=nchor1ex
W=4u
L=2u
m=100
}
