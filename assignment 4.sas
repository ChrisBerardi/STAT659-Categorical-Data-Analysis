*Assignment 4;
*4.1;
data cancer; 
input LI cases remissions @@;
datalines;
8 2 0 10 2 0 12 3 0 14 3 0 16 3 0
18 1 1 20 3 2 22 2 1 24 1 0 26 1 1
28 1 1 32 1 0 34 1 1 38 3 2
;

*4.2;
title'4.2';
proc logistic data=cancer desc;
model remissions/cases=LI;
run;

*4.5;
title'4.5';
data space;
input num temp TD @@;
datalines;
1 66 0 2 70 1 3 69 0 4 68 0 5 67 0
6 72 0 7 73 0 8 70 0 9 57 1 10 63 1
11 70 1 12 78 0 13 67 0 14 53 1 15 67 0
16 75 0 17 70 0 18 81 0 19 76 0 20 79 0 21 75 1
22 76 0 23 58 1
;

proc logistic data=space desc;
model TD=temp;
run;

*4.7;
title'4.7';
data spine;
input age kyphosis @@;
datalines;
12 1 15 1 42 1 52 1 59 1
73 1 82 1 91 1 96 1 105 1 114 1
120 1 121 1 128 1 130 1 139 1 139 1 157 1
1 0 1 0 2 0 8 0 11 0 18 0 22 0 31 0 37 0 
61 0 72 0 81 0 97 0 112 0 118 0 127 0 131 0
140 0 151 0 159 0 177 0 206 0
;

proc logistic data=spine desc;
model kyphosis = age;
run;
proc gplot data=spine;
symbol1 i=none color=red value=plus;
legend1 label=none
	value=("Age" "Kyphosis Present")
	position=(top center inside)
	mode=share;

plot age*kyphosis/overlay legend=legend1;
title 'Scatter Plot of Age and Kyphosis';
run;

ods graphics on;
proc logistic data=spine desc plots=all;
model kyphosis = age age*age;
run;
ods graphics off;

*4.8;
title'4.8';
data crab;
input color spine width satell weight;
if satell>0 then y=1; if satell=0 then y=0; n=1;
weight = weight/1000; color = color - 1; format color;

