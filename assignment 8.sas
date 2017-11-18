*Assignement 8 Stat 659 Summer 2016;

*8.2;
title'8.2';
data belief; input Heaven $ Hell $ count@@;
datalines;
Y Y 833 Y N 125 
N Y 2 N N 160
;
run;

proc freq data=belief; 
weight count;
tables Heaven*Hell / agree norow nocol;
run;

proc catmod data=belief; weight count;
response marginals;
model Heaven*Hell = (1 0, 1 1);
run;

*8.6;
title'8.6';
data AIDS; input inform $ health $ count @@;
datalines;
1 1 114 1 0 181
0 1 11 0 0 48
;

proc freq data=AIDS;
weight count;
tables inform*health / agree norow nocol;
run;

*8.10;
title'8.10';
data meat; input control $ cancer $ count;
datalines;
high high 3
low  low  1
high low  1
high low  3
;

proc freq data=meat;
weight count;
tables control*cancer / cmh;
exact chisq;
run;

data meat2; input control $ cancer $ count;
datalines;
high low  1
high low  3
;

proc freq data=meat2;
weight count;
tables control*cancer / cmh;
run;

*8.13;
title'8.13';
data relig; input pre post symm qi count @@;
datalines;
1 1 1 1 1128 1 2 2 5 39    1 3 3 5 2   1 4 4 5 158
2 1 2 5 100  2 2 5 2 649   2 3 6 5 1   2 4 7 5 107
3 1 3 5 1    3 2 6 5 0     3 3 8 3 54  3 4 9 5 9
4 1 4 5 73   4 2 7 5 12    4 3 9 5 4   4 4 10 4 137
;

proc genmod data=relig; class symm;
model count=symm / dist=p link=log obstats;
run;

proc genmod data=relig; class symm pre post;
model count = symm pre post/ dist=p link=log;
run;

*Part D;
data religion;
input then $ noot $ count m11 m12 m13 m21 m22 m23 m31 m32 m33 m44 m1 m2 m3;
datalines;
pr pr 1228 1   0 0  0  0  0  0  0  0 0 0 0 0 
pr ca  39 0   1 0  0  0  0  0  0  0 0 0 0 0 
pr  je 2 0   0 1  0  0  0  0  0  0 0 0 0 0 
pr  ot  158 -1 -1 -1 0  0  0  0  0  0 0 1 0 0 
ca pr  100 0   0 0  1  0  0  0  0  0 0 0 0 0 
ca ca 649 0   0 0  0  1  0  0  0  0 0 0 0 0 
ca  je 1 0   0 0  0  0  1  0  0  0 0 0 0 0 
ca  ot  107 0   0 0 -1 -1 -1  0  0  0 0 0 1 0 
je pr   1 0   0 0  0  0  0  1  0  0 0 0 0 0 
je ca  0 0   0 0  0  0  0  0  1  0 0 0 0 0
je  je 54 0   0 0  0  0  0  0  0  1 0 0 0 0 
je  ot  9 0   0 0  0  0  0 -1 -1 -1 0 0 0 1 
ot  pr   73 -1  0 0 -1  0  0 -1  0  0 0 1 0 0 
ot  ca   12 0  -1 0  0 -1  0  0 -1  0 0 0 1 0 
ot   je 4 0   0 -1 0  0 -1  0  0 -1 0 0 0 1 
ot   ot 137 0   0  0 0  0  0  0  0  0 1 0 0 0 
;
proc genmod data=religion;
model count = m11 m12 m13 m21 m22 m23 m31 m32 m33 m44 m1 m2 m3 /
dist=poi link=identity;
title 'Test of Marginal Homogeneity';
run;
proc catmod data=religion; weight count; response marginals;
model then*noot = _response_ / freq;
repeated time 2;
title 'Bhapkar Test of Marginal Homogeneity';
run;

*8.14;
title'8.14';
data residence; input pre post symm qi count @@;
datalines;
1 1 1 1 425  1 2 2 5 17   1 3 3 5 80   1 4 4 5 36
2 1 2 5 10   2 2 5 2 555  2 3 6 5 74   2 4 7 5 47
3 1 3 5 7    3 2 6 5 34   3 3 8 3 771  3 4 9 5 33
4 1 4 5 5    4 2 7 5 14   4 3 9 5 29   4 4 10 4 452
;

