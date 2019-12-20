***
// code to put together the separate rounds (seasons) of data for one year
//   it rescales the weights to account for pop size vs. sample size across rounds
//   it also generates an SPSS friendly Stata file that's otherwise identical
//    it is called by the "append.do" program,
//    customized for a particular year of the Compass
***
cd "C:\Users\robert\Documents\Projects\HOBM\Compass 3.2\Prep & Build\\`yyyy'"


mylog "append.smcl", replace


* process each wave
use "Stacked and weighted `yyyy' Spring Compass.dta", clear

foreach season in `seasons' {
   append using "Stacked and weighted `yyyy' `season' Compass.dta", nolabel
}

* check to make sure the basic counts match expectations
t kidocc season, miss
* write out count of child and adult occasions for each season
pcent   piece occasion,             inc(all) by(season) out(Rescaling finwgt.txt) n(U N W E I G H T E D)
svycent piece occasion,             inc(all) by(season) out(Rescaling finwgt.txt) n(W E I G H T E D) app
pcent   piece        [pw=popwgt], inc(all) by(season) out(Rescaling finwgt.txt) n(P O P W E I G H T E D) app
`exit'


* reweight to allow reasonable pooling of waves
* adjust finwgt to make each round properly represent its pop size relative to the other two rounds
include "rescale wgts.do"
quietly {
   summ finwgt if adult
   replace finwgt = finwgt / r(mean) if adult

   summ finwgt if kidocc
   replace finwgt = finwgt / r(mean) if kidocc
}

bysort season: summ finwgt
bysort season kidocc: summ finwgt


compress
sort userid piece
save "..\stacked and weighted `yyyy' Compass.dta", replace
describe

*vname using "Compass `yyyy'.txt", cbook val

* how many adults are we counting?
t piece season if se1, miss

*
* create a file for export to SPSS
replace time_entered = (time_entered - tc(14oct1582 00:00)) / 1000
replace time_completed = (time_completed - tc(14oct1582 00:00)) / 1000
format time_entered time_completed %22.2g

saveold "to SPSS\stacked and weighted `yyyy' Compass.dta", replace
*saveold "to SPSS\stacked and weighted `yyyy' Compass.dta"
quietly vname using "to SPSS\vnames.txt"

* retrieve the non-export version, in case we want to do something
use "..\stacked and weighted `yyyy' Compass.dta", clear


log close

* Variable creation
* Can be applied after renaming
gen unique_userid = string(year, "%02.0f") + string(month, "%02.0f") + string(day, "%02.0f") + "_" + string(userid, "%10.0f")
vlabel unique_userid "YYYYMMDD-respondent serial #, is unique per individual"
order unique_userid, before(userid)

* Can be applied after stacking
gen unique_occid = unique_userid + "_" +  string(piece, "%01.0f")
vlabel unique_occid "YYYYMMDD-respondent serial #- occasion piece, is unique per occasion"
order unique_occid, after(unique_userid)

* Code up age cohort variable
* as of 2018: Gen Z 1998 - 2000 (18-20)  Millennials 1979 - 1997 (21-39)  Gen X 1965 and 1978 (40-53)  Boomers 1946 to 1964 (54-72)   http://tfccontent.com/download/millennials/quick-facts.html
capture label drop COHORT
recode age (13/20=0) (21/39=1) (40/53=2) (54/72=3), g(cohort)
vlabel cohort "Age cohort"
label define COHORT 0 "Gen Z 18-20" 1 "Millennials 21-39" 2 "Gen X 40-53" 3 "Boomers 54-72" 4 "Silent"
label val cohort COHORT
t age cohort

* hh size
recode qp09 (7/max=6), g(hhsize)
vlabel hhsize "Household size"
label define HHSIZE 1 "1, I live alone" 2 "2" 3 "3" 4 "4" 5 "5" 6 "6+"
label val hhsize HHSIZE
t qp09 hhsize

* race2
clonevar race2 = race
recode race2 (3=4)
recode race2 (4=3) if inlist(1, usrace2_4, usrace2_5, usrace2_6, usrace2_7, usrace2_8, usrace2_9, usrace2_10, usrace2_11, usrace2_12, usrace2_13) 
label copy RACE RACE2
label define RACE2 1 "Caucasian" 2 "African-American" 3 "Asian-American" 4 "Other", replace
label val race2 RACE2
pcent usrace2_*, by(race2)

*gen mindless = inlist(1, q02_2, q02_4, q02_10, q02_13) & inlist(1, qb2b_1, qb2b_2, qb2b_3, qb2b_4, qb2b_5, qb2b_6, qb2b_7, qb2b_8, qb2b_9) & snack
gen mindless = inlist(1, q02_4, q02_16) & snack
vlabel mindless "Mindless Snacking"
label val mindless YESNO

gen nour = inlist(1, q03a_14, q03a_8, q03a_9, q02_14, q02a_14)
vlabel nour "Nourishment"
label val nour YESNO

gen opti = inlist(1, q03a_7, q03a_13, q03a_16, q03a_17)
vlabel opti "Optimization"
label val opti YESNO

gen plea = inlist(1, q03a_3, q03a_4, q03a_5, q03a_10, q03a_15)
vlabel plea "Pleasure"
label val plea YESNO

* agegrp for trending from 2012
clonevar agegrpt = agegrp
label copy AGEGRP AGEGRPT
label define AGEGRPT 0 "13 - 17" 1 "18 - 24" 2 "25 - 34" 3 "35 - 44" 4 "45 - 54" 5 "55 - 64" 6 "65 - 70", replace
label val agegrpt AGEGRPT

save "..\stacked and weighted `yyyy' Compass.dta", replace
