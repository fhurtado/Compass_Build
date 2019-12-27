***
// code to prep the file from Ipsos and get it in a nice clean state
//    prior to doing all of the more significant file manipulations
//    it calls several programs, which do the work
//    note that the recodes performed as part of this step are minimal and
//    mainly address issues such as dummy coding,
//    the bulk of the transformations are done via the "reform vars.do" program
***
* grab the OTX data file
use "`otxfile'", clear

lowvar

vlabel eatingevent_occasion1_q3_pepsi_c "Just 'gotta have my ____(Oreos, Cheetos, Pepsi, etc.)'"
vlabel eatingevent_occasion2_q3_pepsi_c "Just 'gotta have my ____(Oreos, Cheetos, Pepsi, etc.)'"

vname  // generates list of variable names and labels

* write out and replace "other, please specify"
include "`dir'\other write-ins.do"

** New in 2016 Spring - Export QA1/Q2A Verbatims to identify uncareful respondents
export excel respondent_serial qa1 qa2 using "QA12.xlsx", sheet("QA12") firstrow(variables) nolabel replace
*export excel respondent_serial eatingevent_occasion1_grid_q50_v - eatingevent_occasion2grid_q50_23 using "Q50.xlsx", sheet("Q50") firstrow(variables) nolabel replace

`exit'

** New in 2016 Spring - Remove uncareful respondents
include "qcremoval.do"

* pitch variables not part of this survey
include "`dir'\drop vars.do"

* create names consistent with the questionnaire
include "`dir'\ren vars.do"

vname  // generates list of variable names and labels

* create consistent codes for dummies and a few others (e.g., 0-based values)
include "`dir'\recode vars.do"

* rearrange the variables and create any stub variables (var labels are also added)
include "`dir'\rearrange.do"

* assign labels to the coded values
include "`dir'\vallabel.do"

* label the renamed variables
include "`dir'\vlabel.do"

