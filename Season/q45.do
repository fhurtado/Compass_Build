***
// coding write-ins, copied from "Other recodes SEASON YR (e.g., Spring 18).xls)
//    it is called by the "recode.do" program
***
replace q45a = 1 if userid==35141 //chipotle
replace q45a = 1 if userid==35735 //domenoes
replace q45a = 1 if userid==742 //Dominos
replace q45a = 1 if userid==12205 //dominos
replace q45a = 1 if userid==35486 //Dominos
replace q45a = 1 if userid==60914 //dominos
replace q45b = 1 if userid==63165 //Panda
replace q45b = 1 if userid==61974 //papa johns
replace q45a = 1 if userid==22290 //pizza chain
replace q45a = 1 if userid==44986 //Pizza Delivery (Dominos)
replace q45b = 1 if userid==44786 //Pizza Hut
replace q45b = 1 if userid==48284 //Pizza hut
replace q45b = 1 if userid==56275 //pizza hut
replace q45b = 1 if userid==815 //pizza parlor
replace q45a = 1 if userid==42480 //pizza place
replace q45a = 1 if userid==27323 //Pizza shop
replace q45a = 1 if userid==56205 //pizza shop
replace q45a = 1 if userid==30977 //Popeyes
replace q45a = 1 if userid==61378 //Regional pizza chain restaurant
replace q45b = 8 if userid==30528 //Chinese
replace q45b = 8 if userid==30582 //Indian restaurant
replace q45a = 8 if userid==24588 //Local resturant/ Mom & Pop
replace q45a = 8 if userid==30449 //Taco Casa
replace q45a = 8 if userid==35899 //Boyne Mountain Resort
replace q45a = 8 if userid==18058 //Julio Agave Mexican Grill
replace q45b = 8 if userid==40334 //local American Legion
replace q45b = 8 if userid==10801 //the bar
replace q45a = 10 if userid==42633 //Drive through coffee bar/shop


replace q45aa_7 = 1 if userid==35141 //chipotle
replace q45ab_17 = 1 if userid==44786 //Pizza Hut
replace q45ab_17 = 1 if userid==48284 //Pizza hut
replace q45ab_17 = 1 if userid==56275 //pizza hut
replace q45aa_36 = 1 if userid==35735 //domenoes
replace q45aa_36 = 1 if userid==742 //Dominos
replace q45aa_36 = 1 if userid==12205 //dominos
replace q45aa_36 = 1 if userid==35486 //Dominos
replace q45aa_36 = 1 if userid==60914 //dominos
replace q45aa_36 = 1 if userid==44986 //Pizza Delivery (Dominos)
replace q45ab_45 = 1 if userid==63165 //Panda
replace q45ab_46 = 1 if userid==61974 //papa johns
replace q45aa_47 = 1 if userid==30977 //Popeyes


