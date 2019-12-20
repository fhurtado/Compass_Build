***
// code to consolidate nearly all of the new variable construction
//    a handful, mostly demos, are generated elsewhere (prewgt.do) as part of the popwgt procedure
//    it is called by "reform vars.do" and calls several other programs, including
//       occdefs.do
//       counters.do
//       foods.do
//       retailers.do (uniquely defined for every survey round)
***
* there are four blocks of constructed/recoded vars:
* 1) DEMOS
* 2) OCCASION SPECIFICS, INCLUDING COUNTERS & FOOD CATEGORIES
* 3) RETAILERS AND CHANNEL SOURCING
* 4) ZONE

****** DEMOS ******
* see also PREWGT.DO

* New in 2019, generate Unique ID for each Respondent.
* The Respondent_ID variable provided by the vendor is unique within
* each wave but not within each year.
* We'll add time-stamp information to assure uniqueness
* Also Respondent_ID is a string, and efficiencies on merging
* can be gained by converting to an integer.

*Concatenate string representation of the 4-digit year + 2 digit month + 2 digit day + Respondent_id
* Can be applied after renaming
gen unique_userid = string(year, "%02.0f") + string(month, "%02.0f") + string(day, "%02.0f") + "_" + string(userid, "%10.0f")
vlabel unique_userid "YYYYMMDD-respondent serial #, is unique per individual"
order unique_userid, before(userid)

* Can be applied after stacking
gen unique_occid = unique_userid + "_" +  string(piece, "%01.0f")
vlabel unique_occid "YYYYMMDD-respondent serial #- occasion piece, is unique per occasion"
order unique_occid, after(unique_userid)


* New in 2016 *
* Self reported vs parent reported 
*gen selfreportedteen = resp_age<18
* Self reported modified 11/30/17
gen selfreportedteen = age<18
vlabel selfreportedteen "Self-reported teen 13-17"
label val selfreportedteen YESNO

move weekday qb0
replace weekday = weekday - 1 if qb0==2
replace weekday = 6 if weekday<0
label val weekday WEEKDAY
gen weekpart = inlist(weekday,0,6)
move weekpart qb0
replace weekpart = 1 if weekday==5 & occ2var>25
vlabel weekpart "Part of week (Friday night dinner in weekend)"
label val weekpart WEEKPART

