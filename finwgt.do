***
// wrapper program to generate the final weight
//    it calls a program to load the control margins, which are uniquely
//    set for every round (season)
//    it is called at the end of the "build Compass.do" program
***
* get the marginals for raking
include "marg_fin.do"

* these are for the marginal distributions nested in parenthood
foreach var of varlist sd2 gender weekday agegrp2 occ2var {
clonevar `var'_a = `var' if occasion!=2
}

gen wgt = 1
gen weekday_a2 = weekday_a + 10*sd2_a
gen gender_a2 = gender_a + 10*sd2_a

* 010918 Create agegrp2 to for weighing purposes (bring down weight of Boomers)
gen agegrp2_a2 = agegrp2_a + 10*sd2_a

gen kid = occ2var * inlist(occ2var,5,10,15,20,25,30,35,40)
recode kid (0=.)
gen occ2var_a2 = occ2var_a + 100*sd2_a

* rake over the margins to create the parent specific final weights
* 010918 Add agegrp22 and marg_age for weighing purposes (bring down weight of Boomers)
*Working command 121918
*survwgt rake wgt,            by(sd2 weekday2 gender2 agegrp22 occ2var2) totvar(marg_par marg_day marg_sex marg_age marg_occ) generate(awgt)

survwgt rake wgt if adult==1, by(sd2_a weekday_a2 gender_a2 agegrp2_a2 occ2var_a2) totvar(marg_par marg_day marg_sex marg_age marg_occ) generate(awgt)

pcent sd2 gender agegrp2 occ2var if occasion!=2 [pw=awgt], inc(all) by(sd2)
pcent occ2var [pw=awgt], inc(all) out(testwgt.txt)


* KID Occasions
*Working command 121918
*survwgt rake wgt if  kidocc, by(weekday2 gender2)      totvar(marg_day marg_sex) generate(kwgt)
replace weekday_a2 = . if occasion!=1
replace gender_a2 = . if occasion!=1
replace marg_day = . if occasion!=1
replace marg_sex = . if occasion!=1

survwgt rake wgt if occasion==1, by(weekday_a2 gender_a2 kid)      totvar(marg_day marg_sex marg_kid) generate(kwgt)
pcent occ2var [pw=kwgt], inc(all) out(testwgt.txt) app


* rake over the margins to create the TEEN specific final weights
drop marg_par - occ2var_a weekday_a2 - occ2var_a2


* Teen Weights New in 011819
foreach var of varlist gender weekday age {
clonevar `var't = `var' if occasion==2
}

gen weekdayt2 = weekdayt + 10*(gendert-1)
gen aget2 = aget + 10*(gendert-1)

* occ2vart created at checks.do 012219
*recode occ2vart (4=2) (9=7) (14=12) (19=17) (24=22) (29=27) (34=32) (39=37)
gen occ2vart2 = occ2vart + 100*(gendert-1)

* TEEN get the marginals for raking
include "marg_fin_teen.do"


survwgt rake wgt if  occasion==2, by(gendert weekdayt2 aget2 occ2vart2) totvar(marg_sex marg_day marg_age marg_occ) generate(twgt)
*survwgt rake wgt if  occasion==2, by(gendert weekdayt2 aget2) totvar(marg_sex marg_day marg_age) generate(twgt)

pcent occ2var [pw=twgt], inc(all) out(testwgt.txt) app


gen finwgt = awgt if occasion==3
replace finwgt = kwgt if occasion==1
replace finwgt = twgt if occasion==2

move finwgt popwgt
vlabel finwgt "Final occasion weight"

svyset userid [pw=finwgt], strata(weekday)

svycent adult occ2var, inc(all) by(sd2) out(weighted occ2var.txt) n("W E I G H T E D")


* New in 2018
* Generate final unweighted counts for teens for final weighting
svycent selfreportedteen, inc(all) by(piece) out(selfreportedteen.txt) n("W E I G H T E D")

*`fexit' //set this to break before the finwgt control margins are determined

* Adjust proportion of teens to CPS
if "`sesn'"=="Spring" replace finwgt = finwgt * 00.873671624702834 if selfreportedteen==0
if "`sesn'"=="Spring" replace finwgt = finwgt * 01.126328375297170 if selfreportedteen==1

if "`sesn'"=="Summer" replace finwgt = finwgt * 00.875290370111036 if selfreportedteen==0
if "`sesn'"=="Summer" replace finwgt = finwgt * 01.124709629888960 if selfreportedteen==1

if "`sesn'"=="Fall"   replace finwgt = finwgt * 00.879337535114953 if selfreportedteen==0
if "`sesn'"=="Fall"   replace finwgt = finwgt * 01.120662464885050 if selfreportedteen==1


* Final wgt
summ finwgt
replace finwgt = finwgt / r(mean)

* Final Adult wgt
*summ finwgt if(occasion==3)
*replace finwgt = finwgt / r(mean) if(occasion==3)

* Final Kid wgt
*summ finwgt if(occasion==1)
*replace finwgt = finwgt / r(mean) if(occasion==1)

* Final Teen wgt
*summ finwgt if(occasion==2)
*replace finwgt = finwgt / r(mean) if(occasion==2)


*pcent   occ2var if !kidocc, inc(all) by(sd2) out(occ2var.txt) n("U N W E I G H T E D   ( A D U L T )")
*pcent   occ2var if  kidocc, inc(all) by(sd2) out(occ2var.txt) n("U N W E I G H T E D   ( K I D S )") app
*svycent occ2var if !kidocc, inc(all) by(sd2) out(occ2var.txt) n("N E W   W E I G H T S   ( A D U L T )") app
*svycent occ2var if  kidocc, inc(all) by(sd2) out(occ2var.txt) n("N E W   W E I G H T S   ( K I D S )") app

drop occ2vart - twgt
* don't really need these either
foreach v in record date2yr date se1a_a se1a_c se1a_e se1a_g se2_?_text se5_i se5_i_text se5_j se5b_a se5b_c se5b_e se5b_g se6_?_text qb0a_16_text q06_23_text event occwgt {
   capture drop `v'
}


* a "popwgt" for the kid occasions in the screener
egen kids = rsum(sd3a_1-sd3a_18 sd3b_1-sd3b_18)
gen kidwgt = popwgt * kids
vlabel kidwgt "Population weight for children"
move kidwgt time_entered
drop kids


