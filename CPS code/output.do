***
// code to write out the key demos used for producing popwgt
//    it is called as the last step in the "run CPS.do" program
***
* write out the weighting demos
if "MMMyyyy"=="Feb 2015" local income income2
else      local income income
* New in 2018: use kids2 instead of ownkids
*local demos agegrp race hisp division educ `income' ownkids hhsize marrstat kids
local demos agegrp race hisp division educ `income' kids2 hhsize marrstat kids
svycent pesex   if adult==1, inc(all)           out(demos from `MMMyyyy' CPS.txt)
svycent `demos' if adult==1, inc(all) by(pesex) out(demos from `MMMyyyy' CPS.txt) app
svycent adult adult2,               inc(all)           out(demos from `MMMyyyy' CPS.txt) app n("P O P U L A T I O N   C O U N T S")

* 11/16/19 Maximum age 73 in 2019
svycent agegrp4 adult2 if inlist(adult2, 1, 2),     inc(all)           		out(demos from `MMMyyyy' CPS.txt) app n("P O P U L A T I O N   C O U N T S  1 3  -  7 3")
* 12/04/17 To calculate population for 18-70 for merging with 2012-2016 datafile 
*svycent adult3 if inlist(adult3, 1, 2),     inc(all)           		out(demos from `MMMyyyy' CPS.txt) app n("P O P U L A T I O N   C O U N T S  1 3  -  7 0")

* New in 2019 *
svycent pesex prtage race hisp gereg rincome if inlist(adult2, 1),	inc(all) by(pesex)    	out(demos from `MMMyyyy' CPS.txt) app n("K I D   C O U N T S  1 3  -  1 7")

* write out the market segment sizes
svycent ses, inc(all) by(adult) out(adults X market.txt) miss
svycent ses, inc(all) by(adult) out(adults X market.txt) miss


* write out the demo calculator demos
svycent agem agef agegrp3 pesex kids hisp black inc2 educ2 gereg if 17<prtage & prtage<74, inc(all) out(demos from `MMMyyyy' CPS for quota calculator.txt)
