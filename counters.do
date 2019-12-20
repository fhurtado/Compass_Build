***
// code to construct counters
//    it is called by the "transforms.do" program,
//    which is called by the "reform vars.do" program
***
* higher level counts for weighting against occ2var
gen byte count_1  = ((se1_a==1) & (se3_a_1==1))
gen byte count_2  = ((se1_a==1) & (se3_a_2==1 & !inlist(1,se3_a_3,se3_a_4,se3_a_5)))
gen byte count_3  = ((se1_a==1) & (se3_a_3==1 | (se3_a_5==1 & se3_a_4!=1)))
gen byte count_4  = ((se1_a==1) & (se3_a_4==1 & se3_a_3!=1))
gen byte count_5  = ((se5_a==1))
gen byte count_6  = ((se1_b==1) & (se3_b_1==1))
gen byte count_7  = ((se1_b==1) & (se3_b_2==1 & !inlist(1,se3_b_3,se3_b_4,se3_b_5)))
gen byte count_8  = ((se1_b==1) & (se3_b_3==1 | (se3_b_5==1 & se3_b_4!=1)))
gen byte count_9  = ((se1_b==1) & (se3_b_4==1 & se3_b_3!=1))
gen byte count_10 = ((se5_b==1))
gen byte count_11  = ((se1_c==1) & (se3_c_1==1))
gen byte count_12  = ((se1_c==1) & (se3_c_2==1 & !inlist(1,se3_c_3,se3_c_4,se3_c_5)))
gen byte count_13  = ((se1_c==1) & (se3_c_3==1 | (se3_c_5==1 & se3_c_4!=1)))
gen byte count_14  = ((se1_c==1) & (se3_c_4==1 & se3_c_3!=1))
gen byte count_15  = ((se5_c==1))
gen byte count_16  = ((se1_d==1) & (se3_d_1==1))
gen byte count_17  = ((se1_d==1) & (se3_d_2==1 & !inlist(1,se3_d_3,se3_d_4,se3_d_5)))
gen byte count_18  = ((se1_d==1) & (se3_d_3==1 | (se3_d_5==1 & se3_d_4!=1)))
gen byte count_19  = ((se1_d==1) & (se3_d_4==1 & se3_d_3!=1))
gen byte count_20 = ((se5_d==1))
gen byte count_21  = ((se1_e==1) & (se3_e_1==1))
gen byte count_22  = ((se1_e==1) & (se3_e_2==1 & !inlist(1,se3_e_3,se3_e_4,se3_e_5)))
gen byte count_23  = ((se1_e==1) & (se3_e_3==1 | (se3_e_5==1 & se3_e_4!=1)))
gen byte count_24  = ((se1_e==1) & (se3_e_4==1 & se3_e_3!=1))
gen byte count_25  = ((se5_e==1))
gen byte count_26  = ((se1_f==1) & (se3_f_1==1))
gen byte count_27  = ((se1_f==1) & (se3_f_2==1 & !inlist(1,se3_f_3,se3_f_4,se3_f_5)))
gen byte count_28  = ((se1_f==1) & (se3_f_3==1 | (se3_f_5==1 & se3_f_4!=1)))
gen byte count_29  = ((se1_f==1) & (se3_f_4==1 & se3_f_3!=1))
gen byte count_30 = ((se5_f==1))
gen byte count_31  = ((se1_g==1) & (se3_g_1==1))
gen byte count_32  = ((se1_g==1) & (se3_g_2==1 & !inlist(1,se3_g_3,se3_g_4,se3_g_5)))
gen byte count_33  = ((se1_g==1) & (se3_g_3==1 | (se3_g_5==1 & se3_g_4!=1)))
gen byte count_34  = ((se1_g==1) & (se3_g_4==1 & se3_g_3!=1))
gen byte count_35  = ((se5_g==1))
gen byte count_36  = ((se1_h==1) & (se3_h_1==1))
gen byte count_37  = ((se1_h==1) & (se3_h_2==1 & !inlist(1,se3_h_3,se3_h_4,se3_h_5)))
gen byte count_38  = ((se1_h==1) & (se3_h_3==1 | (se3_h_5==1 & se3_h_4!=1)))
gen byte count_39  = ((se1_h==1) & (se3_h_4==1 & se3_h_3!=1))
gen byte count_40 = ((se5_h==1))
forvalues i=1/40 {
   capture confirm numeric var count_`i'
   if !_rc {
      vlabel count_`i' "`:label (occ2var) `i''"
      label val count_`i' YESNO
      move count_`i' se1
   }
}

