***
// code to write out all of the important "other, please specify" vars
//    these are then hand coded into valid values wherever possible
//    using an Excel file that autogenerates the proper Stata code,
//    which is then executed later by the "recode vars.do" program
//    it is called by the "cleanup.do" program
***
* recover "other" write-ins where possible
export excel respondent_serial qp4_others using "Other write-ins.xlsx" if qp4==42, sheet("QP04") firstrow(variables) nolabel replace
* recover "other" in channel question
forvalues i=1/2 {  //add some channels that weren't originally coded
   local a = char(`i'+96)
   gen q44`a'_10 = 0 if eatingevent_occasion`i'_q4419<.
   gen q44`a'_11 = 0 if eatingevent_occasion`i'_q4419<.
}
preserve
keep if eatingevent_occasion1_q4419==1
local rows = _N
local cell = "A"+string(`rows'+1)
if `rows' {
   ren eatingevent_occasion1_q44_others q44_9_text
   gen q44_9_lab = "q44a_"
   export excel respondent_serial q44_9_lab q44_9_text using "Other write-ins.xlsx", sheet("Q44") sheetmodify nolabel firstrow(variables)
}
restore, preserve
keep if eatingevent_occasion2_q4419==1
local rows = _N
if `rows' {
   ren eatingevent_occasion2_q44_others q44_9_text
   gen q44_9_lab = "q44b_"
   export excel respondent_serial q44_9_lab q44_9_text using "Other write-ins.xlsx", sheet("Q44") sheetmodify nolabel cell(`cell')
}
restore, preserve
keep if eatingevent_occasion1_q45==11
local rows = _N
local cell = "A"+string(`rows'+1)
if `rows' {
   ren eatingevent_occasion1_q45_someot q45_text
   gen q45_lab = "q45a"
   export excel respondent_serial q45_lab q45_text using "Other write-ins.xlsx", sheet("Q45") sheetmodify nolabel firstrow(variables)
}
restore, preserve
keep if eatingevent_occasion2_q45==11
local rows = _N
if `rows' {
   ren eatingevent_occasion2_q45_someot q45_text
   gen q45_lab = "q45b"
   export excel respondent_serial q45_lab q45_text using "Other write-ins.xlsx", sheet("Q45") sheetmodify nolabel cell(`cell')
}
restore

* cleanup OTX's messed up database for where on snacking occasions
local m1 breakfast_meals
local m2 lunch_meals
local m3 dinner_meals
local m4 late_night_meals
local o1 early_morning
local o2 morning_snack
local o3 afternoon_snack
local o4 after_dinner
forvalues i=2(4)6 {

   local s "se`i'a"
   forvalues n=1/4 {
      local s_b = "se`i'_" + char(`n'*2+96)
      ren se`i'_`m`n'' `s_b'
      ren se`i'_`n' `s_b'_text
      local so `s'_`o`n''
      capture confirm numeric var `so'_meals, exact
      if _rc continue
      local s_a = "se`i'_"+char(`n'*2+95)
      local sl `s'loop_`o`n''
      ren `so'_meals `s_a'
      ren `sl'_`s'_`n' `s_a'_text
      forvalues j=1/2 {
         replace `s_a' = `so'`j'_meals if `s_a'>=.
         drop `so'`j'_meals
         replace `s_a'_text = `sl'`j'_`s'_`n' if `s_a'_text==""
         drop `sl'`j'_`s'_`n'
      }
   }

   preserve

   local r`i' 1
   forvalues n=97/104 {
      local a = char(`n')

      restore, preserve
      ren se`i'_`a'_text se`i'_text
      keep if se`i'_`a'==7
      local rows = _N
      if `rows' {
         keep respondent_serial se`i'_text
         gen se`i'_lab = "se`i'_`a'"
         if `r`i''==1 {
            export excel respondent_serial se`i'_lab se`i'_text using "Other write-ins.xlsx", sheet("se`i'") sheetmodify nolabel firstrow(variables)
         }
         else {
            export excel respondent_serial se`i'_lab se`i'_text using "Other write-ins.xlsx", sheet("se`i'") sheetmodify nolabel cell(A`r`i'')
         }
         local r`i' = `r`i'' + `rows'
      }

   }

   restore
}

