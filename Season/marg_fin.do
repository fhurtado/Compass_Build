generate marg_par = .  //Parenthood
replace marg_par = 162600361 if sd2==0  // Non-parent
replace marg_par = 63181272 if sd2==1  // Parent
replace marg_par = . if occasion==2 // Not Adult
generate marg_sex = .  //Gender
replace marg_sex = 81744140 if gender==1  & sd2==0 // Non-parent, Male
replace marg_sex = 80856221 if gender==2  & sd2==0 // Non-parent, Female
replace marg_sex = 28411009 if gender==1  & sd2==1 // Parent, Male
replace marg_sex = 34770263 if gender==2  & sd2==1 // Parent, Female
replace marg_sex = . if occasion==2 // Not Adult
generate marg_age = .  //Age
replace marg_age = 34559555 if agegrp2==1  & sd2==0 // Non-parent, 18 - 29
replace marg_age = 28751071 if agegrp2==2  & sd2==0 // Non-parent, 30 - 44
replace marg_age = 48079706 if agegrp2==3  & sd2==0 // Non-parent, 45 - 59
replace marg_age = 51210030 if agegrp2==4  & sd2==0 // Non-parent, 60 - 73
replace marg_age = 8337419 if agegrp2==1  & sd2==1 // Parent, 18 - 29
replace marg_age = 42602298 if agegrp2==2  & sd2==1 // Parent, 30 - 44
replace marg_age = 10822501 if agegrp2==3  & sd2==1 // Parent, 45 - 59
replace marg_age = 1419054 if agegrp2==4  & sd2==1 // Parent, 60 - 73
replace marg_age = . if occasion==2 // Not Adult
generate marg_day = .  //Day of week
replace marg_day = 23228623 if weekday==0  & sd2==0 // Non-parent, Sunday
replace marg_day = 23228623 if weekday==1  & sd2==0 // Non-parent, Monday
replace marg_day = 23228623 if weekday==2  & sd2==0 // Non-parent, Tuesday
replace marg_day = 23228623 if weekday==3  & sd2==0 // Non-parent, Wednesday
replace marg_day = 23228623 if weekday==4  & sd2==0 // Non-parent, Thursday
replace marg_day = 23228623 if weekday==5  & sd2==0 // Non-parent, Friday
replace marg_day = 23228623 if weekday==6  & sd2==0 // Non-parent, Saturday
replace marg_day = 9025896 if weekday==0  & sd2==1 // Parent, Sunday
replace marg_day = 9025896 if weekday==1  & sd2==1 // Parent, Monday
replace marg_day = 9025896 if weekday==2  & sd2==1 // Parent, Tuesday
replace marg_day = 9025896 if weekday==3  & sd2==1 // Parent, Wednesday
replace marg_day = 9025896 if weekday==4  & sd2==1 // Parent, Thursday
replace marg_day = 9025896 if weekday==5  & sd2==1 // Parent, Friday
replace marg_day = 9025896 if weekday==6  & sd2==1 // Parent, Saturday
replace marg_day = . if occasion==2 // Not Adult
generate marg_occ = .  //Adult occasions
replace marg_occ = 6497077 if occ2var==1  & sd2==0 // Non-parent, Early morning snack alone
replace marg_occ = 3374830 if occ2var==2  & sd2==0 // Non-parent, Early morning snack with significant other
replace marg_occ = 1460961 if occ2var==3  & sd2==0 // Non-parent, Early morning snack with family
replace marg_occ = 1559558 if occ2var==4  & sd2==0 // Non-parent, Early morning snack with friends
replace marg_occ = 15432845 if occ2var==6  & sd2==0 // Non-parent, Breakfast alone
replace marg_occ = 5888259 if occ2var==7  & sd2==0 // Non-parent, Breakfast with significant other
replace marg_occ = 3171313 if occ2var==8  & sd2==0 // Non-parent, Breakfast with family
replace marg_occ = 766780 if occ2var==9  & sd2==0 // Non-parent, Breakfast with friends
replace marg_occ = 8231664 if occ2var==11 & sd2==0 // Non-parent, Morning snack alone
replace marg_occ = 2453068 if occ2var==12 & sd2==0 // Non-parent, Morning snack with significant other
replace marg_occ = 1801569 if occ2var==13 & sd2==0 // Non-parent, Morning snack with family
replace marg_occ = 511158 if occ2var==14 & sd2==0 // Non-parent, Morning snack with friends
replace marg_occ = 16251242 if occ2var==16 & sd2==0 // Non-parent, Lunch alone
replace marg_occ = 5623676 if occ2var==17 & sd2==0 // Non-parent, Lunch with significant other
replace marg_occ = 3920016 if occ2var==18 & sd2==0 // Non-parent, Lunch with family
replace marg_occ = 2382520 if occ2var==19 & sd2==0 // Non-parent, Lunch with friends
replace marg_occ = 13121826 if occ2var==21 & sd2==0 // Non-parent, Afternoon snack alone
replace marg_occ = 3467125 if occ2var==22 & sd2==0 // Non-parent, Afternoon snack with significant other
replace marg_occ = 3589972 if occ2var==23 & sd2==0 // Non-parent, Afternoon snack with family
replace marg_occ = 1159419 if occ2var==24 & sd2==0 // Non-parent, Afternoon snack with friends
replace marg_occ = 12399113 if occ2var==26 & sd2==0 // Non-parent, Dinner alone
replace marg_occ = 12576551 if occ2var==27 & sd2==0 // Non-parent, Dinner with significant other
replace marg_occ = 7301736 if occ2var==28 & sd2==0 // Non-parent, Dinner with family
replace marg_occ = 1621878 if occ2var==29 & sd2==0 // Non-parent, Dinner with friends
replace marg_occ = 8976461 if occ2var==31 & sd2==0 // Non-parent, After dinner snack alone
replace marg_occ = 6078814 if occ2var==32 & sd2==0 // Non-parent, After dinner snack with significant other
replace marg_occ = 2900986 if occ2var==33 & sd2==0 // Non-parent, After dinner snack with family
replace marg_occ = 753245 if occ2var==34 & sd2==0 // Non-parent, After dinner snack with friends
replace marg_occ = 6155183 if occ2var==36 & sd2==0 // Non-parent, Late night meal alone
replace marg_occ = 2104875 if occ2var==37 & sd2==0 // Non-parent, Late night meal with significant other
replace marg_occ = 638337 if occ2var==38 & sd2==0 // Non-parent, Late night meal with family
replace marg_occ = 428304 if occ2var==39 & sd2==0 // Non-parent, Late night meal with friends
replace marg_occ = 2875743 if occ2var==1  & sd2==1 // Parent, Early morning snack alone
replace marg_occ = 2313594 if occ2var==2  & sd2==1 // Parent, Early morning snack with significant other
replace marg_occ = 1338141 if occ2var==3  & sd2==1 // Parent, Early morning snack with family
replace marg_occ = 486219 if occ2var==4  & sd2==1 // Parent, Early morning snack with friends
replace marg_occ = 3475097 if occ2var==6  & sd2==1 // Parent, Breakfast alone
replace marg_occ = 2809810 if occ2var==7  & sd2==1 // Parent, Breakfast with significant other
replace marg_occ = 3279250 if occ2var==8  & sd2==1 // Parent, Breakfast with family
replace marg_occ =      0 if occ2var==9  & sd2==1 // Parent, Breakfast with friends
replace marg_occ = 3747230 if occ2var==11 & sd2==1 // Parent, Morning snack alone
replace marg_occ = 1073133 if occ2var==12 & sd2==1 // Parent, Morning snack with significant other
replace marg_occ = 1593133 if occ2var==13 & sd2==1 // Parent, Morning snack with family
replace marg_occ = 846501 if occ2var==14 & sd2==1 // Parent, Morning snack with friends
replace marg_occ = 4319701 if occ2var==16 & sd2==1 // Parent, Lunch alone
replace marg_occ = 2369838 if occ2var==17 & sd2==1 // Parent, Lunch with significant other
replace marg_occ = 2739817 if occ2var==18 & sd2==1 // Parent, Lunch with family
replace marg_occ = 1234561 if occ2var==19 & sd2==1 // Parent, Lunch with friends
replace marg_occ = 3633357 if occ2var==21 & sd2==1 // Parent, Afternoon snack alone
replace marg_occ = 759178 if occ2var==22 & sd2==1 // Parent, Afternoon snack with significant other
replace marg_occ = 3095013 if occ2var==23 & sd2==1 // Parent, Afternoon snack with family
replace marg_occ = 929014 if occ2var==24 & sd2==1 // Parent, Afternoon snack with friends
replace marg_occ = 709665 if occ2var==26 & sd2==1 // Parent, Dinner alone
replace marg_occ = 1786177 if occ2var==27 & sd2==1 // Parent, Dinner with significant other
replace marg_occ = 6599526 if occ2var==28 & sd2==1 // Parent, Dinner with family
replace marg_occ = 520582 if occ2var==29 & sd2==1 // Parent, Dinner with friends
replace marg_occ = 768547 if occ2var==31 & sd2==1 // Parent, After dinner snack alone
replace marg_occ = 3555277 if occ2var==32 & sd2==1 // Parent, After dinner snack with significant other
replace marg_occ = 2796853 if occ2var==33 & sd2==1 // Parent, After dinner snack with family
replace marg_occ =      0 if occ2var==34 & sd2==1 // Parent, After dinner snack with friends
replace marg_occ = 1263335 if occ2var==36 & sd2==1 // Parent, Late night meal alone
replace marg_occ = 1155889 if occ2var==37 & sd2==1 // Parent, Late night meal with significant other
replace marg_occ = 689089 if occ2var==38 & sd2==1 // Parent, Late night meal with family
replace marg_occ = 417999 if occ2var==39 & sd2==1 // Parent, Late night meal with friends
replace marg_occ = . if occasion==2 // Not Adult
generate marg_kid = .  //Kid occasions
replace marg_kid =      0 if occ2var==5  & sd2==0 // Non-parent, Kids early morning snack
replace marg_kid =      0 if occ2var==10 & sd2==0 // Non-parent, Kids breakfast
replace marg_kid =      0 if occ2var==15 & sd2==0 // Non-parent, Kids morning snack
replace marg_kid =      0 if occ2var==20 & sd2==0 // Non-parent, Kids lunch
replace marg_kid =      0 if occ2var==25 & sd2==0 // Non-parent, Kids afternoon snack
replace marg_kid =      0 if occ2var==30 & sd2==0 // Non-parent, Kids dinner
replace marg_kid =      0 if occ2var==35 & sd2==0 // Non-parent, Kids after dinner snack
replace marg_kid =      0 if occ2var==40 & sd2==0 // Non-parent, Kids late night meal
replace marg_kid = 2951672 if occ2var==5  & sd2==1 // Parent, Kids early morning snack
replace marg_kid = 12384759 if occ2var==10 & sd2==1 // Parent, Kids breakfast
replace marg_kid = 4761261 if occ2var==15 & sd2==1 // Parent, Kids morning snack
replace marg_kid = 12674566 if occ2var==20 & sd2==1 // Parent, Kids lunch
replace marg_kid = 10592697 if occ2var==25 & sd2==1 // Parent, Kids afternoon snack
replace marg_kid = 12995330 if occ2var==30 & sd2==1 // Parent, Kids dinner
replace marg_kid = 5662468 if occ2var==35 & sd2==1 // Parent, Kids after dinner snack
replace marg_kid = 1158520 if occ2var==40 & sd2==1 // Parent, Kids late night meal
*replace marg_kid = . if adult==1 // Not Kid
