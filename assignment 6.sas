*Assignment 6, Stat 659 Summer, 2016;

*6.3;
title'6.3';
data food;
input lake $ size $ choice $ count@@;
cards;
H S F 23 H S I 4 H S R 2 H S B 2 H S O 8
H L F 7 H L I 0 H L R 1 H L B 3 H L O 5
O S F 5 O S I 11 O S R 1 O S B 0 O S O 3
O L F 13 O L I 8 O L R 6 O L B 1 O L O 0
T S F 5 T S I 11 T S R 2 T S B 1 T S O 5
T L F 8 T L I 7 T L R 6 T L B 3 T L O 5
G S F 16 G S I 19 G S R 1 G S B 2 G S O 3
G L F 17 G L I 1 G L R 0 G L B 1 G L O 3
;

proc logistic data=food desc; freq count;
class size lake / param=ref ref=last order=data;
model choice(ref='O') = lake Size/ link=glogit;
run;

*6.8;
title'6.8';
data cancer; input therapy $ gender $ responce count @@;
datalines;
S M 1 28 S M 2 45 S M 3 29 S M 4 26
S F 1 4  S F 2 12 S F 3 5  S F 4 2
A M 1 41 A M 2 44 A M 3 20 A M 4 20
A F 1 12 A F 2 7  A F 3 3  A F 4 1
;

proc logistic data=cancer;  freq count;
class therapy gender / param=ref ref=last order=data;
model responce= therapy gender;
run;

proc logistic data=cancer; freq count;
class therapy gender / param=ref ref=last order=data;
model responce= therapy gender therapy*gender;
run;


*6.12;
title'6.12';
data religion; input freq happy count @@;
datalines;
1 1 189 1 2 908 1 3 382
2 1 53  2 2 311 2 3 180
3 1 46  3 2 335 3 3 294
;

proc genmod data=religion; freq count;
model happy = freq/ dist=multinomial link=clogit type3 lrci aggregate;
run;


proc logistic data=religion; freq count;
model happy = freq;
run;



*6.17;
title'6.17';
data accident; input gender $ location $ seatbelt $ severity count @@;
datalines;
F U N 1 7287  F U N 2 175 F U N 3 720 F U N 4 91  F U N 5 10
F U Y 1 11587 F U Y 2 126 F U Y 3 577 F U Y 4 48  F U Y 5  8
F R N 1 3246  F R N 2 73  F R N 3 710 F R N 4 159 F R N 5 31
F R Y 1 6134  F R Y 2 94  F R Y 3 564 F R Y 4 82  F R Y 5 17
M U N 1 10381 M U N 2 136 M U N 3 566 M U N 4 96  M U N 5 14
M U Y 1 10969 M U Y 2 83  M U Y 3 259 M U Y 4 37  M U Y 5  1
M R N 1 6123  M R N 2 141 M R N 3 710 M R N 4 188 M R N 5 45
M R Y 1 6693  M R Y 2 74  M R Y 3 353 M R Y 4 74  M R Y 5 12
;

*Sanity check to start/see if analysis agrees;
title'Column Frequencies';
proc freq order=data data=accident;
	weight count;
	tables severity*location / nofreq norow nopercent;
	tables severity*gender / nofreq norow nopercent;
	tables severity*seatbelt / nofreq norow nopercent;
	run;

title'main effects model';
proc logistic data=accident; freq count;
class gender location seatbelt /param=ref ref=last order=data;
model severity= location gender seatbelt;
run;

title'main effects model baseline';
proc logistic data=accident; freq count;
class gender location seatbelt /param=ref ref=last order=data;
model severity= location gender seatbelt / link=glogit;
run;

*try interactions;
proc logistic data=accident; freq count;
class gender location seatbelt /param=ref ref=last order=data;
model severity= location gender seatbelt location*gender / link=glogit;
run;

proc logistic data=accident; freq count;
class gender location seatbelt /param=ref ref=last order=data;
model severity= location gender seatbelt gender*seatbelt / link=glogit;
run;


title'location-seatbelt interaction';
proc logistic data=accident; freq count;
class gender location seatbelt /param=ref ref=last order=data;
model severity= location gender seatbelt location*seatbelt / link=glogit;
run;


*3-way interaction;
proc logistic data=accident; freq count;
class gender location seatbelt /param=ref ref=last order=data;
model severity= location gender seatbelt location*seatbelt*gender / link=glogit aggregate;
oddsratio gender; oddsratio location; oddsratio seatbelt;
run;
