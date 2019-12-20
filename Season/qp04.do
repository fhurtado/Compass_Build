***
// coding write-ins, copied from "Other recodes SEASON YR (e.g., Spring 18).xls)
//    it is called by the "recode.do" program
***

replace qp04 = 13 if userid==18048 //Food4less
replace qp04 = 21 if userid==35260 //publix
replace qp04 = 34 if userid==64469 //Vons


