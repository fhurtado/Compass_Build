** Remove bad quality respondents/discards (About 5% of sample)
*	Quality 1: OE hostile response in Q50 OR QA1/QA2 OR other verbatims
* 	Quality 2: LOI
*	Quality 3: OE junk response in Q50 and QA1/QA2 OR other verbatims
*	Quality 4: Multiselect all drinks or foods checked
*   Quality 6: Aparicio's [NEW IN 2018] [FAKE RESTAURANT USED AS RED-HERRING] checked at Q45A

* 1 Strike and Removed (110316)
* Quality 1: Verbatims hostile responses - Automatically remove respondents
gen qualitydrop = 0
replace qualitydrop = 1 if respondent_serial == 35844 // Q50 HOSTILE
replace qualitydrop = 1 if respondent_serial == 14799 // Q50 HOSTILE
replace qualitydrop = 1 if respondent_serial == 52701 // Q50 HOSTILE

t qualitydrop  /* 8 Consumers  */

* Quality 2: Response time less than 1/3 of Median (in whole minutes)
gen quality2 = . 
* Get the median for respondents with only 1 occasion
quietly summarize minutestocomplete if eatingoccasion2 == . , detail
replace quality2 = 1 if minutestocomplete < r(p50) / 3 & minutestocomplete > 0 & eatingoccasion2 == . 
* Same, now for respondents with 2 occasions
quietly summarize minutestocomplete if eatingoccasion2 != . , detail
replace quality2 = 1 if minutestocomplete < r(p50) / 3 & minutestocomplete > 0 & eatingoccasion2 != .
vlabel quality2 "Quality issue 2: Time below 1/3 of median"
t minutestocomplete quality2 /* Check that everything looks alright */
t quality2 /* 45 Consumers  */

* Quality 3: Q50 Verbatims qc 2 or more junk OR QA1/QA2 (both junk) OR other verbatims
gen quality3 = .
replace quality3 = 1 if respondent_serial == 18300 //Q50 junk count=37
replace quality3 = 1 if respondent_serial == 57882 //Q50 junk count=37
replace quality3 = 1 if respondent_serial == 62371 //Q50 junk count=36
replace quality3 = 1 if respondent_serial == 10717 //Q50 junk count=34
replace quality3 = 1 if respondent_serial == 24612 //Q50 junk count=32
replace quality3 = 1 if respondent_serial == 59292 //Q50 junk count=31
replace quality3 = 1 if respondent_serial == 61094 //Q50 junk count=28
replace quality3 = 1 if respondent_serial == 4769 //Q50 junk count=27
replace quality3 = 1 if respondent_serial == 31933 //Q50 junk count=27
replace quality3 = 1 if respondent_serial == 24723 //Q50 junk count=23
replace quality3 = 1 if respondent_serial == 47789 //Q50 junk count=22
replace quality3 = 1 if respondent_serial == 24628 //Q50 junk count=21
replace quality3 = 1 if respondent_serial == 52476 //Q50 junk count=19
replace quality3 = 1 if respondent_serial == 37729 //Q50 junk count=18
replace quality3 = 1 if respondent_serial == 44515 //Q50 junk count=17
replace quality3 = 1 if respondent_serial == 39737 //Q50 junk count=16
replace quality3 = 1 if respondent_serial == 61653 //Q50 junk count=16
replace quality3 = 1 if respondent_serial == 4 //Q50 junk count=15
replace quality3 = 1 if respondent_serial == 4763 //Q50 junk count=15
replace quality3 = 1 if respondent_serial == 30542 //Q50 junk count=15
replace quality3 = 1 if respondent_serial == 30656 //Q50 junk count=15
replace quality3 = 1 if respondent_serial == 35076 //Q50 junk count=15
replace quality3 = 1 if respondent_serial == 15205 //Q50 junk count=14
replace quality3 = 1 if respondent_serial == 15383 //Q50 junk count=14
replace quality3 = 1 if respondent_serial == 50284 //Q50 junk count=14
replace quality3 = 1 if respondent_serial == 62387 //Q50 junk count=13
replace quality3 = 1 if respondent_serial == 4807 //Q50 junk count=11
replace quality3 = 1 if respondent_serial == 15993 //Q50 junk count=11
replace quality3 = 1 if respondent_serial == 66008 //Q50 junk count=11
replace quality3 = 1 if respondent_serial == 14 //Q50 junk count=10
replace quality3 = 1 if respondent_serial == 4527 //Q50 junk count=10
replace quality3 = 1 if respondent_serial == 40623 //Q50 junk count=10
replace quality3 = 1 if respondent_serial == 50492 //Q50 junk count=10
replace quality3 = 1 if respondent_serial == 52957 //Q50 junk count=10
replace quality3 = 1 if respondent_serial == 54886 //Q50 junk count=10
replace quality3 = 1 if respondent_serial == 21 //Q50 junk count=9
replace quality3 = 1 if respondent_serial == 34722 //Q50 junk count=9
replace quality3 = 1 if respondent_serial == 39739 //Q50 junk count=9
replace quality3 = 1 if respondent_serial == 42582 //Q50 junk count=9
replace quality3 = 1 if respondent_serial == 5625 //Q50 junk count=8
replace quality3 = 1 if respondent_serial == 24592 //Q50 junk count=8
replace quality3 = 1 if respondent_serial == 32073 //Q50 junk count=8
replace quality3 = 1 if respondent_serial == 54419 //Q50 junk count=8
replace quality3 = 1 if respondent_serial == 52984 //Q50 junk count=7
replace quality3 = 1 if respondent_serial == 30584 //Q50 junk count=6
replace quality3 = 1 if respondent_serial == 40709 //Q50 junk count=6
replace quality3 = 1 if respondent_serial == 48197 //Q50 junk count=6
replace quality3 = 1 if respondent_serial == 60513 //Q50 junk count=6
replace quality3 = 1 if respondent_serial == 26548 //Q50 junk count=5
replace quality3 = 1 if respondent_serial == 50741 //Q50 junk count=5
replace quality3 = 1 if respondent_serial == 52727 //Q50 junk count=5
replace quality3 = 1 if respondent_serial == 851 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 4814 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 14215 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 15253 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 15639 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 15736 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 18017 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 18019 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 19044 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 26003 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 30510 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 30902 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 36311 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 37321 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 37801 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 38513 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 40191 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 50544 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 56187 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 60057 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 62306 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 62416 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 62471 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 62866 //Q50 junk count=4
replace quality3 = 1 if respondent_serial == 270 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 4973 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 26625 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 39833 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 40444 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 44923 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 46490 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 50676 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 55125 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 60363 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 60503 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 60555 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 61125 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 61302 //Q50 junk count=3
replace quality3 = 1 if respondent_serial == 62325 //Q50 junk count=3