* New in 2018
* Teen count variables
clonevar count_teen_2 = count_2
replace count_teen_2 = 1 if count_4==1

clonevar count_teen_7 = count_7
replace count_teen_7 = 1 if count_9==1

clonevar count_teen_12 = count_12
replace count_teen_12 = 1 if count_14==1

clonevar count_teen_17 = count_17
replace count_teen_17 = 1 if count_19==1

clonevar count_teen_22 = count_22
replace count_teen_22 = 1 if count_24==1

clonevar count_teen_27 = count_27
replace count_teen_27 = 1 if count_29==1

clonevar count_teen_32 = count_32
replace count_teen_32 = 1 if count_34==1

clonevar count_teen_37 = count_37
replace count_teen_37 = 1 if count_39==1

vlabel count_teen_2 "Early morning snack with significant other/friends"
vlabel count_teen_7 "Breakfast with significant other/friends"
vlabel count_teen_12 "Morning snack with significant other/friends"
vlabel count_teen_17 "Lunch with significant other/friends"
vlabel count_teen_22 "Afternoon snack with significant other/friends"
vlabel count_teen_27 "Dinner with significant other/friends"
vlabel count_teen_32 "After dinner snack with significant other/friends"
vlabel count_teen_37 "Late night meal with significant other/friends"

foreach var of varlist count_teen_2 - count_teen_37 {
   move `var' se1
}


* 010918 Create agegrp2 to for weighing purposes (bring down weight of Boomers)
*age - Age max 72 in 2018
recode age (13/17=0 "13 - 17") (18/29=1 "18 - 29") (30/44=2 "30 - 44") (45/59=3 "45 - 59") (60/73=4 "60 - 73"), gen(agegrp2) label(AGEGRP2)
vlabel agegrp2 "Age"

gen occasion = (kidocc & selfreportedteen==0) + 2*selfreportedteen + 3*adult
vlabel occasion "Who had occasion"
label define OCCASION 1 "Child 0-17 (Parent reported)" 2 "Teen 13-17 (Self)" 3 "Adult", replace
label val occasion OCCASION


* 2012-2015 *
*egen kids = rsum(sd3a_1-sd3a_18 sd3b_1-sd3b_18)
* 2016-2017 *
*gen kids = (dkids01_1_dkids01_yob!=. & dkids01_1_dkids01_rel==1) + (dkids01_2_dkids01_yob!=. & dkids01_2_dkids01_rel==1) + (dkids01_3_dkids01_yob!=. & dkids01_3_dkids01_rel==1) + (dkids01_4_dkids01_yob!=. & dkids01_4_dkids01_rel==1) + (dkids01_5_dkids01_yob!=. & dkids01_5_dkids01_rel==1) + (dkids01_6_dkids01_yob!=. & dkids01_6_dkids01_rel==1) + (dkids01_7_dkids01_yob!=. & dkids01_7_dkids01_rel==1) + (dkids01_8_dkids01_yob!=. & dkids01_8_dkids01_rel==1) + (dkids01_9_dkids01_yob!=. & dkids01_9_dkids01_rel==1) + (dkids01_10_dkids01_yob!=. & dkids01_10_dkids01_rel==1) + (dkids01_11_dkids01_yob!=. & dkids01_11_dkids01_rel==1) + (dkids01_12_dkids01_yob!=. & dkids01_12_dkids01_rel==1) 
*replace kids = sum sd2c* but no adults, if self reporting teen

* New in 2018 (dkids01_1_dkids01_yob missing in Summer/Fall)*
*egen kids = rsum(sd3a_1-sd3a_18 sd3b_1-sd3b_18) - Doesn't work because 1 kid=0
gen kids = us09kid


preserve
keep if piece1

forvalues i=1(2)7 {
   gen awgt`i' = popwgt * se1a_`i'
   gen kwgt`i' = popwgt * se5b_`i' * kids
}
forvalues i=2(2)8 {
   gen awgt`i' = popwgt
   gen kwgt`i' = popwgt * kids
}

