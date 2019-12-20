local exit error 1     //set to break after write-ins exported to Excel; located in cleanup.do Line 26
local qcexit error 1    //set to break to determine the quality2 completion minutes (within qcremoval.do)
local dexit error 1    //set this to break after "demos from survey.txt" created
local wexit error 1    //set to break after pop weights are created (after reform vars.do)
local fexit error 1    //set to break after fin weights are created (finwgt.do line 91) so selfreportedteen.txt can be copied to Fall Weighter.xls



local otxfile "19-023533-01EatingOccasions_Fall_2019_final.dta"    //name of raw data file

* build the file
*include "..\..\Compass code\build Compass.do"
