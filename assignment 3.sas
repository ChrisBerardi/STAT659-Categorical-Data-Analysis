*STAT659 Assignment 3 Summer 2016;

*3.4;
*a.;
title'3.4a';
data infants;
input alcohol malform normal @@; total=malform+normal;
cards;

0 48 17066 0.5 38 14464 1.5 5 788 4 1 126 7 1 37
;
proc genmod data=infants;
model malform/total = alcohol / dist=bin link=identity;
run;

data infants7;
input alcohol malform normal @@; total=malform+normal;
cards;

0 48 17066 0.5 38 14464 1.5 5 788 4 1 126 7 0 37
;

proc genmod data=infants7;
	model malform/total=alcohol / dist=bin link=identity;
run;

*b;
title'3.4b';
data infantsscore;
input alcohol malform normal @@; total=malform+normal;
cards;

0 48 17066 1 38 14464 2 5 788 3 1 126 4 1 37
;

proc genmod data=infantsscore;
	model malform/total=alcohol / dist=bin link=identity;
run;

*c;
title'3.4c';
proc genmod data=infants;
	model malform/total=alcohol / dist=bin link=logit;
run;


*3.5;
*i.;
title '3.5i';
data snore;
input snoring disease total;
prop=disease/total;
cards;
0 24 1379 
2 35 638 
4 21 213 
6 30 254
;    

proc genmod data=snore; 
 model disease/total = snoring / dist=bin link=identity ; 
run;

*ii.;
title '3.5ii';
data snore;
input snoring disease total;
prop=disease/total;
cards;
0 24 1379 
1 35 638 
2 21 213 
3 30 254
;    

proc genmod data=snore; 
 model disease/total = snoring / dist=bin link=identity ; 
run;

*iii.;
title '3.5iii';
data snore;
input snoring disease total;
prop=disease/total;
cards;
1 24 1379 
2 35 638 
3 21 213 
4 30 254
;    

proc genmod data=snore; 
 model disease/total = snoring / dist=bin link=identity ; 
run;

*3.11;
title'3.11';
data wafer; input treat imper @@;
datalines;
0 8 0 7 0 6 0 6 0 3 0 4 0 7 0 2 0 3 0 4
1 9 1 9 1 8 1 14 1 8 1 13 1 11 1 5 1 7 1 6
run;

proc genmod data=wafer;
	model imper=treat/ dist=p link=log;
run;


*3.12;
title'3.12';
data wafer; input treat thick imper @@;
datalines;
0 0 8 0 0 7 0 0 6 0 0 6 0 0 3 0 1 4 0 1 7 0 1 2 0 1 3 0 1 4
1 0 9 1 0 9 1 0 8 1 0 14 1 0 8 1 1 13 1 1 11 1 1 5 1 1 7 1 1 6
run;

proc genmod data=wafer;
	model imper=treat thick/ dist=p link=log;
run;


*3.13;
title'3.13';
data crab;
input color spine width satell weight; weight=weight/1000;
datalines;
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
proc genmod data=crab;
	model satell= weight/ dist=p link=log;
run;

*3.14;
title'3.14';
proc genmod data=crab;
	model satell=weight /dist=negbin link=log;
run;

*3.18;
title'3.18';
data soccer; input team $ attend arrest; logattend=log(attend);
datalines;
ASVI 404 308
BRCI 286 197
LEUN 443 184
BOUR 169 149
WEBR 222 132
HUDD 150 126
MIDD 321 110
BIRM 189 101
IPTO 258 99
LECI 223 81
BLAC 221 79
CRPL 215 78
SHRE 108 68
SWTO 210 67
SHUT 224 60
STCI 221 57
BARN 168 55
MILL 185 44
HUCI 158 38
MACI 429 35
PLYM 226 29
READ 150 20
OLDH 148 19
run;

data soccer2;  set soccer; log=arrest/attend;
run;

title'3.18b';
proc genmod data=soccer;
	model arrest= attend/ noint dist=p link=identity residuals;
	output out=out0 predicted=pre0 stdreschi=resid0;