keep if age>=18
pcent sd2    [fw=popwgt], inc(all)         out(counts.txt)
pcent gender [fw=popwgt], inc(all) by(sd2) out(counts.txt) app
* New in 2017: 010918 agegrp2 generation for weighing purposes (bring down weight of Boomers)
pcent agegrp2 [fw=popwgt], inc(all) by(sd2) out(counts.txt) app

pcent count_1 - count_4   [fw=awgt1], out(counts.txt) by(sd2) app
pcent count_5             [fw=kwgt1], out(counts.txt) by(sd2) app
pcent count_6 - count_9   [fw=awgt2], out(counts.txt) by(sd2) app
pcent count_10            [fw=kwgt2], out(counts.txt) by(sd2) app
pcent count_11 - count_14 [fw=awgt3], out(counts.txt) by(sd2) app
pcent count_15            [fw=kwgt3], out(counts.txt) by(sd2) app
pcent count_16 - count_19 [fw=awgt4], out(counts.txt) by(sd2) app
pcent count_20            [fw=kwgt4], out(counts.txt) by(sd2) app
pcent count_21 - count_24 [fw=awgt5], out(counts.txt) by(sd2) app
pcent count_25            [fw=kwgt5], out(counts.txt) by(sd2) app
pcent count_26 - count_29 [fw=awgt6], out(counts.txt) by(sd2) app
pcent count_30            [fw=kwgt6], out(counts.txt) by(sd2) app
pcent count_31 - count_34 [fw=awgt7], out(counts.txt) by(sd2) app
pcent count_35            [fw=kwgt7], out(counts.txt) by(sd2) app
pcent count_36 - count_39 [fw=awgt8], out(counts.txt) by(sd2) app
pcent count_40            [fw=kwgt8], out(counts.txt) by(sd2) app
restore


preserve
keep if piece1 & age<18

forvalues i=1(2)7 {
   gen kwgt`i' = popwgt * se5b_`i' * kids
   gen twgt`i' = popwgt * se1a_`i' if occasion==2
}
forvalues i=2(2)8 {
   gen kwgt`i' = popwgt * kids
   gen twgt`i' = popwgt if occasion==2
}

* New in 2018 *
pcent selfreportedteen    [fw=popwgt], inc(all)         out(counts_teen.txt)
pcent gender     		  [fw=popwgt], inc(all) by(gender) out(counts_teen.txt) app
pcent age 				  [fw=popwgt], inc(all) by(gender) out(counts_teen.txt) app
pcent race hisp 		  [fw=popwgt], inc(all) by(gender) out(counts_teen.txt) app

pcent count_1 count_teen_2 count_3    [fw=twgt1], by(gender) out(counts_teen.txt) app
pcent count_5             [fw=kwgt1], by(gender) out(counts_teen.txt) app
pcent count_6 count_teen_7 count_8    [fw=twgt2], by(gender) out(counts_teen.txt) app
pcent count_10            [fw=kwgt2], by(gender) out(counts_teen.txt) app
pcent count_11 count_teen_12 count_13 [fw=twgt3], by(gender) out(counts_teen.txt) app
pcent count_15            [fw=kwgt3], by(gender) out(counts_teen.txt) app
pcent count_16 count_teen_17 count_18 [fw=twgt4], by(gender) out(counts_teen.txt) app
pcent count_20            [fw=kwgt4], by(gender) out(counts_teen.txt) app
pcent count_21 count_teen_22 count_23 [fw=twgt5], by(gender) out(counts_teen.txt) app
pcent count_25            [fw=kwgt5], by(gender) out(counts_teen.txt) app
pcent count_26 count_teen_27 count_28 [fw=twgt6], by(gender) out(counts_teen.txt) app
pcent count_30            [fw=kwgt6], by(gender) out(counts_teen.txt) app
pcent count_31 count_teen_32 count_33 [fw=twgt7], by(gender) out(counts_teen.txt) app
pcent count_35            [fw=kwgt7], by(gender) out(counts_teen.txt) app
pcent count_36 count_teen_37 count_38 [fw=twgt8], by(gender) out(counts_teen.txt) app
pcent count_40            [fw=kwgt8], by(gender) out(counts_teen.txt) app
restore

