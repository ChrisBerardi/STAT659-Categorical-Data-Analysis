*Homework 7, Stat659 Summer, 2016;

*7.4;
title'7.4';
data AIDS; input gender $ inform $ health $ count @@;
datalines;
M S S 76 M S O 160 
M O S 6 M O O 25
F S S 114 F S O 181
F O S 11 F O O 48
;

proc genmod order=data data=AIDS;
class gender inform health/ ref=last;
model count = gender|inform|health @2/ link=log dist=poi type3 lrci;
run;

proc genmod order=data data=AIDS;
class gender inform health/ ref=last;
model count = gender inform health inform*health health*gender/ link=log dist=poi type3 lrci;
run;

*7.6;
title'7.6';
data personality;
input EI $ SN $ JP $ TF $ count;
cards;
E S J T 77 
E S J F 106
E S P T 42 
E S P F 79
E N J T 23
E N J F 31
E N P T 18 
E N P F 80
I S J T 140 
I S J F 138
I S P T 52
I S P F 106
I N J T 13
I N J F 31
I N P T 35
I N P F 79
;

title '7.6 Mutual Independence';
proc genmod order=data data=personality; 
class ei sn tf jp;
model count=ei sn tf jp /link=log dist=poi obsstat type3 lrci;
run;

title '7.6 homogeneous association model';
proc genmod order=data data=personality; 
class ei sn tf jp;
model count=ei|sn|tf|jp @2/link=log dist=poi obsstat type3 lrci;
run;


*7.9;
title'7.9';
data grads;
input dept gender $ c1 c2; drop c1-c2; D=dept; G=gender;
count=c1; admit="yes"; A=admit; output;
count=c2; admit="no"; A=admit; output;
cards;
1 female 89 19
1 male 512 313
2 male 353 207
2 female 17 8
3 male 120 205
3 female 202 391
4 male 138 279
4 female 131 244
5 male 53 138
5 female 94 299
6 male 22 351
6 female 24 317
;

proc genmod order=data data=grads;
class A G D;
model count= A|G|D @2 /link=log dist=poi type3 obstats;
run;

proc freq data=grads; 
weight count;
tables G*A / relrisk;
tables D*G*A / relrisk;
run;

data no1;
set grads;
if D ne 1;
run;

proc genmod order=data data=no1;
class G A D;
model count= G|A|D @2 /link=log dist=poi type3;
run;

proc logistic order=data data=no1; freq count;
class G/ param=ref ref=last order=data;
model A = G D/ scale=d aggregate=(G D);
run;

proc logistic order=data data=no1; freq count;
model A = D/ scale=d aggregate=(D);
run;

*7.10;
title'7.10';
data crash; input Belt $ Ejected $ Fatal $ count @@;
datalines;
Y Y N 1105 Y Y Y 14 Y N N 411111 Y N Y 483
N Y N 4624 N Y Y 497 N N N 157342 N N Y 1008
;

proc genmod order=data data=crash;
class Belt Ejected Fatal;
model count=Belt|Ejected|Fatal @2/ link=log dist=poi type3 lrci;
output out=pred p=pred;
run;

*Calculates dissimilarity;
proc sql;
	select sum(abs(count-pred))/(2*sum(count)) as dis
	from pred;
quit;

proc logistic order=data data=crash; freq count;
class Belt Ejected/ param=ref ref=last order=data;
model Fatal=Belt Ejected/lackfit;
run;

*7.14;
title'7.14';
data survey;
input political premarital religious birth count;
liberal=0; if political=1 then liberal=1;
cards;
1 1 1 1 99
1 1 1 2 15
1 1 2 1 73
1 1 2 2 25
1 2 1 1 8
1 2 1 2 4
1 2 2 1 24
1 2 2 2 22
2 1 1 1 73
2 1 1 2 20
2 1 2 1 87
2 1 2 2 37
2 2 1 1 20
2 2 1 2 13
2 2 2 1 50
2 2 2 2 60
3 1 1 1 51
3 1 1 2 19
3 1 2 1 51
3 1 2 2 36
3 2 1 1 6
3 2 1 2 12
3 2 2 1 33
3 2 2 2 88
;

