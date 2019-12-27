***
// code to create the population weight prior to stacking the data
//    it calls a program to load the control margins, which are uniquely
//    set for every round (season)
//    it is called by the "reform vars.do" program
***
*use "D:\All My Documents\Projects\HOBM\Compass 2.1\Analysis\Prep & Build\Spring\clipped clean Compass 2.1.dta", clear
*CPS demos in "demos from MMM YYYY CPS.txt"

include "marg_pop.do"

gen female = 10 * (gender==2)
gen     wgt = 1
gen weekday2 = weekday + female
label val weekday2 WEEKDAY
gen division2 = division + female
gen agegrp2 = agegrp + female
*gen numkids2 = ownkids + female

* New in 2018 *
gen numkids2 = kids2 + female

gen race2 = race + female
gen hisp2 = hisp + female
gen educ2 = educ + female
gen income2 = income + female

preserve
keep if age>17
survwgt rake wgt, by(gender weekday2 agegrp2 race2 division2 hisp2 educ2 numkids2 income2) totvar(marg_sex marg_day marg_age marg_race marg_div marg_hisp marg_educ marg_kids marg_inc) generate(popwgt)
move popwgt time_entered
vlabel popwgt "Post stratification population (frequency) weight, raked over gender-specific day of week, age, race, Hispanic, division, education, income and number of children"
sort respondent_id
keep respondent_id popwgt
save "`yyyy' `sesn' Compass popwgt.dta", replace
restore

sort respondent_id
merge 1:1 respondent_id using "`yyyy' `sesn' Compass popwgt.dta"
drop _merge
svyset [pw=popwgt]

* ID Parents with children 13-17
* Original 2016
*gen ownkids1317 = inlist(2003, dkids01_1_dkids01_yob, dkids01_2_dkids01_yob, dkids01_3_dkids01_yob, dkids01_4_dkids01_yob, dkids01_5_dkids01_yob, dkids01_6_dkids01_yob, dkids01_7_dkids01_yob, dkids01_8_dkids01_yob, dkids01_9_dkids01_yob, dkids01_10_dkids01_yob, dkids01_11_dkids01_yob, dkids01_12_dkids01_yob)
*replace ownkids1317 = 1 if inlist(2002, dkids01_1_dkids01_yob, dkids01_2_dkids01_yob, dkids01_3_dkids01_yob, dkids01_4_dkids01_yob, dkids01_5_dkids01_yob, dkids01_6_dkids01_yob, dkids01_7_dkids01_yob, dkids01_8_dkids01_yob, dkids01_9_dkids01_yob, dkids01_10_dkids01_yob, dkids01_11_dkids01_yob, dkids01_12_dkids01_yob)
*replace ownkids1317 = 1 if inlist(2001, dkids01_1_dkids01_yob, dkids01_2_dkids01_yob, dkids01_3_dkids01_yob, dkids01_4_dkids01_yob, dkids01_5_dkids01_yob, dkids01_6_dkids01_yob, dkids01_7_dkids01_yob, dkids01_8_dkids01_yob, dkids01_9_dkids01_yob, dkids01_10_dkids01_yob, dkids01_11_dkids01_yob, dkids01_12_dkids01_yob)
*replace ownkids1317 = 1 if inlist(2000, dkids01_1_dkids01_yob, dkids01_2_dkids01_yob, dkids01_3_dkids01_yob, dkids01_4_dkids01_yob, dkids01_5_dkids01_yob, dkids01_6_dkids01_yob, dkids01_7_dkids01_yob, dkids01_8_dkids01_yob, dkids01_9_dkids01_yob, dkids01_10_dkids01_yob, dkids01_11_dkids01_yob, dkids01_12_dkids01_yob)
*replace ownkids1317 = 1 if inlist(1999, dkids01_1_dkids01_yob, dkids01_2_dkids01_yob, dkids01_3_dkids01_yob, dkids01_4_dkids01_yob, dkids01_5_dkids01_yob, dkids01_6_dkids01_yob, dkids01_7_dkids01_yob, dkids01_8_dkids01_yob, dkids01_9_dkids01_yob, dkids01_10_dkids01_yob, dkids01_11_dkids01_yob, dkids01_12_dkids01_yob)
*replace ownkids1317 = 1 if inlist(1998, dkids01_1_dkids01_yob, dkids01_2_dkids01_yob, dkids01_3_dkids01_yob, dkids01_4_dkids01_yob, dkids01_5_dkids01_yob, dkids01_6_dkids01_yob, dkids01_7_dkids01_yob, dkids01_8_dkids01_yob, dkids01_9_dkids01_yob, dkids01_10_dkids01_yob, dkids01_11_dkids01_yob, dkids01_12_dkids01_yob)