drop kids

* counts.txt holds the 2-variable occasion margins to generate final weights

****** NO LONGER USE THESE VARIABLES
*gen byte mycount_1 = ((se1_a==1) & (inlist(se2_a,4,5,6)) & (se3_a_1==1))
*gen byte mycount_2 = ((se1_a==1) & (inlist(se2_a,1)) & (se3_a_1==1))
*gen byte mycount_3 = ((se1_a==1) & (inlist(se2_a,1)) & (se3_a_3==1 | (se3_a_5==1 & se3_a_4!=1)))
*gen byte mycount_4 = ((se1_a==1) & (inlist(se2_a,1)) & (se3_a_2==1 & !inlist(1,se3_a_3,se3_a_4,se3_a_5)))
*gen byte mycount_5 = ((se5_a==1) & (inlist(se6_a,1)))
*gen byte mycount_6 = ((se1_a==1) & (inlist(se2_a,3)) & (se3_a_1==1))
*gen byte mycount_7 = ((se1_a==1) & (inlist(se2_a,3)) & (se3_a_3==1 | (se3_a_5==1 & se3_a_4!=1)))
*gen byte mycount_8 = ((se1_a==1) & (inlist(se2_a,3)) & (se3_a_2==1 & !inlist(1,se3_a_3,se3_a_4,se3_a_5)))
*gen byte mycount_9 = ((se1_b==1) & (inlist(se2_b,4,5,6)) & (se3_b_1==1))
*gen byte mycount_10 = ((se5_b==1) & (inlist(se6_b,4,5,6)))
*gen byte mycount_11 = ((se1_b==1) & (inlist(se2_b,1)) & (se3_b_1==1))
*gen byte mycount_12 = ((se1_b==1) & (inlist(se2_b,1)) & (se3_b_3==1 | (se3_b_5==1 & se3_b_4!=1)))
*gen byte mycount_13 = ((se1_b==1) & (inlist(se2_b,1)) & (se3_b_2==1 & !inlist(1,se3_b_3,se3_b_4,se3_b_5)))
*gen byte mycount_14 = ((se1_b==1) & (inlist(se2_b,1)) & (se3_b_4==1 & se3_b_3!=1))
*gen byte mycount_15 = ((se5_b==1) & (inlist(se6_b,1)))
*gen byte mycount_16 = ((se1_b==1) & (inlist(se2_b,2)) & (se3_b_1==1))
*gen byte mycount_17 = ((se5_b==1) & (inlist(se6_b,2)))
*gen byte mycount_18 = ((se1_b==1) & (inlist(se2_b,3)) & (se3_b_1==1))
*gen byte mycount_19 = ((se1_b==1) & (inlist(se2_b,3)) & (se3_b_3==1 | (se3_b_5==1 & se3_b_4!=1)))
*gen byte mycount_20 = ((se1_b==1) & (inlist(se2_b,3)) & (se3_b_2==1 & !inlist(1,se3_b_3,se3_b_4,se3_b_5)))
*gen byte mycount_21 = ((se1_b==1) & (inlist(se2_b,3)) & (se3_b_4==1 & se3_b_3!=1))
*gen byte mycount_22 = ((se5_b==1) & (inlist(se6_b,3)))
*gen byte mycount_23 = ((se1_c==1) & (inlist(se2_c,4,5,6)) & (se3_c_1==1))
*gen byte mycount_24 = ((se5_c==1) & (inlist(se6_c,4,5,6)))
*gen byte mycount_25 = ((se1_c==1) & (inlist(se2_c,1)) & (se3_c_1==1))
*gen byte mycount_26 = ((se1_c==1) & (inlist(se2_c,1)) & (se3_c_3==1 | (se3_c_5==1 & se3_c_4!=1)))
*gen byte mycount_27 = ((se1_c==1) & (inlist(se2_c,1)) & (se3_c_2==1 & !inlist(1,se3_c_3,se3_c_4,se3_c_5)))
*gen byte mycount_28 = ((se1_c==1) & (inlist(se2_c,1)) & (se3_c_4==1 & se3_c_3!=1))
*gen byte mycount_29 = ((se5_c==1) & (inlist(se6_c,1)))
*gen byte mycount_30 = ((se1_c==1) & (inlist(se2_c,2)) & (se3_c_1==1))
*gen byte mycount_31 = ((se5_c==1) & (inlist(se6_c,2)))
*gen byte mycount_32 = ((se1_c==1) & (inlist(se2_c,3)) & (se3_c_1==1))
*gen byte mycount_33 = ((se1_c==1) & (inlist(se2_c,3)) & (se3_c_3==1 | (se3_c_5==1 & se3_c_4!=1)))
*gen byte mycount_34 = ((se1_c==1) & (inlist(se2_c,3)) & (se3_c_2==1 & !inlist(1,se3_c_3,se3_c_4,se3_c_5)))
*gen byte mycount_35 = ((se1_c==1) & (inlist(se2_c,3)) & (se3_c_4==1 & se3_c_3!=1))
*gen byte mycount_36 = ((se5_c==1) & (inlist(se6_c,3)))
*gen byte mycount_37 = ((se1_d==1) & (inlist(se2_d,4,5,6)) & (se3_d_1==1))
*gen byte mycount_38 = ((se1_d==1) & (inlist(se2_d,4,5,6)) & (se3_d_3==1 | (se3_d_5==1 & se3_d_4!=1)))
*gen byte mycount_39 = ((se1_d==1) & (inlist(se2_d,4,5,6)) & (se3_d_2==1 & !inlist(1,se3_d_3,se3_d_4,se3_d_5)))
*gen byte mycount_40 = ((se1_d==1) & (inlist(se2_d,4,5,6)) & (se3_d_4==1 & se3_d_3!=1))
*gen byte mycount_41 = ((se5_d==1) & (inlist(se6_d,4,5,6)))
*gen byte mycount_42 = ((se1_d==1) & (inlist(se2_d,1)) & (se3_d_1==1))
*gen byte mycount_43 = ((se1_d==1) & (inlist(se2_d,1)) & (se3_d_3==1 | (se3_d_5==1 & se3_d_4!=1)))
*gen byte mycount_44 = ((se1_d==1) & (inlist(se2_d,1)) & (se3_d_2==1 & !inlist(1,se3_d_3,se3_d_4,se3_d_5)))
*gen byte mycount_45 = ((se1_d==1) & (inlist(se2_d,1)) & (se3_d_4==1 & se3_d_3!=1))
*gen byte mycount_46 = ((se5_d==1) & (inlist(se6_d,1)))
*gen byte mycount_47 = ((se1_d==1) & (inlist(se2_d,2)) & (se3_d_1==1))
*gen byte mycount_48 = ((se5_d==1) & (inlist(se6_d,2)))
*gen byte mycount_49 = ((se1_d==1) & (inlist(se2_d,3)) & (se3_d_1==1))
*gen byte mycount_50 = ((se1_d==1) & (inlist(se2_d,3)) & (se3_d_3==1 | (se3_d_5==1 & se3_d_4!=1)))
*gen byte mycount_51 = ((se1_d==1) & (inlist(se2_d,3)) & (se3_d_2==1 & !inlist(1,se3_d_3,se3_d_4,se3_d_5)))
*gen byte mycount_52 = ((se1_d==1) & (inlist(se2_d,3)) & (se3_d_4==1 & se3_d_3!=1))
*gen byte mycount_53 = ((se5_d==1) & (inlist(se6_d,3)))
*gen byte mycount_54 = ((se1_e==1) & (inlist(se2_e,4,5,6)) & (se3_e_1==1))
*gen byte mycount_55 = ((se5_e==1) & (inlist(se6_e,4,5,6)))
*gen byte mycount_56 = ((se1_e==1) & (inlist(se2_e,1)) & (se3_e_1==1))
*gen byte mycount_57 = ((se1_e==1) & (inlist(se2_e,1)) & (se3_e_3==1 | (se3_e_5==1 & se3_e_4!=1)))
*gen byte mycount_58 = ((se1_e==1) & (inlist(se2_e,1)) & (se3_e_2==1 & !inlist(1,se3_e_3,se3_e_4,se3_e_5)))
*gen byte mycount_59 = ((se1_e==1) & (inlist(se2_e,1)) & (se3_e_4==1 & se3_e_3!=1))
*gen byte mycount_60 = ((se5_e==1) & (inlist(se6_e,1)))
*gen byte mycount_61 = ((se1_e==1) & (inlist(se2_e,2)) & (se3_e_1==1))
*gen byte mycount_62 = ((se5_e==1) & (inlist(se6_e,2)))
*gen byte mycount_63 = ((se1_e==1) & (inlist(se2_e,3)) & (se3_e_1==1))
*gen byte mycount_64 = ((se1_e==1) & (inlist(se2_e,3)) & (se3_e_3==1 | (se3_e_5==1 & se3_e_4!=1)))
*gen byte mycount_65 = ((se1_e==1) & (inlist(se2_e,3)) & (se3_e_2==1 & !inlist(1,se3_e_3,se3_e_4,se3_e_5)))
*gen byte mycount_66 = ((se1_e==1) & (inlist(se2_e,3)) & (se3_e_4==1 & se3_e_3!=1))
*gen byte mycount_67 = ((se5_e==1) & (inlist(se6_e,3)))
*gen byte mycount_68 = ((se1_f==1) & (inlist(se2_f,4,5,6)) & (se3_f_1==1))
*gen byte mycount_69 = ((se5_f==1) & (inlist(se6_f,4,5,6)))
*gen byte mycount_70 = ((se1_f==1) & (inlist(se2_f,1)) & (se3_f_1==1))
*gen byte mycount_71 = ((se1_f==1) & (inlist(se2_f,1)) & (se3_f_3==1 | (se3_f_5==1 & se3_f_4!=1)))
*gen byte mycount_72 = ((se1_f==1) & (inlist(se2_f,1)) & (se3_f_2==1 & !inlist(1,se3_f_3,se3_f_4,se3_f_5)))
*gen byte mycount_73 = ((se1_f==1) & (inlist(se2_f,1)) & (se3_f_4==1 & se3_f_3!=1))
*gen byte mycount_74 = ((se5_f==1) & (inlist(se6_f,1)))
*gen byte mycount_75 = ((se1_f==1) & (inlist(se2_f,3)) & (se3_f_1==1))
*gen byte mycount_76 = ((se1_f==1) & (inlist(se2_f,3)) & (se3_f_3==1 | (se3_f_5==1 & se3_f_4!=1)))
*gen byte mycount_77 = ((se1_f==1) & (inlist(se2_f,3)) & (se3_f_2==1 & !inlist(1,se3_f_3,se3_f_4,se3_f_5)))
*gen byte mycount_78 = ((se1_f==1) & (inlist(se2_f,3)) & (se3_f_4==1 & se3_f_3!=1))
*gen byte mycount_79 = ((se5_f==1) & (inlist(se6_f,3)))
*gen byte mycount_80 = ((se1_g==1) & (inlist(se2_g,4,5,6)) & (se3_g_1==1))
*gen byte mycount_81 = ((se5_g==1) & (inlist(se6_g,4,5,6)))
*gen byte mycount_82 = ((se1_g==1) & (inlist(se2_g,1)) & (se3_g_1==1))
*gen byte mycount_83 = ((se1_g==1) & (inlist(se2_g,1)) & (se3_g_3==1 | (se3_g_5==1 & se3_g_4!=1)))
*gen byte mycount_84 = ((se1_g==1) & (inlist(se2_g,1)) & (se3_g_2==1 & !inlist(1,se3_g_3,se3_g_4,se3_g_5)))
*gen byte mycount_85 = ((se1_g==1) & (inlist(se2_g,1)) & (se3_g_4==1 & se3_g_3!=1))
*gen byte mycount_86 = ((se5_g==1) & (inlist(se6_g,1)))
*gen byte mycount_87 = ((se1_g==1) & (inlist(se2_g,3)) & (se3_g_1==1))
*gen byte mycount_88 = ((se1_g==1) & (inlist(se2_g,3)) & (se3_g_3==1 | (se3_g_5==1 & se3_g_4!=1)))
*gen byte mycount_89 = ((se1_g==1) & (inlist(se2_g,3)) & (se3_g_2==1 & !inlist(1,se3_g_3,se3_g_4,se3_g_5)))
*gen byte mycount_90 = ((se1_g==1) & (inlist(se2_g,3)) & (se3_g_4==1 & se3_g_3!=1))
*gen byte mycount_91 = ((se5_g==1) & (inlist(se6_g,3)))
*gen byte mycount_92 = ((se1_h==1) & (inlist(se2_h,4,5,6)) & (se3_h_1==1))
*gen byte mycount_93 = ((se1_h==1) & (inlist(se2_h,1)) & (se3_h_1==1))
*gen byte mycount_94 = ((se1_h==1) & (inlist(se2_h,1)) & (se3_h_2==1 & !inlist(1,se3_h_3,se3_h_4,se3_h_5)))
*gen byte mycount_95 = ((se1_h==1) & (inlist(se2_h,1)) & (se3_h_4==1 & se3_h_3!=1))
*gen byte mycount_96 = ((se1_h==1) & (inlist(se2_h,3)) & (se3_h_1==1))
*gen byte mycount_97 = ((se1_h==1) & (inlist(se2_h,3)) & (se3_h_2==1 & !inlist(1,se3_h_3,se3_h_4,se3_h_5)))
*gen byte mycount_98 = ((se1_h==1) & (inlist(se2_h,3)) & (se3_h_4==1 & se3_h_3!=1))
*gen byte mycount_99 = ((se1_h==1) & (inlist(se2_h,4,5,6)) & (se3_h_2==1 & !inlist(1,se3_h_3,se3_h_4,se3_h_5)))
*gen byte mycount_100 = ((se1_h==1) & (inlist(se2_h,4,5,6)) & (se3_h_4==1 & se3_h_3!=1))
**newest additions
*gen byte mycount_101 = ((se1_a==1) & (inlist(se2_a, 2)) & (se3_a_1==1))
*gen byte mycount_102 = ((se1_b==1) & (inlist(se2_b, 2)) & (se3_b_4==1 & se3_b_3!=1))
*gen byte mycount_103 = ((se1_c==1) & (inlist(se2_c, 2)) & (se3_c_3==1 | (se3_c_5==1 & se3_c_4!=1)))
*gen byte mycount_104 = ((se1_c==1) & (inlist(se2_c, 2)) & (se3_c_4==1 & se3_c_3!=1))
*gen byte mycount_105 = ((se1_d==1) & (inlist(se2_d, 2)) & (se3_d_3==1 | (se3_d_5==1 & se3_d_4!=1)))
*gen byte mycount_106 = ((se1_d==1) & (inlist(se2_d, 2)) & (se3_d_4==1 & se3_d_3!=1))
*gen byte mycount_107 = ((se1_e==1) & (inlist(se2_e, 2)) & (se3_e_4==1 & se3_e_3!=1))
*gen byte mycount_108 = ((se1_e==1) & (inlist(se2_e, 4,5,6)) & (se3_e_3==1 | (se3_e_5==1 & se3_e_4!=1)))
*gen byte mycount_109 = ((se1_f==1) & (inlist(se2_f, 2)) & (se3_f_1==1))
*gen byte mycount_110 = ((se1_h==1) & (inlist(se2_h, 1)) & (se3_h_3==1 | (se3_h_5==1 & se3_h_4!=1)))
*forvalues i=1/110 {
*   capture confirm numeric var mycount_`i'
*   if !_rc {
*      vlabel mycount_`i' "`:label (event) `i''"
*      label val mycount_`i' YESNO
*      move mycount_`i' zip
*   }
*}