/* We create dummy variables here.  This is not needed if we use a class
statement.   */
LtMed=(color=1); Med=(color=2); DkMed=(color=3); dark=(color=4);
int1=LtMed*width; int2=Med*width; int3=Dkmed*width;  int4=dark*width;
cards;
3  3  28.3  8  3050
4  3  22.5  0  1550
2  1  26.0  9  2300
4  3  24.8  0  2100
4  3  26.0  4  2600
3  3  23.8  0  2100
2  1  26.5  0  2350
4  2  24.7  0  1900
3  1  23.7  0  1950
4  3  25.6  0  2150
4  3  24.3  0  2150
3  3  25.8  0  2650
3  3  28.2  11 3050
5  2  21.0  0  1850
3  1  26.0  14 2300
2  1  27.1  8  2950
3  3  25.2  1  2000
3  3  29.0  1  3000
5  3  24.7  0  2200
3  3  27.4  5  2700
3  2  23.2  4  1950
2  2  25.0  3  2300
3  1  22.5  1  1600
4  3  26.7  2  2600
5  3  25.8  3  2000
5  3  26.2  0  1300
3  3  28.7  3  3150
3  1  26.8  5  2700
5  3  27.5  0  2600
3  3  24.9  0  2100
2  1  29.3  4  3200
2  3  25.8  0  2600
3  2  25.7  0  2000
3  1  25.7  8  2000
3  1  26.7  5  2700
5  3  23.7  0  1850
3  3  26.8  0  2650
3  3  27.5  6  3150
5  3  23.4  0  1900
3  3  27.9  6  2800
4  3  27.5  3  3100
2  1  26.1  5  2800
2  1  27.7  6  2500
3  1  30.0  5  3300
4  1  28.5  9  3250
4  3  28.9  4  2800
3  3  28.2  6  2600
3  3  25.0  4  2100
3  3  28.5  3  3000
3  1  30.3  3  3600
5  3  24.7  5  2100
3  3  27.7  5  2900
2  1  27.4  6  2700
3  3  22.9  4  1600
3  1  25.7  5  2000
3  3  28.3  15 3000
3  3  27.2  3  2700
4  3  26.2  3  2300
3  1  27.8  0  2750
5  3  25.5  0  2250
4  3  27.1  0  2550
4  3  24.5  5  2050
4  1  27.0  3  2450
3  3  26.0  5  2150
3  3  28.0  1  2800
3  3  30.0  8  3050
3  3  29.0  10 3200
3  3  26.2  0  2400
3  1  26.5  0  1300
3  3  26.2  3  2400
4  3  25.6  7  2800
4  3  23.0  1  1650
4  3  23.0  0  1800
3  3  25.4  6  2250
4  3  24.2  0  1900
3  2  22.9  0  1600
4  2  26.0  3  2200
3  3  25.4  4  2250
4  3  25.7  0  1200
3  3  25.1  5  2100
4  2  24.5  0  2250
5  3  27.5  0  2900
4  3  23.1  0  1650
4  1  25.9  4  2550
3  3  25.8  0  2300
5  3  27.0  3  2250
3  3  28.5  0  3050
5  1  25.5  0  2750
5  3  23.5  0  1900
3  2  24.0  0  1700
3  1  29.7  5  3850
3  1  26.8  0  2550
5  3  26.7  0  2450
3  1  28.7  0  3200
4  3  23.1  0  1550
3  1  29.0  1  2800
4  3  25.5  0  2250
4  3  26.5  1  1967
4  3  24.5  1  2200
4  3  28.5  1  3000
3  3  28.2  1  2867
3  3  24.5  1  1600
3  3  27.5  1  2550
3  2  24.7  4  2550
3  1  25.2  1  2000
4  3  27.3  1  2900
3  3  26.3  1  2400
3  3  29.0  1  3100
3  3  25.3  2  1900
3  3  26.5  4  2300
3  3  27.8  3  3250
3  3  27.0  6  2500
4  3  25.7  0  2100
3  3  25.0  2  2100
3  3  31.9  2  3325
5  3  23.7  0  1800
5  3  29.3  12 3225
4  3  22.0  0  1400
3  3  25.0  5  2400
4  3  27.0  6  2500
4  3  23.8  6  1800
2  1  30.2  2  3275
4  3  26.2  0  2225
3  3  24.2  2  1650
3  3  27.4  3  2900
3  2  25.4  0  2300
4  3  28.4  3  3200
5  3  22.5  4  1475
3  3  26.2  2  2025
3  1  24.9  6  2300
2  2  24.5  6  1950
3  3  25.1  0  1800
3  1  28.0  4  2900
5  3  25.8  10 2250
3  3  27.9  7  3050
3  3  24.9  0  2200
3  1  28.4  5  3100
4  3  27.2  5  2400
3  2  25.0  6  2250
3  3  27.5  6  2625
3  1  33.5  7  5200
3  3  30.5  3  3325
4  3  29.0  3  2925
3  1  24.3  0  2000
3  3  25.8  0  2400
5  3  25.0  8  2100
3  1  31.7  4  3725
3  3  29.5  4  3025
4  3  24.0  10 1900
3  3  30.0  9  3000
3  3  27.6  4  2850
3  3  26.2  0  2300
3  1  23.1  0  2000
3  1  22.9  0  1600
5  3  24.5  0  1900
3  3  24.7  4  1950
3  3  28.3  0  3200
3  3  23.9  2  1850
4  3  23.8  0  1800
4  2  29.8  4  3500
3  3  26.5  4  2350
3  3  26.0  3  2275
3  3  28.2  8  3050
5  3  25.7  0  2150
3  3  26.5  7  2750
3  3  25.8  0  2200
4  3  24.1  0  1800
4  3  26.2  2  2175
4  3  26.1  3  2750
4  3  29.0  4  3275
2  1  28.0  0  2625
5  3  27.0  0  2625
3  2  24.5  0  2000
;

proc logistic data=crab desc;
model y=weight;
run;

