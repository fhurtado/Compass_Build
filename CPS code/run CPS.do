***
// code to load a raw CPS data file and output the control margins for pop weighting
***
local dir "C:\Users\felipe.hurtado-ferro\Documents\HOBM\Compass 2019\Prep & Build\CPS code"

* read the new raw CPS data
if `yyyy'<2014       include "`dir'\infile CPS.do"
else if `yyyy'==2014 include "`dir'\infile CPS 2014.do"
else                 include "`dir'\infile CPS post 2014.do"

* recode to standard groupings for weighting
if `yyyy'<2014       include "`dir'\recodes.do"
else if `yyyy'==2014 include "`dir'\recodes 2014.do"
*else                 include "`dir'\recodes post 2014.do"
else if `yyyy'==2015 | `yyyy'==2016 include "`dir'\recodes post 2014.do"

* 11/16/2018 maximum age is 72 in 2018 so adjust the maximum age at "recodes post 2016.do"
else                 include "`dir'\recodes post 2016.do"


* write out the standard demos for weighting
include "`dir'\output.do"


* save the data file
compress
save "CPS `yymm'.dta", replace

describe