proc genmod data=survey order=data; freq count;
class political premarital religious birth;
model count= political|premarital|religious|birth @2 political*premarital*birth political*religious*birth/ link=log dist=p type3;
output out=pred p=pred;
run;

*Calculates dissimilarity;
proc sql;
	select sum(abs(count-pred))/(2*sum(count)) as dis
	from pred;
quit;

proc genmod data=survey order=data; freq count;
class political premarital religious birth;
model count= political|premarital|religious|birth @2/ link=log dist=p type3;
output out=pred p=pred;
run;

*Calculates dissimilarity;
proc sql;
	select sum(abs(count-pred))/(2*sum(count)) as dis
	from pred;
quit;

proc genmod data=survey order=data; freq count;
class political religious birth;
model premarital= political|religious|birth @2/ link=log dist=p type3;
output out=pred p=pred;
run;

proc sql;
	select sum(abs(count-pred))/(2*sum(count)) as dis
	from pred;
quit;

*7.24;
title'7.24';
data BC;
input RA $ TBC $ count xRa yTBC; asso=xRa*yTBC;
cards;
1 1 49 1 1
1 2 49 1 2
1 3 19 1 3
1 4 9 1 4
2 1 31 2 1
2 2 27 2 2
2 3 11 2 3
2 4 11 2 4
3 1 46 3 1
3 2 55 3 2
3 3 25 3 3
3 4 8 3 4
4 1 34 4 1
4 2 37 4 2
4 3 19 4 3
4 4 7 4 4
5 1 21 5 1
5 2 22 5 2
5 3 14 5 3
5 4 16 5 4
6 1 26 6 1
6 2 36 6 2
6 3 16 6 3
6 4 16 6 4
7 1 8 7 1
7 2 16 7 2
7 3 15 7 3
7 4 11 7 4
8 1 32 8 1
8 2 65 8 2
8 3 57 8 3
8 4 61 8 4
9 1 4 9 1
9 2 17 9 2
9 3 16 9 3
9 4 20 9 4
;
run;

proc genmod data=BC order=data; freq count;
class RA TBC;
model count = RA TBC/ dist=p link=log type3 obstats;
run;

*linear by linear;
proc genmod data=BC order=data;
class RA TBC;
model count = RA TBC xRA*yTBC/ dist=p link=log type3 lrci;
run;

*L-L;
proc genmod data=BC order=data;
class RA TBC;
model count = RA TBC asso/ dist=p link=log type3 lrci;
run;

*Row effects;
proc genmod data=BC order=data;
class RA TBC;
model count = RA TBC xRa*TBC/ dist=p link=log type3 lrci;
run;

*Column effects;
proc genmod data=BC order=data;
class RA TBC;
model count = RA TBC Ra*yTBC/ dist=p link=log type3 lrci;
run;

*Question1 ;
title'Question 1';
data soft;
input gender $ country $ switch $ count @@; 
cards;
male American y 29 male American n 6 
male British  y 19 male British n 15 
female American y 7 female American n 23 
female British y 24 female British n 29 
;
*independence;
proc genmod data=soft order=data; freq count;
class gender country switch;
model count=gender country switch/link=log dist=p type3;
output out=pred p=pred;
run;

*Calculates dissimilarity;
proc sql;
	select sum(abs(count-pred))/(2*sum(count)) as dis
	from pred;
quit;

*all associations;
proc genmod data=soft order=data; freq count;
class gender country switch;
model count=gender|country|switch @2/link=log dist=p type3;
output out=pred p=pred;
run;

proc sql;
	select sum(abs(count-pred))/(2*sum(count)) as dis
	from pred;
quit;

*remove country switch;
proc genmod data=soft order=data; freq count;
class gender country switch;
model count=gender country switch gender*country switch*gender/link=log dist=p type3;
output out=pred p=pred;
run;

proc sql;
	select sum(abs(count-pred))/(2*sum(count)) as dis
	from pred;
quit;