*4.9;
title'4.9a-b';
proc logistic data=crab desc;
class color (ref=last)/param=ref;
model y=color;
run;

title'4.9c-d';
proc logistic data=crab desc;
model y=color;
run;

*4.15;
*Race: 1 = Black;
data merit; input District $ Race $ merit nomerit @@; total=merit+nomerit;
datalines;
NC B 24 9 NC W 47 12
NE B 10 3 NE W 45 8
NW B 5 4 NW W 57 9
SE B 16 7 SE W 54 10
SW B 7 4 SW W 59 12
;

data meritfreq; input District $ Race $ Merit $ count @@;
datalines;
NC B Yes 24 NC B No 9 NC W Yes 47 NC W No 12
NE B Yes 10 NE B No 3 NE W Yes 45 NE W No 8
NW B Yes 5  NW B No 4 NW W Yes 57 NW W No 9
SE B Yes 16 SE B No 7 SE W Yes 54 SE W No 10
SW B Yes 7  SW B No 4 SW W Yes 59 SW W No 12
;

title'4.15a';
proc freq order=data data= meritfreq; weight count;
tables District*race*merit/ chisq cmh;
run;

title'4.15b/d';
proc logistic data=merit desc;
class Race (ref=first) district/param=ref;
model merit/total=race district;
run;

*4.16;
title'4.16';
data person; input ex $ sen $ thi $ jud $ yes no @@; total=yes+no;
datalines;
E S T J  10 67 E S T P 8 34 E S F J 5 101 E S F P 7 72 
E N T J 3 20  E N T P 2 16 E N F J 4 27  E N F P 15 65
I S T J 17 123 I S T P 3 49 I S F J 6 132 I S F P 4 102
I N T J 1 12 I N T P 5 30 I N F J 1 30 I N F P 6 73
;

proc logistic data=person desc;
class ex sen thi jud/ param=ref;
model yes/total = ex sen thi jud;
run;

*4.22;
title'4.22a,b';

proc logistic data=crab desc;
class color/ param=ref;
model y=color weight/ covb;
run;

title'4.22c';
proc logistic data=crab desc;
model y=color weight/ covb;
run;

*4.24;
title'4.24a,b';

data sore; input duration type y @@;
datalines;
45 0 0 15 0 0 40 0 1 83 1 1 90 1 1 25 1 1 35 0 1
65 0 1 95 0 1 35 0 1 75 0 1 45 1 1 50 1 0 75 1 1
30 0 0 25 0 1 20 1 0 60 1 1 70 1 1 30 0 1 60 0 1
61 0 0 65 0 1 15 1 0 20 1 0 45 0 1 15 1 0 25 0 1
15 1 0 30 0 1 40 0 1 15 1 0 135 1 1 20 1 0 40 1 0
;

proc logistic data=sore desc;
model y= duration type;
run;

title'4.24c,d';
proc logistic data=sore desc;
model y= duration type duration*type;
run;

*4.30;
title'4.30';
data ncaa; input race $ gender $ total grad @@;
datalines;
W F 796 498 W M 1625 878
B F 143 54  B M 660 197
;

proc logistic data=ncaa desc;
class race gender /param=ref;
model grad/total= race gender race*gender;
run;

proc logistic data=ncaa desc;
class race gender /param=ref;
model grad/total= race gender;
run;

*Problem 1;
title'Problem 1 with department one';
data admit; input dep gender $ admit noadmit @@; total=admit+noadmit;
datalines;
1 male 512 313 1 female 86 19
2 male 353 207 2 female 17  8
3 male 120 205 3 female 202 391
4 male 138 279 4 female 131 244
5 male 53  138 5 female 94  299
6 male 22  351 6 female 24  317
;

*Deviance test is equivalent to Breslow Day test;
proc logistic data=admit desc;
class dep gender / param=ref;
model admit/total= dep gender/ scale=none aggregate;
run;


data admit1; set admit; if dep ne 1;
run;


title'Problem 1 without department one';
proc logistic data=admit1 desc;
class dep gender / param=ref;
model admit/total= dep gender/ scale=none aggregate;
run;