* qa1 & qa2
replace qualitydrop = 1 if respondent_serial == 35844 & qa1 == "ASS" & qa2 == "a sexy boob"

replace quality3 = 1 if respondent_serial == 3 & qa1 == "MONEY" & qa2 == "GFGHNGFH"
replace quality3 = 1 if respondent_serial == 4488 & qa1 == "Fui" & qa2 == "Yo"
replace quality3 = 1 if respondent_serial == 4791 & qa1 == "D" & qa2 == "?"
replace quality3 = 1 if respondent_serial == 5685 & qa1 == "yes" & qa2 == "rtt"
replace quality3 = 1 if respondent_serial == 10854 & qa1 == "red" & qa2 == "what"
replace quality3 = 1 if respondent_serial == 10932 & qa1 == "qwertyuio" & qa2 == "qwertyuio"
replace quality3 = 1 if respondent_serial == 15193 & qa1 == "im him gates" & qa2 == "yessir"
replace quality3 = 1 if respondent_serial == 15736 & qa1 == "efe" & qa2 == "good"
replace quality3 = 1 if respondent_serial == 18017 & qa1 == "fdfdfsd" & qa2 == "ggfdhh"
replace quality3 = 1 if respondent_serial == 18019 & qa1 == "hf  bcby ycyt" & qa2 == "dg6h"
replace quality3 = 1 if respondent_serial == 19257 & qa1 == "uytr" & qa2 == "derftgyhj"
replace quality3 = 1 if respondent_serial == 24628 & qa1 == "j" & qa2 == "n"
replace quality3 = 1 if respondent_serial == 30507 & qa1 == "qwertyui" & qa2 == "qsdfghjklñ{"
replace quality3 = 1 if respondent_serial == 32073 & qa1 == "defe" & qa2 == "buhbuj"
replace quality3 = 1 if respondent_serial == 39737 & qa1 == "kuygnluyg" & qa2 == "mjfgbuky"
replace quality3 = 1 if respondent_serial == 44661 & qa1 == "lhhgg ghbv" & qa2 == "gjll"
replace quality3 = 1 if respondent_serial == 48197 & qa1 == "elfwfe sfsfe sje el jwfej w wj" & qa2 == "hefegfyels"
replace quality3 = 1 if respondent_serial == 50406 & qa1 == "n/a" & qa2 == "n/a"
replace quality3 = 1 if respondent_serial == 50508 & qa1 == "MNF" & qa2 == "BK"
replace quality3 = 1 if respondent_serial == 50544 & qa1 == "asfasfasda" & qa2 == "asfasd"
replace quality3 = 1 if respondent_serial == 50676 & qa1 == "cool" & qa2 == "kjkjkjkj"
replace quality3 = 1 if respondent_serial == 50741 & qa1 == "3" & qa2 == "dsadasda"
replace quality3 = 1 if respondent_serial == 52907 & qa1 == "c" & qa2 == "x"
replace quality3 = 1 if respondent_serial == 58373 & qa1 == "NA" & qa2 == "DS"
replace quality3 = 1 if respondent_serial == 5625 & qa1 == "1" & qa2 == "fkdjdsjkj"
replace quality3 = 1 if respondent_serial == 24487 & qa1 == "1" & qa2 == "na"
replace quality3 = 1 if respondent_serial == 30542 & qa1 == "4" & qa2 == "MY"
replace quality3 = 1 if respondent_serial == 36800 & qa1 == "1" & qa2 == "n/a"
replace quality3 = 1 if respondent_serial == 37614 & qa1 == "2" & qa2 == "m"
replace quality3 = 1 if respondent_serial == 30584 & qa1 == "qwe" & qa2 == "45"
replace quality3 = 1 if respondent_serial == 30761 & qa1 == "jhvhv" & qa2 == "8"
replace quality3 = 1 if respondent_serial == 30835 & qa1 == "na" & qa2 == "0"
replace quality3 = 1 if respondent_serial == 5630 & qa1 == "si" & qa2 == ""
replace quality3 = 1 if respondent_serial == 14890 & qa1 == "oj'okjinio';" & qa2 == ""
replace quality3 = 1 if respondent_serial == 18704 & qa1 == "Hey" & qa2 == ""
replace quality3 = 1 if respondent_serial == 24651 & qa1 == "n/a" & qa2 == ""
replace quality3 = 1 if respondent_serial == 52787 & qa1 == "2" & qa2 == "wdl"
replace quality3 = 1 if respondent_serial == 52894 & qa1 == "1" & qa2 == "wkd"
replace quality3 = 1 if respondent_serial == 55272 & qa1 == "jhgjhkgkh" & qa2 == ""


