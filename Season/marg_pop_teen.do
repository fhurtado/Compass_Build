* Pasted from Fall Weighter.xlsx\Stata demo code teen 1317 Column J:J
* Weighing Teens 13-17 based on CPS and Survey data
generate marg_sex = .  //Gender (FROM CPS KIDS 13-17)
replace marg_sex = 10776066 if gender==1 //Male
replace marg_sex = 10660300 if gender==2 //Female
replace marg_sex = . if age>17 //Over Gen-Z
generate marg_day = .  //
replace marg_day =  3078876 if weekday3==0 & gender==1 //Male, SaSu
replace marg_day =  4618314 if weekday3==1 & gender==1 //Male, MTuW
replace marg_day =  3078876 if weekday3==2 & gender==1 //Male, ThF
replace marg_day =  3045800 if weekday3==0 & gender==2 //Female, SaSu
replace marg_day =  4568700 if weekday3==1 & gender==2 //Female, MTuW
replace marg_day =  3045800 if weekday3==2 & gender==2 //Female, ThF
replace marg_day = . if age>17 //Over Gen-Z
generate marg_age = .  //Age of respondent (FROM CPS KIDS 13-17)
replace marg_age =  2111490 if age==13 & gender==1 //Male, 13
replace marg_age =  2096483 if age==14 & gender==1 //Male, 14
replace marg_age =  2139748 if age==15 & gender==1 //Male, 15
replace marg_age =  2158924 if age==16 & gender==1 //Male, 16
replace marg_age =  2269422 if age==17 & gender==1 //Male, 17
replace marg_age =  2162337 if age==13 & gender==2 //Female, 13
replace marg_age =  2013864 if age==14 & gender==2 //Female, 14
replace marg_age =  2064900 if age==15 & gender==2 //Female, 15
replace marg_age =  2212855 if age==16 & gender==2 //Female, 16
replace marg_age =  2206344 if age==17 & gender==2 //Female, 17
replace marg_age = . if age>17 //Over Gen-Z
generate marg_race = .  //Race  (FROM CPS KIDS 13-17)
replace marg_race =  7863458 if race==1 & gender==1 //Male, Caucasian
replace marg_race =  1926545 if race==2 & gender==1 //Male, African American
replace marg_race =   986063 if race==3 & gender==1 //Male, Other
replace marg_race =  7665784 if race==1 & gender==2 //Female, Caucasian
replace marg_race =  1871265 if race==2 & gender==2 //Female, African American
replace marg_race =  1123251 if race==3 & gender==2 //Female, Other
replace marg_race = . if age>17 //Over Gen-Z
generate marg_hisp = .  //Hispanic (FROM CPS KIDS 13-17)
replace marg_hisp =  8146625 if hisp==0 & gender==1 //Male, Not Hispanic
replace marg_hisp =  2629441 if hisp==1 & gender==1 //Male, Hispanic/Latino
replace marg_hisp =  8080905 if hisp==0 & gender==2 //Female, Not Hispanic
replace marg_hisp =  2579395 if hisp==1 & gender==2 //Female, Hispanic/Latino
replace marg_hisp = . if age>17 //Over Gen-Z
generate marg_reg = .  //Census Region  (FROM CPS KIDS 13-17)
replace marg_reg =  1715648 if region==1 & gender==1 //Male, Northeast
replace marg_reg =  2280759 if region==2 & gender==1 //Male, Midwest (formerly North Central)
replace marg_reg =  4317381 if region==3 & gender==1 //Male, South
replace marg_reg =  2462279 if region==4 & gender==1 //Male, West
replace marg_reg =  1696070 if region==1 & gender==2 //Female, Northeast
replace marg_reg =  2313708 if region==2 & gender==2 //Female, Midwest (formerly North Central)
replace marg_reg =  4201268 if region==3 & gender==2 //Female, South
replace marg_reg =  2449254 if region==4 & gender==2 //Female, West
replace marg_reg = . if age>17 //Over Gen-Z
generate marg_inc = .  //Income  (FROM CPS KIDS 13-17)
replace marg_inc =  2424294 if income3==1 & gender==1 //Male, Under $35,000
replace marg_inc =  4477522 if income3==2 & gender==1 //Male, $35,000 - $99,999
replace marg_inc =  3874250 if income3==3 & gender==1 //Male, $100,000 +
replace marg_inc =  2511217 if income3==1 & gender==2 //Female, Under $35,000
replace marg_inc =  4445639 if income3==2 & gender==2 //Female, $35,000 - $99,999
replace marg_inc =  3703444 if income3==3 & gender==2 //Female, $100,000 +
replace marg_inc = . if age>17 //Over Gen-Z
generate marg_educ = .  //Education of respondent  (FROM demos from survey)
replace marg_educ =  7168816 if educhs==1 //H.S. graduate or less
replace marg_educ = 14267550 if educhs==2 //Some college or more
replace marg_educ = . if age>17 //Over Gen-Z
generate marg_kids = .  //Number of children  (FROM demos from survey)
replace marg_kids =  8048814 if kids2==1 //1
replace marg_kids =  8181023 if kids2==2 //2
replace marg_kids =  5206528 if kids2==3 //3+
replace marg_kids = . if age>17 //Over Gen-Z


