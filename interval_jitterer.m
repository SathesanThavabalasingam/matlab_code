a=500
b=1000
c=1500
d=2000

vrn=8.9443

a_rnd=vrn.*randn(100,1)+a
b_rnd=vrn.*randn(100,1)+b
c_rnd=vrn.*randn(100,1)+c
d_rnd=vrn.*randn(100,1)+d

stats=[mean(a_rnd) std(a_rnd) var(a_rnd)]

pos=3
intervals=[a_rnd(pos) b_rnd(pos) c_rnd(pos) d_rnd(pos)]