vlabel quality3 "Quality issue 3: OE junk in Q50 OR QA1/QA2 (both junk) OR other verbatims"
t quality3     /* 83 Consumers  */

* Quality 4: Multiselect Drinks checked at Q33 or Food checked at Q4
egen quality4 = rsum(eatingevent_occasion1_q3301-eatingevent_occasion1_q3330)
recode quality4 (1/9=0) (10/28=1)
vlabel quality4 "Quality issue 4: 10+ beverages consumed out of 28 on Occasion 1"
t quality4     /* 19 Consumers  */

egen quality5 = rsum(eatingevent_occasion1_q401-eatingevent_occasion1_q442)
t quality5
vlabel quality5 "Quality issue 5: 23+ foods consumed out 35 of on Occasion 1"
replace quality4=1 if quality5>=23     /* 1 Consumers  */
t quality4     /* 20 Consumers  */

* Quality 6: Aparicio's [NEW IN 2018] [FAKE RESTAURANT USED AS RED-HERRING] checked at Q45A
gen quality6 = inlist(1, eatingevent_occasion1_q45a_apari, eatingevent_occasion2_q45a_apari)
vlabel quality6 "Quality issue 6: Aparicio's [NEW IN 2018] [FAKE RESTAURANT USED AS RED-HERRING] checked at Q45A"
t quality6     /* 42 Consumers  */


* Quality 7: Identifying Firsters [NEW IN 2018] 
gen tot_count = 0
gen fi_count = 0