* 12/09/18 Update 1 year older (Summer/Fall did not use variables dkids* so use sd3a/b instead)
*gen ownkids1317 = inlist(2005, dkids01_1_dkids01_yob, dkids01_2_dkids01_yob, dkids01_3_dkids01_yob, dkids01_4_dkids01_yob, dkids01_5_dkids01_yob, dkids01_6_dkids01_yob, dkids01_7_dkids01_yob, dkids01_8_dkids01_yob, dkids01_9_dkids01_yob, dkids01_10_dkids01_yob, dkids01_11_dkids01_yob, dkids01_12_dkids01_yob)
*replace ownkids1317 = 1 if inlist(2004, dkids01_1_dkids01_yob, dkids01_2_dkids01_yob, dkids01_3_dkids01_yob, dkids01_4_dkids01_yob, dkids01_5_dkids01_yob, dkids01_6_dkids01_yob, dkids01_7_dkids01_yob, dkids01_8_dkids01_yob, dkids01_9_dkids01_yob, dkids01_10_dkids01_yob, dkids01_11_dkids01_yob, dkids01_12_dkids01_yob)
*replace ownkids1317 = 1 if inlist(2003, dkids01_1_dkids01_yob, dkids01_2_dkids01_yob, dkids01_3_dkids01_yob, dkids01_4_dkids01_yob, dkids01_5_dkids01_yob, dkids01_6_dkids01_yob, dkids01_7_dkids01_yob, dkids01_8_dkids01_yob, dkids01_9_dkids01_yob, dkids01_10_dkids01_yob, dkids01_11_dkids01_yob, dkids01_12_dkids01_yob)
*replace ownkids1317 = 1 if inlist(2002, dkids01_1_dkids01_yob, dkids01_2_dkids01_yob, dkids01_3_dkids01_yob, dkids01_4_dkids01_yob, dkids01_5_dkids01_yob, dkids01_6_dkids01_yob, dkids01_7_dkids01_yob, dkids01_8_dkids01_yob, dkids01_9_dkids01_yob, dkids01_10_dkids01_yob, dkids01_11_dkids01_yob, dkids01_12_dkids01_yob)
*replace ownkids1317 = 1 if inlist(2001, dkids01_1_dkids01_yob, dkids01_2_dkids01_yob, dkids01_3_dkids01_yob, dkids01_4_dkids01_yob, dkids01_5_dkids01_yob, dkids01_6_dkids01_yob, dkids01_7_dkids01_yob, dkids01_8_dkids01_yob, dkids01_9_dkids01_yob, dkids01_10_dkids01_yob, dkids01_11_dkids01_yob, dkids01_12_dkids01_yob)
gen ownkids1317 = (sd2c_4>0 & sd2c_4<.) | inlist(1, sd3a_14, sd3a_15, sd3a_16, sd3a_17, sd3a_18, sd3b_14, sd3b_15, sd3b_16, sd3b_17, sd3b_18)

* Education for children 13-17
clonevar educhs = educ
recode educhs (1 2=1) (3/5=2)
label define EDUCHS  1 "H.S. graduate or less" 2 "Some college or more"
label val educhs EDUCHS
t educ educhs

* Income for children 13-17
*clonevar income3 = ushhi2   // ushhi2 not used starting in SPRING 2017. Use ushhi3 instead
clonevar income3 = ushhi3
*recode income3 (1/7=1) (8/13=2) (14/max=3)
*label define INCOME3  1 "Less than $35,000" 2 "$35,000-$64,999" 3 "$65,000 or more"

* New in 2019 *
recode income3 (1/7=1) (8/20=2) (21/max=3)
label define INCOME3  1 "Less than $35,000" 2 "$35,000-$99,999" 3 "$100,000 or more"
label val income3 INCOME3
t ushhi3 income3

pcent   gender,                                                             inc(all)            nop out(demos from survey.txt) n("U N W E I G H T E D   D E M O S")
pcent   agegrp race hisp division educ income ownkids day weekday2 weekday, inc(all) by(gender) nop out(demos from survey.txt) app
svycent gender,                                                             inc(all)            nop out(demos from survey.txt) n("W E I G H T E D   D E M O S") app
svycent agegrp race hisp division educ income ownkids day weekday2 weekday, inc(all) by(gender) nop out(demos from survey.txt) app
svycent gender if ownkids1317,                                              inc(all)            nop out(demos from survey.txt) n("W E I G H T E D   D E M O S  P A R E N T S  O F  K I D S  1 3  -  1 7") app
svycent agegrp race hisp region educhs income3 kids2 ownkids day weekday2 weekday if ownkids1317, inc(all) by(gender) nop out(demos from survey.txt) app

