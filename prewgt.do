***
// code to set up the vars needed to create control margins for the population weight procedure
//    it is called by the "reform vars.do" program, just before the popwgt program is called
***
* drop variables that are never used or blank
foreach v of varlist se1_i se1_i_text se1_j se5_i se5_i_text se5_j {
   capture drop `v'
}
foreach v of varlist dchild_? dchild_?? {
   capture drop `v'
}
* New variable names starting Spring 2016
*drop issynovate iispanelistid returncode cultureinfo currentday currentmonth currentyear quotagerange us09kid

*foreach v of varlist us09kp us01pst01 - us32hhi tzone msa cbsa dma tzonep us09tim {
*   capture drop `v'
*}
*foreach v of varlist qgendp2 - qrelap12 dumqp* who_b1 - occasion40 {
*   capture drop `v'
*}
*foreach v of varlist occasion1snacknumber - quota_mastermeal2 {
*   capture drop `v'
*}
*foreach v in interviewduration respid minutestocomplete {
*   capture drop `v'
*}
*foreach v of varlist occasion4? dmocationorder41 - quota_occasion245 {
*   capture drop `v'
*}
*if `yyyy'!=2015 | "`sesn'"!="Spring" foreach v of varlist resp_gender - wave {
*   capture drop `v'
*}

* create gender-specific indicators for weighting variables
* convert time values from string to numeric
format time_entered time_completed %tcDD-Mon-CCYY_hh:MM:SS_AM

* identify day of survey
gen day = day(dofc(time_completed))
move day zip
vlabel day "Day of survey"

capture drop month year
gen month = month(dofc(time_completed))
move month zip
vlabel month "Month of survey"

gen year = `yyyy'
vlabel year "Year of survey"
move year zip

* part of week
gen weekday = dow(dofc(time_completed))
vlabel weekday "Day of week"

* New in 2019 *
*age - Age max 73 in 2019
recode age (13/17=0 "13 - 17") (18/24=1 "18 - 24") (25/34=2 "25 - 34") (35/44=3 "35 - 44") (45/54=4 "45 - 54") (55/64=5 "55 - 64") (65/`bo'=6 "65 - `bo'"), gen(agegrp) label(AGEGRP)
move agegrp gender
vlabel agegrp "Age"

*age
*recode age (13/17=1 "13 - 17") (18/24=2 "18 - 24") (25/34=3 "25 - 34") (35/44=4 "35 - 44") (45/54=5 "45 - 54") (55/64=6 "55 - 64") (65/70=7 "65 - 70"), gen(agegrp3) label(AGEGRP3)
*move agegrp3 gender
*vlabel agegrp3 "Age"

* create some simple race and Hispanic indicators

* New in 2019: usrace2* not asked in 2019 so use usrace3* and usrace4* *
*gen race = usrace2_1
*move race usreth3
*forvalues i=3/15 {
*   replace race = 3 if usrace2_`i'==1
*}
*replace race = 2 if usrace2_2==1
*vlabel race "Race"
*label val race RACE

*gen race3 = usrace2_1
*move race3 usreth3
*forvalues i=2/15 {
*   replace race3 = 2 if usrace2_`i'==1
*}
*vlabel race3 "Race"
*label val race3 RACE3
gen race = usrace41
move race usreth3
forvalues i=43/47 {
   replace race = 3 if usrace`i'==1
}
replace race = 2 if usrace42==1
vlabel race "Race"
label val race RACE
pcent usrace4*, by(race)

gen race02 = usrace41
move race02 usreth3
foreach i of varlist usrace43 usrace46 usrace47 {
   replace race02 = 4 if `i'==1
}
replace race02 = 3 if usrace44==1 | usrace45==1
replace race02 = 2 if usrace42==1
vlabel race02 "Race"
label val race02 RACE2
pcent usrace4*, by(race02)

gen race3 = usrace41
move race3 usreth3
forvalues i=42/47 {
   replace race3 = 2 if usrace`i'==1
}
vlabel race3 "Race"
label val race3 RACE3

* Starting in 2016 Spring, use usreth3 with different codes
*recode usreth2 (. 1 = 0 "No") (2 = 1 "Mexican") (3/max = 2 "Other Hispanic"), gen(latino) label(LATINO)
*move latino qp12
*vlabel latino "Hispanic/Latino"
*recode usreth2 (. 1 = 0 "No") (2/max = 1 "Yes"), gen(hisp) label(HISP)
*move hisp qp12
*vlabel hisp "Hispanic/Latino"
recode usreth3 (2 3 = 0 "No") (1 = 1 "Hispanic, Latino or Spanish origin"), gen(latino) label(LATINO)
move latino qp12
vlabel latino "Hispanic/Latino"
recode usreth3 (2 3 = 0 "No") (1 = 1 "Yes"), gen(hisp) label(HISP)
move hisp qp12
vlabel hisp "Hispanic/Latino"

* Starting in 2016 Spring, use usedu3
* create some simple education and income variables
recode usedu3 (1/4=1 "Less than H.S.") (5 6=2 "H.S. graduate") (7/9=3 "Some college") (10=4 "College graduate") (11/13=5 "Post graduate"), gen(educ) label(EDUC)
vlabel educ "Education"
move educ usedu3

* ushhi2 not used starting in SPRING 2017. Use ushhi3 instead and 26 is "Prefer not to answer"
* hotdeck impute if missing income values
*local N = _N
*summ ushhi2
*if r(max)==24 {
*   replace ushhi2 = . if ushhi2==24
*   gen hhsize = qp09>2
*   hotdeck ushhi2, store keep(userid ushhi2) seed(2394763) by(educ race agegrp hhsize)
*   merge 1:1 userid using imp1, update
*   drop _merge
*   erase imp1.dta
*   summ ushhi2
*   if r(N)<_N {
*      hotdeck ushhi2, store keep(userid ushhi2) seed(9394763) by(qp08 race agegrp hhsize)
*      merge 1:1 userid using imp1, update
*      drop _merge
*      erase imp1.dta
*   }
*   drop hhsize
*}

*recode ushhi2 (1/4=1 "Less than $20,000") (5 6=2 "$20,000-$29,999") (7 8=3 "$30,000-$39,999") (9 10=4 "$40,000-$49,999") (11 12=5 "$50,000-$59,999") (13/15=6 "$60,000-$74,999") (16/18=7 "$75,000-$99,999") (19 20=8 "$100,000-$149,999") (21/23=9 "$150,000 or more"), gen(income) label(INCOME)
*vlabel income "Household income"
*move income ushhi2

local N = _N
summ ushhi3
if r(max)==26 {
   replace ushhi3 = . if ushhi3==26
   gen hhsize = qp09>2
   hotdeck ushhi3, store keep(userid ushhi3) seed(2394763) by(educ race agegrp hhsize)
   merge 1:1 userid using imp1, update
   drop _merge
   erase imp1.dta
   summ ushhi3
   if r(N)<_N {
      hotdeck ushhi3, store keep(userid ushhi3) seed(9394763) by(qp08 race agegrp hhsize)
      merge 1:1 userid using imp1, update
      drop _merge
      erase imp1.dta
   }
   drop hhsize
}

recode ushhi3 (1/4=1 "Less than $20,000") (5 6=2 "$20,000-$29,999") (7 8=3 "$30,000-$39,999") (9 10=4 "$40,000-$49,999") (11 12=5 "$50,000-$59,999") (13/15=6 "$60,000-$74,999") (16/20=7 "$75,000-$99,999") (21 22=8 "$100,000-$149,999") (23/25=9 "$150,000 or more"), gen(income) label(INCOME)
vlabel income "Household income"
move income ushhi3

* any own children?  
* 2012 - 2015 *
*egen ownkids = rsum(sd3a_1-sd3a_18 sd3b_1-sd3b_18)
*replace ownkids = 4 if 4<ownkids
*move ownkids sd3a
*vlabel ownkids "Number of own children"
*label val ownkids OWNKIDS

* 2016 - 2017 *
*gen ownkids = (dkids01_1_dkids01_yob!=. & dkids01_1_dkids01_rel==1) + (dkids01_2_dkids01_yob!=. & dkids01_2_dkids01_rel==1) + (dkids01_3_dkids01_yob!=. & dkids01_3_dkids01_rel==1) + (dkids01_4_dkids01_yob!=. & dkids01_4_dkids01_rel==1) + (dkids01_5_dkids01_yob!=. & dkids01_5_dkids01_rel==1) + (dkids01_6_dkids01_yob!=. & dkids01_6_dkids01_rel==1) + (dkids01_7_dkids01_yob!=. & dkids01_7_dkids01_rel==1) + (dkids01_8_dkids01_yob!=. & dkids01_8_dkids01_rel==1) + (dkids01_9_dkids01_yob!=. & dkids01_9_dkids01_rel==1) + (dkids01_10_dkids01_yob!=. & dkids01_10_dkids01_rel==1) + (dkids01_11_dkids01_yob!=. & dkids01_11_dkids01_rel==1) + (dkids01_12_dkids01_yob!=. & dkids01_12_dkids01_rel==1) 
*replace ownkids = 4 if 4<ownkids
*move ownkids sd3a
*vlabel ownkids "Number of own children"
*label val ownkids OWNKIDS

* New in 2018 *
*gen tempownkids = sd2==1 | qp1_1==1
*t ownkids tempownkids 
*egen ownkids2 = rsum(sd3a_1-sd3a_18 sd3b_1-sd3b_18)
*egen ownkids = rsum(gird_qsd2c_1_qsd2c gird_qsd2c_2_qsd2c gird_qsd2c_3_qsd2c gird_qsd2c_4_qsd2c sd3a_1-sd3a_18 sd3b_1-sd3b_18) / Results in 0 number of children for 18+ so not acceptable /
gen ownkids = us09kid
replace ownkids = 4 if 4<ownkids
move ownkids sd3a
vlabel ownkids "Number of own children"
label val ownkids OWNKIDS
t age ownkids

