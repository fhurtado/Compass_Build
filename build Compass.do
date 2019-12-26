***
// code to create a stacked file for one round (season) of the Compass
//   starts by calling the cleanup routines that prep the original file from Ipsos
//   then calls the reform routines that (pop weight and) stack the cleaned data
//   it also generates an SPSS friendly Stata file that's otherwise identical
//    it is called by the "build.do" program,
//    customized for a single round of the Compass
***
*Assumes current directory is in proper year and season
* that is, something like this directory

* Set the max number of variables so that Stata doesn't freak out
set maxvar 6000
* Turn off variable abbreviation so that Stata doesn't delete things it should not
set varabbrev off
set more off

* Set the year and season variables
local yyyy 2019
local sesn "Fall"

*cd "C:\Users\felipe.hurtado-ferro\Documents\HOBM\Compass 2019\Prep & Build\2019\Spring
*cd "C:\Users\felipe.hurtado-ferro\Documents\HOBM\Compass 2019\Prep & Build\2019\Summer
cd "C:\Users\felipe.hurtado-ferro\Documents\HOBM\Compass `yyyy'\Prep & Build\\`yyyy'\\`sesn'"

local dir "C:\Users\felipe.hurtado-ferro\Documents\HOBM\Compass `yyyy'\Prep & Build\Compass code"

*determine year and season from standard naming convention for "current" directory
/* tokenize `c(pwd)', parse("\/")
forvalues i=1/100 {
   local j = `i'+2
   local k = `i'+3
   local yyyy ``i''
   local sesn ``j''
   if "``k''"=="" continue, break
} */
* set up current ages of the generations based upon current year
local zy = `yyyy' - 2006   //youngest gen-z    *** 2019 ***
*local zy = `yyyy' - 2005   //youngest gen-z    *** 2018 ***
*local zy = `yyyy' - 2003   //youngest gen-z    *** 2016 ***
local zo = `yyyy' - 2001   //oldest gen-z
local my = `yyyy' - 2000   //youngest millennial
local mo = `yyyy' - 1979   //oldest millennial
local gy = `yyyy' - 1978   //youngest gen-x
local go = `yyyy' - 1965   //oldest gen-x
local by = `yyyy' - 1964   //youngest boomer
local bo = `yyyy' - 1946   //oldest boomer
local sy = `yyyy' - 1945   //youngest silent
local so = `yyyy' - 1925   //oldest silent
local gen_z     "`zy'/`zo'"
local millenial "`my'/`mo'"
local gen_x     "`gy'/`go'"
local boomer    "`by'/`bo'"
local silent    "`sy'/`so'"

mylog "build.smcl", replace

* Get the build from the season file
include "build.do"

* prep the file: drop, rename, recode, rearrange, and label vars
include "`dir'\cleanup.do"

* save the data
compress
sort userid
save "clean `yyyy' `sesn' Compass.dta", replace
describe, short

* Create the files needed for weighting and stop once done


* restructure the file and generate all the new vars
include "`dir'\reform vars.do"

*`wexit' //set this to break before the finwgt control margins are determined

* last step is to weight the valid completes by occasion incidence
include "`dir'\finwgt.do"


* save the final stacked and weighted file, including an SPSS readable file
if "`sesn'"=="Spring" gen season = 1
if "`sesn'"=="Summer" gen season = 2
if "`sesn'"=="Fall"   gen season = 3
move season year
vlabel season "Survey season"
label val season SEASON

compress
sort userid piece
save "..\stacked and weighted `yyyy' `sesn' Compass.dta", replace
describe, short

*vname using "Compass 3.0 codebook.txt", cbook val

*
* create a file for export to SPSS
replace time_entered = (time_entered - tc(14oct1582 00:00)) / 1000
replace time_completed = (time_completed - tc(14oct1582 00:00)) / 1000
format time_entered time_completed %22.2g

saveold "to SPSS\stacked and weighted `yyyy' `sesn' Compass.dta", replace
quietly vname using "to SPSS\vnames.txt"

* retrieve the non-export version, in case we want to do something
use "..\stacked and weighted `yyyy' `sesn' Compass.dta", clear


log close