proc genmod data=residence; class symm;
model count=symm / dist=p link=log;
run;

proc genmod data=residence; class symm pre post;
model count = symm pre post/ dist=p link=log;
run;


*8.16;
title'8.16';
data hippie; input chem recy count symm qi @@;
datalines;
1 1 66 1 1   1 2 39 2 4   1 3 3 3 4
2 1 227 2 4  2 2 359 4 2  2 3 48 5 4
3 1 150 3 4  3 2 216 5 4  3 3 108 6 3
;

proc genmod data=hippie; class symm;
model count=symm / dist=p link=log;
run;

proc genmod data=hippie; class symm chem recy;
model count = symm chem recy/ dist=p link=log;
run;

proc genmod data=hippie; class symm;
model count = symm chem recy/ dist=p link=log;
run;

*8.17;
title'8.17';
data morehippies; input poll green count qi symm @@;
datalines;
1 1 95 1 1  1 2 72 5 2   1 3 32 5 3   1 4 8 5 4
2 1 66 5 2  2 2 129 2 5  2 3 116 5 6  2 4 13 5 7
3 1 31 5 3  3 2 101 5 6  3 3 233 3 8  3 4 82 5 9
4 1 5  5 4  4 2 4 5 7    4 3 24 5 9   4 4 26 4 10
;

proc genmod data=morehippies; class symm;
model count=symm / dist=p link=log;
run;

proc genmod data=morehippies; class symm poll green;
model count = symm poll green/ dist=p link=log;
run;

proc genmod data=morehippies; class symm;
model count = symm poll green/ dist=p link=log;
run;

*8.19;
title'8.19';
proc genmod data=residence;
class pre post;
model count= pre post / dist=p link=log;
run;

proc genmod data=residence;
class pre post qi;
model count= pre post qi / dist=p link=log;
run;

*8.20;
title'8.20';
data neuro; input NA NB count symm qi @@;
datalines;
1 1 38 1 1  1 2 5 2 5   1 3 0 3 5  1 4 1 4 5
2 1 33 2 5  2 2 11 5 2  2 3 3 6 5  2 4 0 7 5
3 1 10 3 5  3 2 14 6 5  3 3 5 8 3  3 4 6 9 5
4 1 3 4 5   4 2 7 7 5   4 3 3 9 5  4 4 10 10 4
;
run;

proc genmod data=neuro; class NA NB;
model count = NA NB/ dist=p link=log obstats;
run;

proc genmod data=neuro; class qi NA NB;
model count= qi NA NB /dist=p link=log obstats;
run;

proc genmod data=neuro; class symm;
model count= symm /dist=p link=log;
run;

proc genmod data=neuro; class symm NA NB;
model count= symm NA NB /dist=p link=log obstats;
run;

proc genmod data=neuro; class symm;
model count= symm NA NB /dist=p link=log;
run;

proc freq data=neuro; 
weight count;
tables NA*NB / agree norow nocol;
run;

*8.21;
title'8.21';
data coffee; input F $ S $ count qi @@;
datalines;
HP HP 93 1  HP T 17 6  HP S 44 6  HP N 7 6  HP B 10 6
T HP 9   6  T T 46  2  T S 11  6  T N 0  6  T B 9   6
S HP 17  6  S T 11  6  S S 155 3  S N 9  6  S B 12  6
N HP 6   6  N T 4   6  N S 9   6  N N 15 4  N B 2   6
B HP 10  6  B T 4   6  B S 12  6  B N 2  6  B B 27  5
;run;

proc genmod data=coffee;
class F S qi;
model count= F S qi/dist=p link=log;
run;

*8.22;
title'8.22';
data soda; input win n coke pepsi classic;
datalines;
29 49 1 -1 0
19 47 0 -1 1
31 50 1 0 -1
; run;

proc genmod data=soda;
model win/n= coke pepsi classic/ dist=bin link=logit noint;
run;

*8.23;
title'8.23';
data journal; input win n bio com jasa royal;
datalines;
730 766  1 -1  0  0
498 818  1  0 -1  0
221 505  1  0  0 -1
68  881  0  1 -1  0
17  293  0  1  0 -1
142 467  0  0  1 -1
; run;

proc genmod data=journal;
model win/n= bio com jasa royal / dist=bin link=logit noint;
run;
