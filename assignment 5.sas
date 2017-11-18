*Assignment 5 Stat659 Summer 2016;

*5.1;
title'5.1';
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
model y= weight width;
run;

*5.10;
title'5.10';
ods graphics on;
proc logistic data=crab desc plots(only)=(roc(id=obs) effect);
model y= weight/ ctable pprob=.642 lackfit;
run;
ods graphics off;

proc logistic data=crab desc;
model y= weight weight;
run;

proc logistic data=crab desc;
model y= weight weight*weight;
run;

*5.14;
data ungroup; 
input trial y x @@;
datalines;
1 0 0 2 0 0 3 0 4 0 1 0
5 0 1 6 0 1 7 1 1 8 1 1
9 1 2 10 1 2 11 1 2 12 1 2
;

data group; 
input y x n@@;
datalines;
1 0 4
2 1 4
4 2 4
;

*ungrouped;
title'5.14 ungrouped data M0';
proc logistic data=ungroup desc;
model y= / aggregate=(trial) scale=none;
run;

title'5.14 ungrouped data M1';
proc logistic data=ungroup desc;
model y= x /scale=none aggregate=(trial);
run;


*grouped;
title'5.14 grouped data M0';
proc logistic data=group desc;
model y/n= / scale=none ;
run;

title'5.14 grouped data M1';
proc logistic data=group desc;
model y/n=x /scale=none;
run;

*5.16;
title'5.16';
data ncaa; input race $ gender $ total grad @@;
datalines;
W F 796 498 W M 1625 878
B F 143 54  B M 660 197
;

ods graphics on;
proc logistic data=ncaa desc plots=effect;
class race gender /param=ref;
model grad/total= race gender/lackfit scale=none aggregate=(race gender) influence covb;
run;
ods graphics off;

*5.18;
title'5.18';
data china;
input city $ smoke $ yes no; total=yes+no;
datalines;
Bei yes 126 100
Bei no 35 61
Shang yes 908 688
Shang no 497 807
Shen yes 913 747
Shen no 336 598
Nanj yes 235 172
Nanj no 58 121
Har yes 402 308
Har no 121 215
Zhen yes 182 156
Zhen no 72 98
Tai yes 60 99
Tai no 11 43
Nanc yes 104 89
Nanc no 21 36
;

proc logistic data=china desc;
class city smoke/ param=ref;
model yes/total = city smoke/ lackfit scale=none aggregate=(city smoke) influence;
run;

*5.19;
title'5.19';
data admit; input dep gender $ admit noadmit @@; total=admit+noadmit;
datalines;
1 male 512 313 1 female 86 19
2 male 353 207 2 female 17  8
3 male 120 205 3 female 202 391
4 male 138 279 4 female 131 244
5 male 53  138 5 female 94  299
6 male 22  351 6 female 24  317
;

data admitind;
set admit;
do i=1 to admit;
	ind = 1;
	output ;
end;
do j=1 to noadmit;
	ind = 0;
	output;
end;
drop i j;
run;

proc logistic data=admitind desc;
class dep/ param=ref;
model ind = dep/ scale=none aggregate=(gender dep);
run;

*5.21;
title'5.21';
data infants;
input alcohol malform normal @@; total=malform+normal;
cards;
0 48 17066 0.5 38 14464 1.5 5 788 4 1 126 7 1 37
;

proc logistic data=infants desc;
model malform/total=alcohol;
exact alcohol;
run;

*5.22;
title'5.22';
data crazy; input y x @@;
datalines;
0 10 0 20 0 30 0 40
1 60 1 70 1 80 1 90
;

proc logistic data=crazy desc;
model y= x;
run;

data crazy2; input y x @@;
datalines;
0 10 0 20 0 30 0 40 0 50
1 60 1 70 1 80 1 90 1 50
;

proc logistic data=crazy2 desc;
model y= x;
run;

data crazy3; input y x @@;
datalines;
0 10 0 20 0 30 0 40 0 50.1
1 60 1 70 1 80 1 90 1 49.9
;

proc logistic data=crazy3 desc;
model y= x;
run;


