***
// code to construct some reasonable aggregate measures from the foods and beverages questions
//    it is called by the "transforms.do" program,
//    which is called by the "reform vars.do" program
***
gen q08_14 = inlist(1,q08_8,q08_9,q08_10,q08_11)
*vlabel q08_14 "Specialty cheese from the deli (such as goat cheese, Brie, Camembert, Blue, Gouda, etc.)"
* New in 2018 *

vlabel q08_14 "NET Specialty cheese from the deli: Specialty cheese from the deli/cheese department (e.g., goat cheese, Brie, Camembert, Blue, Gouda, etc.); Specialty soft cheese, package (e.g., goat cheese, Brie, Camembert, Blue, Gouda, etc.); Specialty hard cheese, cut at the deli/cheese department (e.g., Manchego, Gouda, Parmiggian-Reggiano, etc.); Specialty hard cheese, packaged (e.g., Manchego, Gouda, Parmiggian-Reggiano, etc.)"
label val q08_14 YESNO
move q08_14 q08a

gen q11_21 = inlist(1,q11_1,q11_2,q11_3)
vlabel q11_21 "Bacon/Sausage/Ham"
label val q11_21 YESNO
move q11_21 q11a

gen q11_22 = inlist(1,q11_5,q11_6)
vlabel q11_22 "Coffee Cake/Muffin"
label val q11_22 YESNO
move q11_22 q11a

gen q11_23 = inlist(1,q11_17,q11_18,q11_19)
vlabel q11_23 "Waffles/Pancakes/French Toast"
label val q11_23 YESNO
move q11_23 q11a

gen q12_13 = inlist(1,q12_7,q12_8,q12_9,q12_10,q12_11,q27_12,q33_29)
vlabel q12_13 "Yogurt"
label val q12_13 YESNO
move q12_13 q13

gen q13_14 = inlist(1,q13_1,q13_2,q13_3)
vlabel q13_14 "Applesauce"
label val q13_14 YESNO
move q13_14 q14

gen q13_15 = inlist(1,q13_6,q13_7)
vlabel q13_15 "Fresh fruit"
label val q13_15 YESNO
move q13_15 q14

gen q13_16 = inlist(1,q13_9,q13_10)
vlabel q13_16 "Fruit cup"
label val q13_16 YESNO
move q13_16 q14

gen q27_25 = inlist(1,q27_5,q27_6,q27_7,q27_8)
vlabel q27_25 "Chocolates"
label val q27_25 YESNO
move q27_25 q27a

gen q29_18 = inlist(1,q29_12,q29_13,q29_14,q29_15,q29_16)
vlabel q29_18 "Shell Fish (e.g. shrimp, clams, lobster, etc.)"
label val q29_18 YESNO
move q29_18 q29a

*missed swordfish in runs before 8/18/2014
*gen q29_19 = inlist(1,q29_1,q29_2,q29_3,q29_4,q29_6,q29_7)
gen q29_19 = inlist(1,q29_1,q29_2,q29_3,q29_4,q29_6,q29_7,q29_8)
vlabel q29_19 "Whitefish - (e.g. flounder, halibut, haddock, cod, sole, etc.)"
label val q29_19 YESNO
move q29_19 q29a

replace q33_17 = 1 if q12_4==1  //milk is a beverage, not food
replace q33_17 = 0 if q33_19==1 //remove overlap, giving priority to flavored milk
capture drop q12_4

gen q34_11 = inlist(1,q34_1,q34_2)
vlabel q34_11 "Fresh brewed"
label val q34_11 YESNO
move q34_11 q35

gen q35_16 = inlist(1,q35_1,q35_2,q35_3,q35_4,q35_5)
vlabel q35_16 "Beer/Ale"
label val q35_16 YESNO
move q35_16 q36a