* Meals who
replace fi_count = fi_count + 1 if se3_breakfast_whom1 == 1
replace fi_count = fi_count + 1 if se3_lunch_whom1 == 1
replace fi_count = fi_count + 1 if se3_dinner_whom1 == 1
replace fi_count = fi_count + 1 if se3_late_night_whom1 == 1

replace tot_count = tot_count + 1 if se3_breakfast_whom1 != .
replace tot_count = tot_count + 1 if se3_lunch_whom1 != .
replace tot_count = tot_count + 1 if se3_dinner_whom1 != .
replace tot_count = tot_count + 1 if se3_late_night_whom1 != .

* first snack who
replace fi_count = fi_count + 1 if se3a_early_morning_meals1 == 1
replace fi_count = fi_count + 1 if se3a_morning_snack_meals1 == 1
replace fi_count = fi_count + 1 if se3a_afternoon_snack_meals1 == 1
replace fi_count = fi_count + 1 if se3a_after_dinner_meals1 == 1

replace tot_count = tot_count + 1 if se3a_early_morning_meals1 != .
replace tot_count = tot_count + 1 if se3a_morning_snack_meals1 != .
replace tot_count = tot_count + 1 if se3a_afternoon_snack_meals1 != .
replace tot_count = tot_count + 1 if se3a_after_dinner_meals1 != .

* second snack who
replace fi_count = fi_count + 1 if se3a_early_morning1_meals1 == 1
replace fi_count = fi_count + 1 if se3a_morning_snack1_meals1 == 1
replace fi_count = fi_count + 1 if se3a_afternoon_snack1_meals1 == 1
replace fi_count = fi_count + 1 if se3a_after_dinner1_meals1 == 1

replace tot_count = tot_count + 1 if se3a_early_morning1_meals1 != .
replace tot_count = tot_count + 1 if se3a_morning_snack1_meals1 != .
replace tot_count = tot_count + 1 if se3a_afternoon_snack1_meals1 != .
replace tot_count = tot_count + 1 if se3a_after_dinner1_meals1 != .

* third snack who
replace fi_count = fi_count + 1 if se3a_early_morning2_meals1 == 1
replace fi_count = fi_count + 1 if se3a_morning_snack2_meals1 == 1
replace fi_count = fi_count + 1 if se3a_afternoon_snack2_meals1 == 1
replace fi_count = fi_count + 1 if se3a_after_dinner2_meals1 == 1

replace tot_count = tot_count + 1 if se3a_early_morning2_meals1 != .
replace tot_count = tot_count + 1 if se3a_morning_snack2_meals1 != .
replace tot_count = tot_count + 1 if se3a_afternoon_snack2_meals1 != .
replace tot_count = tot_count + 1 if se3a_after_dinner2_meals1 != .

* qb0a
replace fi_count = fi_count + 1 if eatingevent_occasion1_qb0a01 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_qb0a01 == 1

replace tot_count = tot_count + 1 if eatingevent_occasion1_qb0a01 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_qb0a01 != .

* qb1a
replace fi_count = fi_count + 1 if eatingevent_occasion1_qb1a1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_qb1a1 == 1

replace tot_count = tot_count + 1 if eatingevent_occasion1_qb1a1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_qb1a1 != .

*qb1d
replace fi_count = fi_count + 1 if eatingevent_occasion1_qb1d1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_qb1d1 == 1

replace tot_count = tot_count + 1 if eatingevent_occasion1_qb1d1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_qb1d1 != .

*qb1f
replace fi_count = fi_count + 1 if eatingevent_occasion1_qb1f1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_qb1f1 == 1

replace tot_count = tot_count + 1 if eatingevent_occasion1_qb1f1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_qb1f1 != .

*qb1h
replace fi_count = fi_count + 1 if eatingevent_occasion1_qb1h1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_qb1h1 == 1

replace tot_count = tot_count + 1 if eatingevent_occasion1_qb1h1 == 1
replace tot_count = tot_count + 1 if eatingevent_occasion2_qb1h1 == 1

*qb4c
replace fi_count = fi_count + 1 if eatingevent_occasion1_qb4c01 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_qb4c01 == 1

replace tot_count = tot_count + 1 if eatingevent_occasion1_qb4c01 == 1
replace tot_count = tot_count + 1 if eatingevent_occasion2_qb4c01 == 1

* qp2a
replace fi_count = fi_count + 1 if qp2a01 == 1
replace fi_count = fi_count + 1 if qp2b01 == 1

