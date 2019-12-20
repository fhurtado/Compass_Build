* Pasted from Fall Weighter.xlsx

generate marg_sex = .  //Gender
replace marg_sex = 110841066 if gender==1 //Male
replace marg_sex = 115896151 if gender==2 //Female
replace marg_sex = . if age<18 //Gen-Z
generate marg_day = .  //
replace marg_day =  15834438 if weekday==0 & gender==1 //Male, Sunday
replace marg_day =  15834438 if weekday==1 & gender==1 //Male, Monday
replace marg_day =  15834438 if weekday==2 & gender==1 //Male, Tuesday
replace marg_day =  15834438 if weekday==3 & gender==1 //Male, Wednesday
replace marg_day =  15834438 if weekday==4 & gender==1 //Male, Thursday
replace marg_day =  15834438 if weekday==5 & gender==1 //Male, Friday
replace marg_day =  15834438 if weekday==6 & gender==1 //Male, Saturday
replace marg_day =  16556593 if weekday==0 & gender==2 //Female, Sunday
replace marg_day =  16556593 if weekday==1 & gender==2 //Female, Monday
replace marg_day =  16556593 if weekday==2 & gender==2 //Female, Tuesday
replace marg_day =  16556593 if weekday==3 & gender==2 //Female, Wednesday
replace marg_day =  16556593 if weekday==4 & gender==2 //Female, Thursday
replace marg_day =  16556593 if weekday==5 & gender==2 //Female, Friday
replace marg_day =  16556593 if weekday==6 & gender==2 //Female, Saturday
replace marg_day = . if age<18 //Gen-Z
generate marg_age = .  //Age of respondent
replace marg_age =  14535284 if agegrp==1 & gender==1 //Male, 18 - 24
replace marg_age =  22425814 if agegrp==2 & gender==1 //Male, 25 - 34
replace marg_age =  20201614 if agegrp==3 & gender==1 //Male, 35 - 44
replace marg_age =  19731904 if agegrp==4 & gender==1 //Male, 45 - 54
replace marg_age =  20361090 if agegrp==5 & gender==1 //Male, 55 - 64
replace marg_age =  13585361 if agegrp==6 & gender==1 //Male, 65 - 73
replace marg_age =  14349120 if agegrp==1 & gender==2 //Female, 18 - 24
replace marg_age =  22517243 if agegrp==2 & gender==2 //Female, 25 - 34
replace marg_age =  20870067 if agegrp==3 & gender==2 //Female, 35 - 44
replace marg_age =  20623349 if agegrp==4 & gender==2 //Female, 45 - 54
replace marg_age =  21929475 if agegrp==5 & gender==2 //Female, 55 - 64
replace marg_age =  15606896 if agegrp==6 & gender==2 //Female, 65 - 73
replace marg_age = . if age<18 //Gen-Z
generate marg_race = .  //Race
replace marg_race =  86244666 if race==1 & gender==1 //Male, Caucasian
replace marg_race =  14475958 if race==2 & gender==1 //Male, African American
replace marg_race =  10120441 if race==3 & gender==1 //Male, Other
replace marg_race =  87960770 if race==1 & gender==2 //Female, Caucasian
replace marg_race =  16984236 if race==2 & gender==2 //Female, African American
replace marg_race =  10951144 if race==3 & gender==2 //Female, Other
replace marg_race = . if age<18 //Gen-Z
generate marg_hisp = .  //Hispanic
replace marg_hisp =  94408673 if hisp==0 & gender==1 //Male, Not Hispanic
replace marg_hisp =  16432393 if hisp==1 & gender==1 //Male, Hispanic/Latino
replace marg_hisp =  99499494 if hisp==0 & gender==2 //Female, Not Hispanic
replace marg_hisp =  16396657 if hisp==1 & gender==2 //Female, Hispanic/Latino
replace marg_hisp = . if age<18 //Gen-Z
generate marg_div = .  //Census Division
replace marg_div =  15990129 if division==1 & gender==1 //Male, East North Central
replace marg_div =   6317813 if division==2 & gender==1 //Male, East South Central
replace marg_div =  13865491 if division==3 & gender==1 //Male, Middle Atlantic
replace marg_div =   8484844 if division==4 & gender==1 //Male, Mountain
replace marg_div =   5204839 if division==5 & gender==1 //Male, New England
replace marg_div =  18439040 if division==6 & gender==1 //Male, Pacific
replace marg_div =  21916318 if division==7 & gender==1 //Male, South Atlantic
replace marg_div =   7247216 if division==8 & gender==1 //Male, West North Central
replace marg_div =  13375376 if division==9 & gender==1 //Male, West South Central
replace marg_div =  16467397 if division==1 & gender==2 //Female, East North Central
replace marg_div =   6759614 if division==2 & gender==2 //Female, East South Central
replace marg_div =  14636002 if division==3 & gender==2 //Female, Middle Atlantic
replace marg_div =   8669122 if division==4 & gender==2 //Female, Mountain
replace marg_div =   5502273 if division==5 & gender==2 //Female, New England
replace marg_div =  18996250 if division==6 & gender==2 //Female, Pacific
replace marg_div =  23650995 if division==7 & gender==2 //Female, South Atlantic
replace marg_div =   7350503 if division==8 & gender==2 //Female, West North Central
replace marg_div =  13863994 if division==9 & gender==2 //Female, West South Central
replace marg_div = . if age<18 //Gen-Z
generate marg_inc = .  //Income
replace marg_inc =  11416092 if income==1 & gender==1 //Male, Under $20,000
replace marg_inc =   8409102 if income==2 & gender==1 //Male, $20,000 - $29,999
replace marg_inc =  10907159 if income==3 & gender==1 //Male, $30,000 - $39,000
replace marg_inc =   7776811 if income==4 & gender==1 //Male, $40,000 - $49,999
replace marg_inc =   9158471 if income==5 & gender==1 //Male, $50,000 - $59,999
replace marg_inc =  11681121 if income==6 & gender==1 //Male, $60,000 - $74,999
replace marg_inc =  15383307 if income==7 & gender==1 //Male, $75,000 - $99,999
replace marg_inc =  18001622 if income==8 & gender==1 //Male, $100,000 - $149,999
replace marg_inc =  18107380 if income==9 & gender==1 //Male, $150,000 or more
replace marg_inc =  13695557 if income==1 & gender==2 //Female, Under $20,000
replace marg_inc =   9625270 if income==2 & gender==2 //Female, $20,000 - $29,999
replace marg_inc =  11756732 if income==3 & gender==2 //Female, $30,000 - $39,000
replace marg_inc =   8328120 if income==4 & gender==2 //Female, $40,000 - $49,999
replace marg_inc =   9323652 if income==5 & gender==2 //Female, $50,000 - $59,999
replace marg_inc =  12117795 if income==6 & gender==2 //Female, $60,000 - $74,999
replace marg_inc =  15564399 if income==7 & gender==2 //Female, $75,000 - $99,999
replace marg_inc =  17790649 if income==8 & gender==2 //Female, $100,000 - $149,999
replace marg_inc =  17693977 if income==9 & gender==2 //Female, $150,000 or more
replace marg_inc = . if age<18 //Gen-Z
generate marg_educ = .  //Education of respondent
replace marg_educ =  11015704 if educ==1 & gender==1 //Male, Less than high school
replace marg_educ =  34206660 if educ==2 & gender==1 //Male, High school graduate
replace marg_educ =  19717686 if educ==3 & gender==1 //Male, Some college
replace marg_educ =  33250222 if educ==4 & gender==1 //Male, College graduate
replace marg_educ =  12650795 if educ==5 & gender==1 //Male, Graduate school
replace marg_educ =  10052609 if educ==1 & gender==2 //Female, Less than high school
replace marg_educ =  30453793 if educ==2 & gender==2 //Female, High school graduate
replace marg_educ =  20932305 if educ==3 & gender==2 //Female, Some college
replace marg_educ =  39535862 if educ==4 & gender==2 //Female, College graduate
replace marg_educ =  14921582 if educ==5 & gender==2 //Female, Graduate school
replace marg_educ = . if age<18 //Gen-Z
generate marg_kids = .  //Number of children
replace marg_kids =  82395697 if kids2==0 & gender==1 //Male, 0
replace marg_kids =  11749150 if kids2==1 & gender==1 //Male, 1
replace marg_kids =  10881558 if kids2==2 & gender==1 //Male, 2
replace marg_kids =   5814661 if kids2==3 & gender==1 //Male, 3 +
replace marg_kids =  81125870 if kids2==0 & gender==2 //Female, 0
replace marg_kids =  14740075 if kids2==1 & gender==2 //Female, 1
replace marg_kids =  13035786 if kids2==2 & gender==2 //Female, 2
replace marg_kids =   6994420 if kids2==3 & gender==2 //Female, 3 +
replace marg_kids = . if age<18 //Gen-Z


* Since Fall 18 respondent_id is blank, copy userid
tostring userid, gen(tempid)
replace respondent_id = tempid
drop tempid
