* This is the top level file for building compass. 
*
* The first section is to be modified every season. It defines the working directories,
* the year and season, the raw data file, and the stop points. 
* The second section calls the routine 

/* Modify this part */
* Change some Stata options to make it work. Change as needed.
* Set the max number of variables so that Stata doesn't freak out
set maxvar 6000
* Turn off variable abbreviation so that Stata doesn't delete things it should not
set varabbrev off
* Turn the 'more' option off so that Stata doesn't stop while printing to screen
set more off

* Set the year and season variables
local yyyy 2019
local sesn "Fall"

* Set the directory stub
local dirstub "C:\Users\felipe.hurtado-ferro\Documents"

* Set name of raw data file
local otxfile "19-023533-01EatingOccasions_Fall_2019_final.dta"    

* This part controls the different exit switches for building steps
local exit error 1     //set to break after write-ins exported to Excel; located in cleanup.do Line 26
local qcexit error 1    //set to break to determine the quality2 completion minutes (within qcremoval.do)
local dexit error 1    //set this to break after "demos from survey.txt" created
local wexit error 1    //set to break after pop weights are created (after reform vars.do)
local fexit error 1    //set to break after fin weights are created (finwgt.do line 91) so selfreportedteen.txt can be copied to Fall Weighter.xls


/* Don't modify this part */
* Define the master directory and set working directory to the season directory
cd "`dirstub'\HOBM\Compass `yyyy'\Prep & Build\\`yyyy'\\`sesn'"
local dir "`dirstub'\HOBM\Compass `yyyy'\Prep & Build\Compass code"

* Call build Compass.do
include "`dir'\build Compass.do"