replace tot_count = tot_count + 1 if qp2a01 == 1
replace tot_count = tot_count + 1 if qp2b01 == 1

* qp03
replace fi_count = fi_count + 1 if qp301 == 1

replace tot_count = tot_count + 1 if qp301 == 1

* qp9a
replace fi_count = fi_count + 1 if qp9a1 == 1

replace tot_count = tot_count + 1 if qp9a1 == 1

* q03 subneeds
replace fi_count = fi_count + 1 if eatingevent_occasion1_q3a01 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3a01 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q3b1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3b1 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q3c01 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3c01 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q3d01 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3d01 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q3e1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3e1 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q3f1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3f1 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q3g1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3g1 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q3h1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3h1 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q3i1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3i1 == 1


replace tot_count = tot_count + 1 if eatingevent_occasion1_q3a01 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3a01 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q3b1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3b1 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q3c01 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3c01 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q3d01 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3d01 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q3e1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3e1 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q3f1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3f1 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q3g1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3g1 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q3h1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3h1 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q3i1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3i1 != .

* foods
replace fi_count = fi_count + 1 if eatingevent_occasion1_q401 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q401 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q4e1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q4e1 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q51 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q51 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q601 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q601 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q701 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q701 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q101 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q101 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q1101 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q1101 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q1201 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q1201 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q1301 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q1301 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q1401 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q1401 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q151 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q151 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q1601 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q1601 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q1701 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q1701 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q181 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q181 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q191 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q191 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q2001 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q2001 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q2111 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q2111 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q2201 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q2201 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q251 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q251 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q261 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q261 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q2702 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q2701 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q2801 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q2801 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q2901 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q2901 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q301 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q301 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q31a_b_q31 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q31a_b_q31 == 1


replace tot_count = tot_count + 1 if eatingevent_occasion1_q401 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q401 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q4e1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q4e1 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q51 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q51 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q601 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q601 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q701 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q701 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q101 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q101 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q1101 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q1101 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q1201 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q1201 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q1301 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q1301 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q1401 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q1401 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q151 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q151 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q1601 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q1601 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q1701 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q1701 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q181 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q181 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q191 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q191 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q2001 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q2001 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q2111 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q2111 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q2201 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q2201 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q251 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q251 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q261 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q261 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q2702 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q2701 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q2801 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q2801 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q2901 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q2901 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q301 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q301 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q31a_b_q31 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q31a_b_q31 != .

* beverages
replace fi_count = fi_count + 1 if eatingevent_occasion1_q3301 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3301 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q3401 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3401 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q3501 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q3501 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q36a1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q36a1 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q36b1 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q36b1 == 1

replace fi_count = fi_count + 1 if eatingevent_occasion1_q36c01 == 1
replace fi_count = fi_count + 1 if eatingevent_occasion2_q36c01 == 1


replace tot_count = tot_count + 1 if eatingevent_occasion1_q3301 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3301 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q3401 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3401 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q3501 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q3501 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q36a1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q36a1 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q36b1 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q36b1 != .

replace tot_count = tot_count + 1 if eatingevent_occasion1_q36c01 != .
replace tot_count = tot_count + 1 if eatingevent_occasion2_q36c01 != .

gen fi_prop = fi_count / tot_count

* The following flags any respondent who selected the first option in most cases
* 'Most cases' here is being defined as more often than the mean + 2 standard deviations
* Looking at the data, 2 sd might be too conservative. 3 sd could be more appropriate--need to check in more detail
summarize fi_prop
gen firster_flag = 0
replace firster_flag = 1 if fi_prop >= r(mean) + 2 * r(sd)

gen quality7 = firster_flag


vlabel quality7 "Quality issue 7: Firster flag-Top 2.3% of Firsters"
t quality7     /* 95 Consumers  */

* Bad quality respondents to remove
egen quality_sum=rsum(quality2 quality3 quality4 quality6 quality7)
label var quality_sum "Sum of quality issues 2-4 6 7"
t quality_sum 

outsheet qualitydrop respondent_id quality_sum quality2 quality3 quality4 quality5 quality6 quality7 using "Sample IDs.txt", noquote replace

drop if qualitydrop == 1 | quality_sum > 0     /* 216 Consumers out of 3530 (6.1% of sample) */
drop qualitydrop - quality_sum
