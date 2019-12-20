***
// code to construct the who, when, where dimensions as well as event (3-variable occasion) codes
//    it is called by the "transforms.do" program,
//    which is called by the "reform vars.do" program
***
* 
gen who = 0
move who qb0
vlabel who "Composition of eating occasion"

replace who = 1 if inlist(occ2var, 1, 2, 3, 4, 5) & se3_a_1==1
replace who = 1 if inlist(occ2var, 6, 7, 8, 9,10) & se3_b_1==1
replace who = 1 if inlist(occ2var,11,12,13,14,15) & se3_c_1==1
replace who = 1 if inlist(occ2var,16,17,18,19,20) & se3_d_1==1
replace who = 1 if inlist(occ2var,21,22,23,24,25) & se3_e_1==1
replace who = 1 if inlist(occ2var,26,27,28,29,30) & se3_f_1==1
replace who = 1 if inlist(occ2var,31,32,33,34,35) & se3_g_1==1
replace who = 1 if inlist(occ2var,36,37,38,39,40) & se3_h_1==1
replace who = 2 if inlist(occ2var, 1, 2, 3, 4, 5) & (se3_a_2==1 & !inlist(1,se3_a_3,se3_a_4,se3_a_5))
replace who = 2 if inlist(occ2var, 6, 7, 8, 9,10) & (se3_b_2==1 & !inlist(1,se3_b_3,se3_b_4,se3_b_5))
replace who = 2 if inlist(occ2var,11,12,13,14,15) & (se3_c_2==1 & !inlist(1,se3_c_3,se3_c_4,se3_c_5))
replace who = 2 if inlist(occ2var,16,17,18,19,20) & (se3_d_2==1 & !inlist(1,se3_d_3,se3_d_4,se3_d_5))
replace who = 2 if inlist(occ2var,21,22,23,24,25) & (se3_e_2==1 & !inlist(1,se3_e_3,se3_e_4,se3_e_5))
replace who = 2 if inlist(occ2var,26,27,28,29,30) & (se3_f_2==1 & !inlist(1,se3_f_3,se3_f_4,se3_f_5))
replace who = 2 if inlist(occ2var,31,32,33,34,35) & (se3_g_2==1 & !inlist(1,se3_g_3,se3_g_4,se3_g_5))
replace who = 2 if inlist(occ2var,36,37,38,39,40) & (se3_h_2==1 & !inlist(1,se3_h_3,se3_h_4,se3_h_5))
replace who = 3 if inlist(occ2var, 1, 2, 3, 4, 5) & (se3_a_3==1 | (se3_a_5==1 & se3_a_4!=1))
replace who = 3 if inlist(occ2var, 6, 7, 8, 9,10) & (se3_b_3==1 | (se3_b_5==1 & se3_b_4!=1))
replace who = 3 if inlist(occ2var,11,12,13,14,15) & (se3_c_3==1 | (se3_c_5==1 & se3_c_4!=1))
replace who = 3 if inlist(occ2var,16,17,18,19,20) & (se3_d_3==1 | (se3_d_5==1 & se3_d_4!=1))
replace who = 3 if inlist(occ2var,21,22,23,24,25) & (se3_e_3==1 | (se3_e_5==1 & se3_e_4!=1))
replace who = 3 if inlist(occ2var,26,27,28,29,30) & (se3_f_3==1 | (se3_f_5==1 & se3_f_4!=1))
replace who = 3 if inlist(occ2var,31,32,33,34,35) & (se3_g_3==1 | (se3_g_5==1 & se3_g_4!=1))
replace who = 3 if inlist(occ2var,36,37,38,39,40) & (se3_h_3==1 | (se3_h_5==1 & se3_h_4!=1))
replace who = 4 if inlist(occ2var, 1, 2, 3, 4, 5) & (se3_a_4==1 & se3_a_3!=1)
replace who = 4 if inlist(occ2var, 6, 7, 8, 9,10) & (se3_b_4==1 & se3_b_3!=1)
replace who = 4 if inlist(occ2var,11,12,13,14,15) & (se3_c_4==1 & se3_c_3!=1)
replace who = 4 if inlist(occ2var,16,17,18,19,20) & (se3_d_4==1 & se3_d_3!=1)
replace who = 4 if inlist(occ2var,21,22,23,24,25) & (se3_e_4==1 & se3_e_3!=1)
replace who = 4 if inlist(occ2var,26,27,28,29,30) & (se3_f_4==1 & se3_f_3!=1)
replace who = 4 if inlist(occ2var,31,32,33,34,35) & (se3_g_4==1 & se3_g_3!=1)
replace who = 4 if inlist(occ2var,36,37,38,39,40) & (se3_h_4==1 & se3_h_3!=1)
replace who = 5 if inlist(occ2var,5,10,15,20,25,30,35,40) 