`dexit' //set this to break after "demos from survey.txt" created


summ popwgt
*replace popwgt = round(popwgt/r(mean))  //so average weight is 1

drop marg_sex - income2 //get rid of all the weighting helper variables

* Recode TEEN entered data to true age and gender
forvalues i=13/17 {
   replace age = `i' if p2==`i'
}
t age p2

forvalues i=1/2 {
   replace gender = `i' if p3==`i'
}
tab gender p3

t age ownkids

*age (2019: Update maximum age to 73)
drop agegrp
recode age (13/17=0 "13 - 17") (18/24=1 "18 - 24") (25/34=2 "25 - 34") (35/44=3 "35 - 44") (45/54=4 "45 - 54") (55/64=5 "55 - 64") (65/`bo'=6 "65 - `bo'"), gen(agegrp) label(AGEGRP)
move agegrp gender
vlabel agegrp "Age"

include "marg_pop.do"

drop popwgt

gen female = 10 * (gender==2)
gen     wgt = 1
gen weekday2 = weekday + female
label val weekday2 WEEKDAY
gen division2 = division + female
gen agegrp2 = agegrp + female

* New in 2018 *
*gen numkids2 = ownkids + female
gen numkids2 = kids2 + female

gen race2 = race + female
gen hisp2 = hisp + female
gen educ2 = educ + female
gen income2 = income + female


preserve
keep if age>17

survwgt rake wgt, by(gender weekday2 agegrp2 race2 division2 hisp2 educ2 numkids2 income2) totvar(marg_sex marg_day marg_age marg_race marg_div marg_hisp marg_educ marg_kids marg_inc) generate(popwgt)
move popwgt time_entered
vlabel popwgt "Post stratification population (frequency) weight, raked over gender-specific day of week, age, race, Hispanic, division, education, income and number of children"
sort respondent_id
keep respondent_id popwgt
save "`yyyy' `sesn' Compass popwgt.dta", replace
restore

sort respondent_id
merge 1:1 respondent_id using "`yyyy' `sesn' Compass popwgt.dta"
drop _merge
svyset [pw=popwgt]

drop marg_sex - income2 //get rid of all the weighting helper variables

* 2016 hotdeck inpute 0 children in household to estimate number of children in household
local N = _N
summ kids2
if (kids2==0 & age<18) & r(min)==0 {
   replace kids2 = . if kids2==0 & age<18
   hotdeck kids2, store keep(userid kids2) seed(2394763) by(educ race agegrp income)
   merge 1:1 userid using imp1, update
   drop _merge
   erase imp1.dta
   summ kids2
   if r(N)<_N {
      hotdeck kids2, store keep(userid kids2) seed(9394763) by(qp08 race agegrp income)
      merge 1:1 userid using imp1, update
      drop _merge
      erase imp1.dta
   }
}

gen female = 10 * (gender==2)
gen     wgt = 1

recode weekday (0 6=0) (1/3=1) (4/5=2), g(weekday3)
vlabel weekday3 "Day of week"
label define WEEKDAY3 0 "SaSu" 1 "MTuW" 2 "ThF" 10 "SaSu" 11 "MTuW" 12 "ThF"
label val weekday3 WEEKDAY3

gen weekday2 = weekday3 + female
label val weekday2 WEEKDAY3
gen agegrp2 = age + female

* New in 2019 *
gen race2 = race + female
gen region2 = region + female
gen income2 = income3 + female

gen hisp2 = hisp + female

include "marg_pop_teen.do"

preserve
keep if age<18
*survwgt rake wgt, by(gender weekday2 agegrp2 race region hisp2 educhs kids2 income3) totvar(marg_sex marg_day marg_age marg_race marg_reg marg_hisp marg_educ marg_kids marg_inc) generate(popwgtkid)

* New in 2019 *
survwgt rake wgt, by(gender weekday2 agegrp2 race2 region2 hisp2 educhs kids2 income2) totvar(marg_sex marg_day marg_age marg_race marg_reg marg_hisp marg_educ marg_kids marg_inc) generate(popwgtkid)

move popwgtkid time_entered
vlabel popwgtkid "Post stratification population Kid 13-17 (frequency) weight, raked over gender-specific day of week, age, race, Hispanic, region, education, income and number of children"
sort respondent_id
keep respondent_id popwgtkid
save "`yyyy' `sesn' Compass popwgt teen.dta", replace
restore

sort respondent_id
merge 1:1 respondent_id using "`yyyy' `sesn' Compass popwgt teen.dta"
drop _merge
replace popwgt = popwgtkid if popwgt==.
svyset [pw=popwgt]

svycent gender agegrp race hisp division educ income ownkids weekday if agegrp>0, inc(all) by(gender) f
svycent gender agegrp age race hisp region educhs income3 kids2 ownkids weekday3 if agegrp==0, inc(all) by(gender) f

drop female - popwgtkid //get rid of all the weighting helper variables

move popwgt time_entered

