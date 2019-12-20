generate marg_sex = .  //Gender
replace marg_sex = 10776066 if gender==1 & occasion==2 // Male
replace marg_sex = 10660300 if gender==2 & occasion==2 // Female
replace marg_sex = . if occasion!=2 // Not Teen
generate marg_age = .  //Age
replace marg_age = 2111464 if age==13 & gender==1 & occasion==2 // Male, 13
replace marg_age = 2096406 if age==14 & gender==1 & occasion==2 // Male, 14
replace marg_age = 2139674 if age==15 & gender==1 & occasion==2 // Male, 15
replace marg_age = 2159016 if age==16 & gender==1 & occasion==2 // Male, 16
replace marg_age = 2269506 if age==17 & gender==1 & occasion==2 // Male, 17
replace marg_age = 2162379 if age==13 & gender==2 & occasion==2 // Female, 13
replace marg_age = 2013877 if age==14 & gender==2 & occasion==2 // Female, 14
replace marg_age = 2064921 if age==15 & gender==2 & occasion==2 // Female, 15
replace marg_age = 2212811 if age==16 & gender==2 & occasion==2 // Female, 16
replace marg_age = 2206312 if age==17 & gender==2 & occasion==2 // Female, 17
replace marg_age = . if occasion!=2 // Not Teen
generate marg_day = .  //Day of week
replace marg_day = 1539438 if weekday==0  & gender==1 & occasion==2 // Male, Sunday
replace marg_day = 1539438 if weekday==1  & gender==1 & occasion==2 // Male, Monday
replace marg_day = 1539438 if weekday==2  & gender==1 & occasion==2 // Male, Tuesday
replace marg_day = 1539438 if weekday==3  & gender==1 & occasion==2 // Male, Wednesday
replace marg_day = 1539438 if weekday==4  & gender==1 & occasion==2 // Male, Thursday
replace marg_day = 1539438 if weekday==5  & gender==1 & occasion==2 // Male, Friday
replace marg_day = 1539438 if weekday==6  & gender==1 & occasion==2 // Male, Saturday
replace marg_day = 1522900 if weekday==0  & gender==2 & occasion==2 // Female, Sunday
replace marg_day = 1522900 if weekday==1  & gender==2 & occasion==2 // Female, Monday
replace marg_day = 1522900 if weekday==2  & gender==2 & occasion==2 // Female, Tuesday
replace marg_day = 1522900 if weekday==3  & gender==2 & occasion==2 // Female, Wednesday
replace marg_day = 1522900 if weekday==4  & gender==2 & occasion==2 // Female, Thursday
replace marg_day = 1522900 if weekday==5  & gender==2 & occasion==2 // Female, Friday
replace marg_day = 1522900 if weekday==6  & gender==2 & occasion==2 // Female, Saturday
replace marg_day = . if occasion!=2 // Not Teen
generate marg_occ = .  //Teen occasions
replace marg_occ = 370554 if occ2vart==1  & gender==1 & occasion==2 // Male, Early morning snack alone
replace marg_occ = 121661 if occ2vart==2  & gender==1 & occasion==2 // Male, Early morning snack with significant other/friends
replace marg_occ = 189548 if occ2vart==3  & gender==1 & occasion==2 // Male, Early morning snack with family
replace marg_occ = 524256 if occ2vart==6  & gender==1 & occasion==2 // Male, Breakfast alone
replace marg_occ =  98683 if occ2vart==7  & gender==1 & occasion==2 // Male, Breakfast with significant other/friends
replace marg_occ = 1011881 if occ2vart==8  & gender==1 & occasion==2 // Male, Breakfast with family
replace marg_occ = 307724 if occ2vart==11 & gender==1 & occasion==2 // Male, Morning snack alone
replace marg_occ = 109920 if occ2vart==12 & gender==1 & occasion==2 // Male, Morning snack with significant other/friends
replace marg_occ = 365806 if occ2vart==13 & gender==1 & occasion==2 // Male, Morning snack with family
replace marg_occ = 331436 if occ2vart==16 & gender==1 & occasion==2 // Male, Lunch alone
replace marg_occ = 394714 if occ2vart==17 & gender==1 & occasion==2 // Male, Lunch with significant other/friends
replace marg_occ = 1129410 if occ2vart==18 & gender==1 & occasion==2 // Male, Lunch with family
replace marg_occ = 828513 if occ2vart==21 & gender==1 & occasion==2 // Male, Afternoon snack alone
replace marg_occ = 343560 if occ2vart==22 & gender==1 & occasion==2 // Male, Afternoon snack with significant other/friends
replace marg_occ = 874060 if occ2vart==23 & gender==1 & occasion==2 // Male, Afternoon snack with family
replace marg_occ = 178357 if occ2vart==26 & gender==1 & occasion==2 // Male, Dinner alone
replace marg_occ = 196214 if occ2vart==27 & gender==1 & occasion==2 // Male, Dinner with significant other/friends
replace marg_occ = 1623382 if occ2vart==28 & gender==1 & occasion==2 // Male, Dinner with family
replace marg_occ = 644138 if occ2vart==31 & gender==1 & occasion==2 // Male, After dinner snack alone
replace marg_occ =      0 if occ2vart==32 & gender==1 & occasion==2 // Male, After dinner snack with significant other/friends
replace marg_occ = 621098 if occ2vart==33 & gender==1 & occasion==2 // Male, After dinner snack with family
replace marg_occ = 277512 if occ2vart==36 & gender==1 & occasion==2 // Male, Late night meal alone
replace marg_occ =  69741 if occ2vart==37 & gender==1 & occasion==2 // Male, Late night meal with significant other/friends
replace marg_occ = 163898 if occ2vart==38 & gender==1 & occasion==2 // Male, Late night meal with family
replace marg_occ = 371927 if occ2vart==1  & gender==2 & occasion==2 // Female, Early morning snack alone
replace marg_occ = 250602 if occ2vart==2  & gender==2 & occasion==2 // Female, Early morning snack with significant other/friends
replace marg_occ = 215354 if occ2vart==3  & gender==2 & occasion==2 // Female, Early morning snack with family
replace marg_occ = 650741 if occ2vart==6  & gender==2 & occasion==2 // Female, Breakfast alone
replace marg_occ = 130725 if occ2vart==7  & gender==2 & occasion==2 // Female, Breakfast with significant other/friends
replace marg_occ = 975898 if occ2vart==8  & gender==2 & occasion==2 // Female, Breakfast with family
replace marg_occ = 285918 if occ2vart==11 & gender==2 & occasion==2 // Female, Morning snack alone
replace marg_occ = 142380 if occ2vart==12 & gender==2 & occasion==2 // Female, Morning snack with significant other/friends
replace marg_occ = 375948 if occ2vart==13 & gender==2 & occasion==2 // Female, Morning snack with family
replace marg_occ = 322832 if occ2vart==16 & gender==2 & occasion==2 // Female, Lunch alone
replace marg_occ = 420467 if occ2vart==17 & gender==2 & occasion==2 // Female, Lunch with significant other/friends
replace marg_occ = 1078852 if occ2vart==18 & gender==2 & occasion==2 // Female, Lunch with family
replace marg_occ = 601679 if occ2vart==21 & gender==2 & occasion==2 // Female, Afternoon snack alone
replace marg_occ = 168356 if occ2vart==22 & gender==2 & occasion==2 // Female, Afternoon snack with significant other/friends
replace marg_occ = 923555 if occ2vart==23 & gender==2 & occasion==2 // Female, Afternoon snack with family
replace marg_occ = 227623 if occ2vart==26 & gender==2 & occasion==2 // Female, Dinner alone
replace marg_occ = 195215 if occ2vart==27 & gender==2 & occasion==2 // Female, Dinner with significant other/friends
replace marg_occ = 1558461 if occ2vart==28 & gender==2 & occasion==2 // Female, Dinner with family
replace marg_occ = 390991 if occ2vart==31 & gender==2 & occasion==2 // Female, After dinner snack alone
replace marg_occ = 209963 if occ2vart==32 & gender==2 & occasion==2 // Female, After dinner snack with significant other/friends
replace marg_occ = 706234 if occ2vart==33 & gender==2 & occasion==2 // Female, After dinner snack with family
replace marg_occ = 270568 if occ2vart==36 & gender==2 & occasion==2 // Female, Late night meal alone
replace marg_occ =  16908 if occ2vart==37 & gender==2 & occasion==2 // Female, Late night meal with significant other/friends
replace marg_occ = 169107 if occ2vart==38 & gender==2 & occasion==2 // Female, Late night meal with family
replace marg_occ = . if occasion!=2 // Not Teen
