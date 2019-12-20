***
// code to do all the basic recoding of variables to match what we might expect as a user
//    it is called by the initial cleanup program
***
* recover the "other" write-ins where possible
include "qp04.do"
include "q44.do"
include "q45.do"
include "se2.do"
include "se6.do"

* New in 2018, use us09kid because dchild_1 is blank in Summer/Fall *
* identify the child used for the kid occasions
gen agekid = dchild_1
gen girl = dchild_1
forvalues i=1/18 {
   replace girl = 0 if dchild_`i'==1
   replace agekid = `i'-1 if dchild_`i'==1
}
forvalues i=19/36 {
   replace girl = 1 if dchild_`i'==1
   replace agekid = `i'-19 if dchild_`i'==1
}

*sd3a_1-sd3a_18 
*sd3b_1-sd3b_18

*gen agekid = dchild_1
*gen girl = dchild_1
*forvalues i=1/18 {
*   replace girl = 0 if dchild_`i'==1
*   replace agekid = `i'-1 if dchild_`i'==1
*}
*forvalues i=19/36 {
*   replace girl = 1 if dchild_`i'==1
*   replace agekid = `i'-19 if dchild_`i'==1
*}
*
*t agekid
*t girl

* New in 2018, use us09kid because kids2 is blank in Summer/Fall *
* identify number of children
*recode kids01 (0=0) (1=1) (2=2) (3/max=3), g(kids2)
recode us09kid (0=0) (1=1) (2=2) (3=3) (4/max=4), g(kids2)
replace kids2 = kids2 - 1
vlabel kids2 "How many children under the age of 18 live in your household"
t us09kid kids2

* 2017 dkids01_*_dkids01_yob year coded differently than 2016. Add 1995
forvalues i=1/12 {
   replace dkids01_`i'_dkids01_yob = dkids01_`i'_dkids01_yob+1995
}

* combine separate responses into a single variable
gen qp02 = qp02_2 + qp02_1 + (qp02_1 & !qp02_2)


* cleanup OTX's messed up database for who and where on snacking occasions
*forvalues i=2(4)6 {
*   foreach l in a c e g {
*      capture confirm numeric var se`i'_`l', exact
*      if _rc continue
*      replace se`i'_`l' = se`i'_second_`l' if se`i'_`l'>=.
*      replace se`i'_`l' = se`i'_last_`l'   if se`i'_`l'>=.
*      drop se`i'_second_`l' se`i'_last_`l'
*      replace se`i'_`l'_text = se`i'_second_`l'_text if se`i'_`l'_text==""
*      replace se`i'_`l'_text = se`i'_last_`l'_text   if se`i'_`l'_text==""
*      drop se`i'_second_`l'_text se`i'_last_`l'_text
*   }
*}
foreach l in a c e g {
   forvalues j=1/5 {
      capture confirm numeric var se3_`l'_`j', exact
      if _rc continue, break
      replace se3_`l'_`j' = se3_second_`l'_`j' if se3_`l'_`j'>=.
      replace se3_`l'_`j' = se3_last_`l'_`j'   if se3_`l'_`j'>=.
      drop se3_second_`l'_`j' se3_last_`l'_`j'
   }
}

* fix some codes for dummy variables, coded 1=yes, 2=no
foreach v of varlist sd2 sd2a sd2b se5a_? qb4b? q04a? q32? q42?_? {
   replace `v' = 2 - `v'
}
replace sd2 = sd2==1

* fix code for 0-based values coded as 1-based
* 101117 RH: Not Applicable in 2016 since variables coded properly
* 111717 RH: Applicable in 2017 since variables not coded properly
foreach v of varlist us09kid q01?_? {
   replace `v' = `v' - 1
}

* recover missing snack counts for adults and kids
forvalues i=1(2)8 {
   local a = char(`i'+96)
   forvalues j=1(4)5 {
      if `j'==1 local q 1a
      else      local q 5b
      recode se`q'_`a' (0=1) (.=0) (5/max=5), gen(se`q'_`i')
      recode se`q'_`a' (0=1)
      replace se`q'_`i' = 1 if se`q'_`i'==0 & se`j'_`a'==1
      vlabel se`q'_`i', from(se`q'_`a')
   }
}

* !@#%#  OTX created some "new" codes for quota management, which we have to recode back
recode event_a event_b (41=26) (42=27) (43=28) (44=29) (45=30)

* recover some missings
replace qb1ca = 0 if qb1ca==.
replace qb1ea = 0 if qb1ea==.
replace qb1ga = 0 if qb1ga==.
replace qb1cb = 0 if qb1cb==.
replace qb1eb = 0 if qb1eb==.
replace qb1gb = 0 if qb1gb==.

* Now we do the foods
* recover missings as "No" to make base for %s the total sample
foreach l in a b {
   forvalues j=1/43 {
      capture confirm numeric var q04`l'_`j'
      if !_rc replace q04`l'_`j' = 0 if q04`l'_`j'>=.
   }
   forvalues j=1/6 {
      capture confirm numeric var q04e`l'_`j'
      if !_rc replace q04e`l'_`j' = 0 if q04e`l'_`j'>=.
   }
   forvalues i=5/8 {
      forvalues j=1/25 {
         capture confirm numeric var q0`i'`l'_`j'
         if !_rc replace q0`i'`l'_`j' = 0 if q0`i'`l'_`j'>=.
      }
   }
   forvalues i=10/35 {
      forvalues j=1/50 {
         capture confirm numeric var q`i'`l'_`j'
         if !_rc replace q`i'`l'_`j' = 0 if q`i'`l'_`j'>=.
      }
   }
   replace q23`l' = 0 if q23`l'>=.
   forvalues j=1/13 {
      capture confirm numeric var q33c`l'_`j'
      if !_rc replace q33c`l'_`j' = 0 if q33c`l'_`j'>=.
   }
   foreach a in a b c e {
      forvalues j=1/15 {
         capture confirm numeric var q36`a'`l'_`j'
         if !_rc replace q36`a'`l'_`j' = 0 if q36`a'`l'_`j'>=.
      }
   }
}

* New in 2019: Q45E recode "0" to missing (.) because only asked 2016-2017 *
foreach l in a b {
   forvalues j=1/13 {
      capture confirm numeric var q45e`l'_`j'
      if !_rc replace q45e`l'_`j' = .
   }
}