* identify generations
recode age (`gen_z' = 0 "Gen-Z") (`millenial' = 1 "Millennial") (`gen_x' = 2 "Gen-X") (`boomer' = 3 "Boomer") (`silent' = 4 "Silent"), gen(generation) label(GENERATION)
move generation gender
vlabel generation "Generation"

* Add Gen-Z starting Spring 2016
gen genz = generation==0 if generation<.
move genz gender
vlabel genz "Gen-Z"
label val genz YESNO

gen millennial = generation==1 if generation<.
move millennial gender
vlabel millennial "Millennial"
label val millennial YESNO

gen genx = generation==2 if generation<.
move genx gender
vlabel genx "Gen-X"
label val genx YESNO

gen boomer = generation==3 if generation<.
move boomer gender
vlabel boomer "Boomer"
label val boomer YESNO

* any kids in HH, including other's kids
gen kidhh = us09kid > 0
move kidhh us09kid
vlabel kidhh "Any children in household"
label val kidhh YESNO

* empty nester?  this is a constructed var that assumes an empty nest when:
*  ever married, over 40 and no kids in HH
*  childless couples are coded as empty nesters if over 40
*  couples living with adult children are coded as empty nesters
gen empty = inlist(qp05,1,5,6,7) & age>40 & kidhh==0
move empty kidhh
vlabel empty "Empty nester"
label val empty YESNO

* *DON'T* tweak age groups
*drop agegrp
*recode age (18/25=1 "18 - 25") (26/35=2 "26 - 35") (36/45=3 "36 - 45") (46/55=4 "46 - 55") (56/65=5 "56 - 65") (66/70=6 "66 - 70"), gen(agegrp) label(AGEGRP)
*move agegrp generation
*vlabel agegrp "Age"

* BMI index

gen height = qp01a_1 * 12 + qp01a_2
move height qp01b
gen bmi = 703 * qp01b / ( height * height ) 
move bmi qp02

vlabel height "Height in inches"
vlabel bmi "Body Mass Index"
/* checking for values too low */
sort bmi
*list bmi qp01b qp01a_1 qp01a_2 gender if bmi<16, nol nodisp
replace bmi = . if bmi<=14.81

gen obese = bmi >= 30 if bmi<.
move obese qp02
gen overwgt = bmi >= 25 if bmi<.
move overwgt qp02
label val obese YESNO
label val overwgt YESNO
vlabel obese "Obese, BMI >= 30"
vlabel overwgt "Overweight, BMI >= 25"

recode bmi (min/18.5=1) (18.5/25=2) (25/30=3) (30/max=4), gen(obeseg)
move obeseg qp02
label val obeseg OBESEG
vlabel obeseg "Obesity index: BMI <18.5, 18.5-24.9, 25-29.9, 30+"

****** OCCASION SPECIFICS ******
*
* indicators for kid and adult occasions
*gen kidocc = inlist(occ2var,5,10,15,20,25,30,35,40) /* Used in 2016 */

*Adjusted to include selfreportedteen in 2017 11/30/17
gen kidocc = inlist(occ2var,5,10,15,20,25,30,35,40) | selfreportedteen
vlabel kidocc "Kid's eating occasion"
move kidocc qb0
label val kidocc YESNO
gen adult = !kidocc
vlabel adult "Adult occasion"
move adult kidocc
label val adult YESNO

* make classification variables for who, when where
include "`dir'\occdefs.do"

* create an indicator for no adult eating in past 24 hours
replace se1 = inlist(1, se1_a, se1_b, se1_c, se1_d, se1_e, se1_f, se1_g, se1_h)
label val se1 YESNO

* calculate # of eatings per respondent per day
egen eatings = rsum(se1a_a se1_b se1a_c se1_d se1a_e se1_f se1a_g se1_h)
move eatings qb0
vlabel eatings "Number of respondent's eating occasions (on surveyed day)"
egen keatings = rsum(se5b_a se5_b se5b_c se5_d se5b_e se5_f se5b_g se5_h)
move keatings qb0
vlabel keatings "Number of kid's eating occasions (on surveyed day)"
************************************************
drop if eatings > 30    //no insane respondents allowed
drop if keatings > 30
************************************************
* cap snack counts at 5
forvalues i=1(2)8 {
   foreach q in 1a 5b {
      recode se`q'_`i' (5/max=5)
   }
}
* recalculate # of eatings per respondent per day, using capped snacking counts
regen eatings = rsum(se1a_1 se1_b se1a_3 se1_d se1a_5 se1_f se1a_7 se1_h)
regen keatings = rsum(se5b_1 se5_b se5b_3 se5_d se5b_5 se5_f se5b_7 se5_h)
* create some fill-in vars for meal occasion counts
forvalues i=2(2)8 {
   local a = char(96+`i')
   local j = `i' + 1
   gen se1a_`i' = se1_`a'
   vlabel se1a_`i', from(se1_`a')
   if `j'<=8 move se1a_`i' se1a_`j'
   else move se1a_`i' se2
   gen se5b_`i' = se5_`a'
   vlabel se5b_`i', from(se5_`a')
   if `j'<=8 move se5b_`i' se5b_`j'
   else move se5b_`i' se6
}
vlabel se1a_1 "Early morning"
vlabel se1a_3 "Morning"
vlabel se1a_5 "Afternoon"
vlabel se1a_7 "After dinner"
vlabel se1a_8 "Late night"
vlabel se5b_1 "Early morning"
vlabel se5b_3 "Morning"
vlabel se5b_5 "Afternoon"
vlabel se5b_7 "After dinner"
vlabel se5b_8 "Late night"

* meal or snack occasion
gen meal = inlist(when, 2, 4, 6)
move meal adult
vlabel meal "Occasion type"
label val meal MEAL
gen snack = inlist(when, 1, 3, 5, 7, 8)
move snack adult
vlabel snack "A snack occasion"
label val snack YESNO


* reduce some snacking dayparts
recode when (1 3 = 0) (2=2) (4=4) (5=5) (6=6) (7 8 = 9), gen(daypart)
move daypart qb0
vlabel daypart, from(when)
label val daypart WHEN

* some classification variables for better understanding who and where
gen anyalone = inlist(1, qb1a_1, qb1a_2, qb1a_3, qb1a_4)
gen alone = who==1
move alone qb0
vlabel alone "Ate alone"
label val alone YESNO
replace qb1a_1 = 1 if alone & !anyalone
forvalues i=1/4 {
   replace qb1a_`i' = 0 if !alone & qb1a_`i'==1
}
drop anyalone

gen couple = who==2
move couple qb0
vlabel couple "Ate with significant other"
label val couple YESNO

gen otheradultfamily = inlist(who,3,4) & inlist(1,qb1d_1,qb1d_2,qb1d_3,qb1d_4,qb1d_5,qb1d_6) & !inlist(1,qb1h_1,qb1h_2,qb1h_3)
move otheradultfamily qb0
vlabel otheradultfamily "Ate with other adult family members"
label val otheradultfamily YESNO

gen otheradult = inlist(who,3,4) & inlist(1,qb1f_1,qb1f_2,qb1f_3,qb1f_4,qb1f_5)
move otheradult qb0
vlabel otheradult "Ate with other nonfamily adults"
label val otheradult YESNO

gen anychild = inlist(who,3,4) & inlist(1,qb1h_1,qb1h_2,qb1h_3)
move anychild qb0
vlabel anychild "Ate with children (under 18 yrs old)"
label val anychild YESNO

gen parent = inlist(who,3,4) & inlist(1,qb1d_1,qb1d_2)
move parent qb0
vlabel parent "Ate with mother or father"
label val parent YESNO


gen myhome = qb2a==1
move myhome qb0
vlabel myhome "Ate at my home"
label val myhome YESNO

gen otherhome = qb2a!=1 & where==1
move otherhome qb0
vlabel otherhome "Ate at someone else's home"
label val otherhome YESNO

gen instore = qb2g<7 & qb2g!=4
move instore qb0
vlabel instore "Ate at an in-store eatery"
label val instore YESNO

gen intransit = qb2h<. | qb2c==7
move intransit qb0
vlabel intransit "Ate while traveling"
label val intransit YESNO

* identify those bringing food from home when eating away from home
gen ah_cfh = where != 3
move ah_cfh qb0
vlabel ah_cfh "At home/Carried from home"
label val ah_cfh AH_CFH
replace ah_cfh = 0 if inlist(where, 2, 4) & !inlist(1,q42_6,q42_7,q42_8,q42_9)

gen cfh = inlist(where, 2, 4) & !inlist(1,q42_6,q42_7,q42_8,q42_9)
move cfh qb0
vlabel cfh "Carried from home"
label val cfh CFH

gen afh = where != 1
move afh qb0
vlabel afh "Away from home"
label val afh AFH

gen source = 3 if inlist(where, 2, 4)
move source qb0
vlabel source "Food sourcing when away from home"
replace source = 2 if where==3
replace source = 1 if cfh==1
label val source SOURCE

* most inclusive IC definition
gen ic = where==3 | q42_4==1 if where<. | q42_4<.
vlabel ic "Immediate consumption occasion"
move ic qb0
label val ic YESNO

* calculate # of eaters per occasion
gen eaters = 1 + couple + qb1c + qb1e if adult
move eaters qb0
vlabel eaters "Number of adults present on occasion"

* emotional connections
gen stressor = (inlist(1, q02_1, q02_10, q02_11, q02_12, q02_13) & (adult | selfreportedteen)) | (inlist(1, q02a_10, q02a_11, q02a_12, q02a_13) & (kidocc & !selfreportedteen))
move stressor q03
vlabel stressor "Emotional stress on occasion"
label val stressor YESNO
gen destressor = (inlist(1, q02_3, q02_6, q02_7, q02_8, q02_9) & (adult | selfreportedteen)) | (inlist(1, q02a_3, q02a_6, q02a_8) & (kidocc & !selfreportedteen))
move destressor q03
vlabel destressor "Stress reduction on occasion"
label val destressor YESNO
gen nonstressor = (inlist(1,q02_2, q02_4, q02_5, q02_14, q02_16) & (adult | selfreportedteen)) | (inlist(1,q02a_2, q02a_4, q02_14, q02a_16) & (kidocc & !selfreportedteen))
move nonstressor q03
vlabel nonstressor "Neither stressor or destressor on occasion"
label val nonstressor YESNO

****** OCCASIONS COUNTERS ********
*
include "`dir'\counters.do"

****** FOOD CATEGORIES *********
*
include "`dir'\foods.do"

****** RETAILERS AND CHANNEL SOURCING *******
*
* *DON'T* recode the channel sourcing variable (q43_2) to equal 1 for all "out" occasions 
*replace q43_2  = 1 if where==3


* build the retailer variables from QP03, write-ins and QP04
gen qp03_kroger = inlist(1, qp03_13, qp03_14, qp03_19, qp03_23)
move qp03_kroger qp03_20
vlabel qp03_kroger "Kroger, all"

* 060618 Modified Safeway banners because now named Albertsons Companies, from 2015 onwards
*gen qp03_safeway = inlist(1, qp03_9, qp03_24, qp03_34)
*move qp03_safeway qp03_25
*vlabel qp03_safeway "Safeway, all"
gen qp03_albertsons = inlist(1, qp03_2, qp03_9, qp03_17, qp03_24, qp03_26, qp03_34)
move qp03_albertsons qp03_2
vlabel qp03_albertsons "Albertsons Companies"

gen qp03_target = inlist(1, qp03_29, qp03_30)
move qp03_target qp04
vlabel qp03_target "Target, all"
* 060618 Remove Supervalu because Supervalu does not own Albertson's, Jewel, or Shaw's anymore  
*gen qp03_supervalu = inlist(1, qp03_2, qp03_17, qp03_26)
*move qp03_supervalu qp04
*vlabel qp03_supervalu "Supervalu"
gen qp03_walmart = inlist(1, qp03_40, qp03_41)
move qp03_walmart qp04
vlabel qp03_walmart "Walmart, all"
gen qp03_club = inlist(1, qp03_4, qp03_6, qp03_25)
move qp03_club qp04
vlabel qp03_club "Club (BJ's, Costco & Sam's)"
gen qp03_drug = inlist(1, qp03_7, qp03_35)
move qp03_drug qp04
vlabel qp03_drug "Drug (CVS & Walgreens)"
gen qp03_value = inlist(1, qp03_8, qp03_12)
move qp03_value qp04
vlabel qp03_value "Value (Dollar General & Family Dollar)"

label val qp03_kroger YESNO
*label val qp03_safeway YESNO
label val qp03_albertsons YESNO
label val qp03_target YESNO
*label val qp03_supervalu YESNO
label val qp03_walmart YESNO
label val qp03_club YESNO
label val qp03_drug YESNO
label val qp03_value YESNO

* New in 2018 
* qp04 Recode Amazon from 43 to 47
recode qp04 (43=47)

* favorite retailer rolled up to major banners
recode qp04 (4 6 25=44) (7 35=45) (8 12=46) (11 28=48) (41=40) (9 17 24 26 34=2) (13 14 23=19) (29=30), gen(retailers)
move retailers qp05
vlabel retailers, from(qp04)
label val retailers QP04

* custom program with "other" write-in recodes
include "retailers.do"

******* ZONE ********
//CHANGED TO ADJUST FOR EXTREME INSTRUMENTAL PREDICTION FOR KID OCCASIONS
// BIGGEST CHANGE IS TO q1000005-q1000014, BUT ALSO DROPPED MAIN EFFECT OF KIDOCC FROM xb CALCULATION
* run zone algorithm
* skip "Other, specify" for adult
* include "Other, specify" for kids
egen q02s = rsum(q02_1 - q02_14 q02_16)
egen q02as = rsum(q02a_2 - q02a_14 q02a_16)
gen q2q1 = q01_1 + 1
gen q2q5 = q01_2 + 1
gen q2q13 = q01_3 + 1
gen q2q20 = q01_4 + 1
gen q2q22 = q01_5 + 1
gen q4q1 = q03_1
gen q4q21 = q03_13
gen q4q22 = q03_14
gen q1000005 = (q02_1==1 & (adult | selfreportedteen)) | (inlist(1,q02a_2,q02a_3,q02a_4,q02a_6,q02a_8,q02a_10,q02a_11,q02a_12,q02a_13) & kidocc & !selfreportedteen)
gen q1000008 = (q02_5==1 & (adult | selfreportedteen)) | (inlist(1,q02a_3,q02a_4) & kidocc & !selfreportedteen)
gen q1000014 = (q02s==0 & adult)
gen xb = q2q1*-0.267818458663827 + q2q5*0.146865891977423 + q2q13*-0.0550016413434127 + q2q20*0.0709830149793868 + q2q22*0.129732623715486 + q4q1*-0.109279018955171 + q4q21*0.195692431907006 + q4q22*0.242684348717608 + q1000005*-1.13285011577688 + q1000008*-0.672720324638196 + q1000014*-0.392228489872727
gen ist = normal(0.869842657922902 - xb)
gen sav = normal(3.44591496686252 - xb) - normal(0.869842657922902 - xb)
gen itl = 1 - normal(3.44591496686252 - xb)

gen zone = 1 if ist > (sav+.25)  &  ist > (itl+.25) & itl<.
replace zone = 2 if (sav+.25) > ist  &  sav > itl & itl<.
replace zone = 3 if (itl+.25) > ist  &  itl > sav & itl<.
move zone who
vlabel zone "Orientation"
label val zone ZONE
drop q02s - itl

* combine daypart and zone into occasions
gen occpart = when + 10*(zone==2)
move occpart qb0
vlabel occpart "Eating occasions"
label val occpart OCCPART

* create the occasion variable (i.e., event X zone)
/*
gen occasion = event + (110 * (zone==2)) if event<111
vlabel occasion "Eating occasion"
move occasion qb0
forvalues i = 1/110 {
   local j = `i' + 110
   label define OCC `i' `"IST `:label (event) `i''"', modify
   label define OCC `j' `"SAV `:label (event) `i''"', modify
}
label define OCC 300 "All other occasions", modify
label val occasion OCC
*/