recode occ2var (1/5=1) (6/10=2) (11/15=3) (16/20=4) (21/25=5) (26/30=6) (31/35=7) (36/40=8), gen(when)
move when qb0
vlabel when "Daypart of eating occasion"

gen where = 0
move where qb0
vlabel where "Location of eating occasion"
replace where = 1 if (adult | selfreportedteen | p1==1)  & when==1 & se2_a==1
replace where = 1 if (adult | selfreportedteen | p1==1)  & when==2 & se2_b==1
replace where = 1 if (adult | selfreportedteen | p1==1)  & when==3 & se2_c==1
replace where = 1 if (adult | selfreportedteen | p1==1)  & when==4 & se2_d==1
replace where = 1 if (adult | selfreportedteen | p1==1)  & when==5 & se2_e==1
replace where = 1 if (adult | selfreportedteen | p1==1)  & when==6 & se2_f==1
replace where = 1 if (adult | selfreportedteen | p1==1)  & when==7 & se2_g==1
replace where = 1 if (adult | selfreportedteen | p1==1)  & when==8 & se2_h==1
replace where = 2 if (adult | selfreportedteen | p1==1)  & when==1 & se2_a==2
replace where = 2 if (adult | selfreportedteen | p1==1)  & when==2 & se2_b==2
replace where = 2 if (adult | selfreportedteen | p1==1)  & when==3 & se2_c==2
replace where = 2 if (adult | selfreportedteen | p1==1)  & when==4 & se2_d==2
replace where = 2 if (adult | selfreportedteen | p1==1)  & when==5 & se2_e==2
replace where = 2 if (adult | selfreportedteen | p1==1)  & when==6 & se2_f==2
replace where = 2 if (adult | selfreportedteen | p1==1)  & when==7 & se2_g==2
replace where = 2 if (adult | selfreportedteen | p1==1)  & when==8 & se2_h==2
replace where = 3 if (adult | selfreportedteen | p1==1)  & when==1 & se2_a==3
replace where = 3 if (adult | selfreportedteen | p1==1)  & when==2 & se2_b==3
replace where = 3 if (adult | selfreportedteen | p1==1)  & when==3 & se2_c==3
replace where = 3 if (adult | selfreportedteen | p1==1)  & when==4 & se2_d==3
replace where = 3 if (adult | selfreportedteen | p1==1)  & when==5 & se2_e==3
replace where = 3 if (adult | selfreportedteen | p1==1)  & when==6 & se2_f==3
replace where = 3 if (adult | selfreportedteen | p1==1)  & when==7 & se2_g==3
replace where = 3 if (adult | selfreportedteen | p1==1)  & when==8 & se2_h==3
replace where = 4 if (adult | selfreportedteen | p1==1)  & when==1 & inlist(se2_a,4,5,6)
replace where = 4 if (adult | selfreportedteen | p1==1)  & when==2 & inlist(se2_b,4,5,6)
replace where = 4 if (adult | selfreportedteen | p1==1)  & when==3 & inlist(se2_c,4,5,6)
replace where = 4 if (adult | selfreportedteen | p1==1)  & when==4 & inlist(se2_d,4,5,6)
replace where = 4 if (adult | selfreportedteen | p1==1)  & when==5 & inlist(se2_e,4,5,6)
replace where = 4 if (adult | selfreportedteen | p1==1)  & when==6 & inlist(se2_f,4,5,6)
replace where = 4 if (adult | selfreportedteen | p1==1)  & when==7 & inlist(se2_g,4,5,6)
replace where = 4 if (adult | selfreportedteen | p1==1)  & when==8 & inlist(se2_h,4,5,6)
replace where = 1 if kidocc & when==1 & se6_a==1
replace where = 1 if kidocc & when==2 & se6_b==1
replace where = 1 if kidocc & when==3 & se6_c==1
replace where = 1 if kidocc & when==4 & se6_d==1
replace where = 1 if kidocc & when==5 & se6_e==1
replace where = 1 if kidocc & when==6 & se6_f==1
replace where = 1 if kidocc & when==7 & se6_g==1
replace where = 1 if kidocc & when==8 & se6_h==1
replace where = 2 if kidocc & when==1 & se6_a==2
replace where = 2 if kidocc & when==2 & se6_b==2
replace where = 2 if kidocc & when==3 & se6_c==2
replace where = 2 if kidocc & when==4 & se6_d==2
replace where = 2 if kidocc & when==5 & se6_e==2
replace where = 2 if kidocc & when==6 & se6_f==2
replace where = 2 if kidocc & when==7 & se6_g==2
replace where = 2 if kidocc & when==8 & se6_h==2
replace where = 3 if kidocc & when==1 & se6_a==3
replace where = 3 if kidocc & when==2 & se6_b==3
replace where = 3 if kidocc & when==3 & se6_c==3
replace where = 3 if kidocc & when==4 & se6_d==3
replace where = 3 if kidocc & when==5 & se6_e==3
replace where = 3 if kidocc & when==6 & se6_f==3
replace where = 3 if kidocc & when==7 & se6_g==3
replace where = 3 if kidocc & when==8 & se6_h==3
replace where = 4 if kidocc & when==1 & inlist(se6_a,4,5,6)
replace where = 4 if kidocc & when==2 & inlist(se6_b,4,5,6)
replace where = 4 if kidocc & when==3 & inlist(se6_c,4,5,6)
replace where = 4 if kidocc & when==4 & inlist(se6_d,4,5,6)
replace where = 4 if kidocc & when==5 & inlist(se6_e,4,5,6)
replace where = 4 if kidocc & when==6 & inlist(se6_f,4,5,6)
replace where = 4 if kidocc & when==7 & inlist(se6_g,4,5,6)
replace where = 4 if kidocc & when==8 & inlist(se6_h,4,5,6)