run;

proc gplot data= out0;
symbol1 i=none color=red value=plus;
symbol2 i=sm50 color=black value=none;
legend1  label=none
        value=("attendance" "Poisson identity link" )
        position=(top center inside)
        mode=share;

plot arrest*attend pre0*attend /overlay legend=legend1;
title 'Plot of Number of Arrests as a Function of Attendance';
run;

title'3.18c';
proc gplot data=out0;
	symbol1 i=none color=red value=plus;
	plot resid0*team;
	title'Plot of Standardized Pearson Residuals for Arrests';
run;


title'3.18d';
proc genmod data=soccer2;
	model log= /dist=negbin link=log residuals;
	output out=out1 predicted=pre1 stdreschi=resid1;
run;

data out1;
merge out0 out1;
run;

proc gplot data= out1;
symbol1 i=none color=red value=plus;
symbol2 i=sm50 color=black value=none;
symbol3 i=sm50 color=blue value=none;
legend1  label=none
        value=("attendance" "Poisson Indentity Link" "Negative Binomial identity link" )
        position=(top center inside)
        mode=share;

plot arrest*attend pre0*attend pre1*attend /overlay legend=legend1;
title 'Plot of Number of Arrests as a Function of Attendance';
run;

proc gplot data=out1;
	symbol1 i=none color=red value=plus;
	symbol2 i=none color=blue value=plus;
	legend1  label=none
        value=("Poisson Regression" "Negative Binomial Regression" )
        position=(top center inside)
        mode=share;
	plot resid0*team resid1*team / overlay legend=legend1;
	title'Plot of Standardized Pearson Residuals for Arrests';
run;

*3.20;
title'3.20';
data smoking;
input agegroup $ smoke $ total cases; logtotal=log(total); deathrate=cases*1000/total;
if smoke='yes' then smokenum=1; if smoke='no' then smokenum=0;
datalines;
35-44 no 18793 2
35-44 yes 52407 32
45-54 no 10673 12
45-54 yes 43248 104
55-64 no 5710 28
55-64 yes 28612 206
65-74 no 2585 28
65-74 yes 12663 186
75-84 no 1462 31
75-84 yes 5317 102 
;

data smoking; set smoking;
	if agegroup = '35-44' then age=40;
	else if agegroup = '45-54' then age=50;
	else if agegroup = '55-64' then age=60;
	else if agegroup = '65-74' then age=70;
	else if agegroup = '75-84' then age=80;
run;
*3.20a;
proc print data=smoking;
run;

*3.20d;
proc genmod data=smoking;
	class agegroup;
	model deathrate= smokenum agegroup/dist=p link=log;
run;

proc genmod data=smoking;
	class agegroup;
	model deathrate=smokenum agegroup smokenum*age/dist=p link=log;
run;

*Problem 1;
title 'Summary Measures for Poisson Regression for the Crab Data';

%genmodsummary(data=crab, class=color spine, yvariable=satell,
 model1=,
 model2=color,
 model3=spine,
 model4=width,
 model5=weight,
 model6=color spine,
 model7=color width,
 model8=color weight,
 model9=spine width,
 model10=spine weight,
 model11=width weight,
 model12=color spine width,
 model13=color spine weight,
 model14=color width weight,
 model15=spine width weight,
 model16=color spine width weight,
 distribution=p, link=log, number_of_models=16);

     run;


title'Problem 2c';
proc genmod data=crab; 
	ods select modelfit;
	model satell=weight/ dist=zip link=log;
	zeromodel weight;
run;

title'Problem 2d';
proc genmod data=crab; 
	ods select modelfit;
	model satell= weight/ dist=zip link=log;
	zeromodel;
run;

title'Problem 2e';
proc genmod data=crab; 
	ods select modelfit;
	model satell= weight/ dist=zinb link=log;
	zeromodel weight;
run;

title'Problem 2f';
proc genmod data=crab; 
	ods select modelfit;
	model satell= weight/ dist=zinb link=log;
	zeromodel;
run;
