* STAT659 Summer 2016 Assignment 2;

*2.18;
title '2.18';
data happy; input income $ happy $ count @@;
datalines;
above not 21   above pretty 159   above very 110
average not 53 average pretty 372 average very 221
below not 94   below pretty 249   below very 83
;

proc freq order=data data=happy;
	weight count;
	tables happy*income/ plots=mosaicplot;
	exact pcorr;
run;

*2.19;
title '2.19';
data party; input race $ party $ count @@;
datalines;
white demo 871 white indep 444 white repub 873
black demo 302 black indep 80 black repub 43
;

proc freq order=data data=party;
	weight count;
	tables race*party/ chisq crosslist(stdres);
run;
*to partition chisq need to make new data set;
title'first two columns';
data party2; set party; if party ne 'repub';
proc freq order=data data=party2; 
	weight count;
	tables race*party/ chisq;
run;

data party3; set party; if party ne 'repub' then party='indep';
title'first two combined with third';
proc freq order=data data=party3; 
	weight count;
	tables race*party/ chisq;
run;

*2.22;
title '2.22';
data diag; input diag $ drug $ count @@;
datalines;
schizo yes 105 schizo no 8
affect yes 12  affect no 2
neuro  yes 18  neuro  no 19 
person yes 47  person no 52
spec   yes 0   spec   no  13
;

proc freq order=data data=diag;
	weight count;
	tables diag*drug/ fisher crosslist(stdres) chisq;
run;

data diag2; set diag; if diag= 'affect' or diag = 'schizo';
title 'Schizophrenia and Affective compared';
proc freq order=data data=diag2;
	weight count;
	tables diag*drug/ chisq;
run;

data diag3; set diag; if diag= 'neuro' or diag = 'person';
title 'Neurosis and Personality compared';
proc freq order=data data=diag3;
	weight count;
	tables diag*drug/ chisq;
run;

data diag4; set diag; 
	if diag = 'schizo' then diag = 'affect'; 
	else if diag = 'person' then diag='neuro'; 

proc freq order=data data=diag4;
	weight count;
	tables diag*drug/ chisq;
run;

*2.27;
title '2.27';
data students; input income $ aspir $ count @@;
datalines;
low    somehs 9  low hsgrad 44    low somecol 13    low colgrad 10
middle somehs 11 middle hsgrad 52 middle somecol 23 middle colgrad 22
high   somehs 9  high hsgrad 41   high somecol 12   high colgrad 27
;

proc freq order=data data=students;
	weight count;
	tables income*aspir/ fisher chisq crosslist(stdres) plots=mosaicplot;
	exact pcorr;
run;

proc freq order=data data=students;
	weight count;
	tables aspir*income/ plots=mosaicplot;
run;

*2.29;
title'2.29';
data pred; input control $ normalize $ count @@;
datalines;
no  yes 7 no no 8
yes yes 0 yes no 15
;

proc freq order=data data=pred;
	weight count;
	tables control*normalize/ exact;
run;

*2.30/31;
title '2.30/31';
data cancer; input treatment $ controlled $ count @@;
datalines;
surgery   yes 21 surgery   no 2
radiation yes 15 radiation no 3
;

proc freq order=data data=cancer;
	weight count;
	tables treatment*controlled;
	exact chisq or/ point;
run;

proc freq order=data data=cancer;
	weight count;
	tables treatment*controlled;
	exact chisq or/ midp;
run;

*Additional Problem;
title'Additional Problem';
data admit; input dep $ gender $ admit $ count @@;
datalines;
1 male yes 512 1 male no 313 1 female yes 86  1 female no 19
2 male yes 353 2 male no 207 2 female yes 17  2 female no 8
3 male yes 120 3 male no 205 3 female yes 202 3 female no 391
4 male yes 138 4 male no 279 4 female yes 131 4 female no 244
5 male yes 53  5 male no 138 5 female yes 94  5 female no 299
6 male yes 22  6 male no 351 6 female yes 24  6 female no 317
;

proc freq order=data data=admit;
	weight  count;
	tables dep*gender*admit / cmh relrisk;
run;

data admit2; set admit; if dep ne 1;
proc freq order=data data=admit2;
	weight count;
	tables dep*gender*admit/ cmh relrisk alpha=.1;
run;