* use QB2 series to refine where
replace where = 4 if inlist(qb2c, 6, 7)
replace where = 2 if inlist(qb2f, 4, 5)
replace where = 3 if qb2g<7 & qb2g!=4
replace where = 3 if inlist(qb2i,1, 4, 5)
replace where = 3 if inlist(qb2i,2, 7, 8, 9) & !q43_1 & !q43_5

* drop missing occ2var spec respondents
drop if occ2var>=.
drop if who==0
drop if when==0
drop if where==0

label val who WHO
label val when WHEN
label val where WHERE

* the original event var was not complete; we create a code for all possible combinations
/*
gen event = .
vlabel event "Eating occasion event"
move event occ2var
local i 0
forvalues who=1/5 {
   forvalues when=1/8 {
      forvalues where=1/4 {

         replace event = `++i' if who==`who' & when==`when' & where==`where'

         if `where'==1 local wherelabel "at home"
         else          local wherelabel = lower("`:label (where) `where''")

         if `who'!=5 {
            local wholabel = lower("`:label (who) `who''")
            if `who'==2          local wholabel "with significant other"
            if inlist(`who',3,4) local wholabel "with `wholabel'"

            label define EVENT `i' "`:label (when) `when'' `wherelabel' `wholabel'", modify
         }
         else {  //label kid occasions a little differently
            local whenlabel = lower("`:label (when) `when''")
            if `where'==2 local wherelabel "at school"
            label define EVENT `i' "Kid's `whenlabel' `wherelabel'", modify
         }
      }
   }
}
label val event EVENT
*/
