***
// code to define and set all value labels
//    it is called by the initial cleanup program and
//    the reform vars program
***
label drop _all
#delimit ;

 label define YESNO
   0 "No"
   1 "Yes"
   2 "No";

 label define SEASON
   1 "Spring"
   2 "Summer"
   3 "Fall";

 label define ZONE
   1 "Instrumental"
   2 "Savoring"
   3 "Inspirational";

 label define WHO
   1 "Alone"
   2 "Couple"
   3 "Family"
   4 "Friends"
   5 "Child";

 label define WHEN
   0 "Morning snack"
   1 "Early morning snack"
   2 "Breakfast"
   3 "Morning snack"
   4 "Lunch"
   5 "Afternoon snack"
   6 "Dinner"
   7 "After dinner snack"
   8 "Late night meal/snack"
   9 "Evening snack";

 label define WHERE
   1 "Home"
   2 "At work"
   3 "Restaurant"
   4 "Other away from home";

 label define OCCPART
   1 "IST early morning snack"
   2 "IST breakfast"
   3 "IST morning snack"
   4 "IST lunch"
   5 "IST afternoon snack"
   6 "IST dinner"
   7 "IST after dinner snack"
   8 "IST late night meal"
   11 "SAV early morning snack"
   12 "SAV breakfast"
   13 "SAV morning snack"
   14 "SAV lunch"
   15 "SAV afternoon snack"
   16 "SAV dinner"
   17 "SAV after dinner snack"
   18 "SAV late night meal";

 label define OCCPART2
   1 "Instrumental early morning snack"
   2 "Instrumental breakfast"
   3 "Instrumental morning snack"
   4 "Instrumental lunch"
   5 "Instrumental afternoon snack"
   6 "Instrumental dinner"
   7 "Instrumental after dinner snack"
   8 "Instrumental late night meal/snack"
   11 "Savoring early morning snack"
   12 "Savoring breakfast"
   13 "Savoring morning snack"
   14 "Savoring lunch"
   15 "Savoring afternoon snack"
   16 "Savoring dinner"
   17 "Savoring after dinner snack"
   18 "Savoring late night meal/snack";

 label define MEAL
   0 "Snack occasions"
   1 "Meal occasions";

 label define AH_CFH
   0 "Away from home, not sourced from home"
   1 "At home/Carried from home";

 label define CFH
   0 "At home/Not sourced from home"
   1 "Carried from home";

 label define AFH
   0 "At home"
   1 "Away from home";

 label define SOURCE
   1 "Carried from home"
   2 "Restaurant"
   3 "All other sources";

 label define WEEKPART
   0 "Weekday"
   1 "Weekend";

 label define WEEKDAY
   0 "Sunday"
   1 "Monday"
   2 "Tuesday"
   3 "Wednesday"
   4 "Thursday"
   5 "Friday"
   6 "Saturday"
   10 "Sunday"
   11 "Monday"
   12 "Tuesday"
   13 "Wednesday"
   14 "Thursday"
   15 "Friday"
   16 "Saturday";

 label define OBESEG
   1 "Underweight"
   2 "Normal"
   3 "Overweight"
   4 "Obese";

 label define SD2
   0 "Non-parent"
   1 "Parent";

/* New in 2016 */
 label define P1
   1 "Yes, the child between 13 and 17 is now going to complete this survey"
   2 "No";

 label define P3
   1 "Male"
   2 "Female";

 label define RACE
   1 "Caucasian"
   2 "African-American"
   3 "Other";

 label define RACE2
   1 "Caucasian"
   2 "African-American"
   3 "Asian-American"
   4 "Other";

 label define RACE3
   1 "Caucasian" 
   2 "Other"
   11 "Caucasian"
   12 "Other";

 label define GENDER
   1 "Male"
   2 "Female";

 label define US01PGS
   1 "All of it"
   2 "Almost all of it"
   3 "About half of it"
   4 "Less than half of it"
   5 "None";

 label define REGION
   1 "Northeast"
   2 "Midwest"
   3 "South"
   4 "West";

 label define DIVISION
   1 "East North Central"
   2 "East South Central"
   3 "Mid-Atlantic"
   4 "Mountain"
   5 "New England"
   6 "Pacific"
   7 "South Atlantic"
   8 "West North Central"
   9 "West South Central";

 label define STATE
   1 "Alabama"
   2 "Alaska"
   3 "Arizona"
   4 "Arkansas"
   5 "California"
   6 "Colorado"
   7 "Connecticut"
   8 "Delaware"
   9 "District of Columbia"
  10 "Florida"
  11 "Georgia"
  12 "Hawaii"
  13 "Idaho"
  14 "Illinois"
  15 "Indiana"
  16 "Iowa"
  17 "Kansas"
  18 "Kentucky"
  19 "Louisiana"
  20 "Maine"
  21 "Maryland"
  22 "Massachusetts"
  23 "Michigan"
  24 "Minnesota"
  25 "Mississippi"
  26 "Missouri"
  27 "Montana"
  28 "Nebraska"
  29 "Nevada"
  30 "New Hampshire"
  31 "New Jersey"
  32 "New Mexico"
  33 "New York"
  34 "North Carolina"
  35 "North Dakota"
  36 "Ohio"
  37 "Oklahoma"
  38 "Oregon"
  39 "Pennsylvania"
  40 "Rhode Island"
  41 "South Carolina"
  42 "South Dakota"
  43 "Tennessee"
  44 "Texas"
  45 "Utah"
  46 "Vermont"
  47 "Virginia"
  48 "Washington"
  49 "West Virginia"
  50 "Wisconsin"
  51 "Wyoming"
  52 "None of the above";

 label define USEDU3   /// label define USEDU2  Pre 2016 Spring ///
   1 "Grade 4 or less"
   2 "Grade 5 to 8"
   3 "Grade 9 to 11"
   4 "Grade 12 (no diploma)"
   5 "Regular High School Diploma"
   6 "GED or alternative credential"
   7 "Some college credit, but less than 1 year"
   8 "1 or more years of college credit, no degree"
   9 "Associate's degree"
   10 "Bachelor's degree"
   11 "Master's degree"
   12 "Professional degree beyond Bachelor's degree"
   13 "Doctorate degree (for example:  PhD, EdD)";

* 101117 RH Hispanic variable changed to USRETH3 in 2016
* label define USRETH2
*   1 "No, not of Hispanic, Latino or Spanish origin"
*   2 "Yes, Mexican, Mexican American, or Chicano"
*   3 "Yes, Puerto Rican"
*   4 "Yes, Cuban"
*   5 "Yes, Other Hispanic, Latino or Spanish origin"
*   6 "Prefer not to answer";

 label define USRETH3
   1 "Yes"
   2 "No"
   3 "Prefer not to answer";

* label define USHHI2   // ushhi2 not used starting in SPRING 2017. Use ushhi3 instead
*   1 "Less than $5,000"
*   2 "$5,000-$9,999"
*   3 "$10,000-$14,999"
*   4 "$15,000-$19,999"
*   5 "$20,000-$24,999"
*   6 "$25,000-$29,999"
*   7 "$30,000-$34,999"
*   8 "$35,000-$39,999"
*   9 "$40,000-$44,999"
*   10 "$45,000-$49,999"
*   11 "$50,000-$54,999"
*   12 "$55,000-$59,999"
*   13 "$60,000-$64,999"
*   14 "$65,000-$69,999"
*   15 "$70,000-$74,999"
*   16 "$75,000-$79,999"
*   17 "$80,000-$89,999"
*   18 "$90,000-$99,999"
*   19 "$100,000-$124,999"
*   20 "$125,000-$149,999"
*   21 "$150,000-$199,999"
*   22 "$200,000-$249,999"
*   23 "$250,000 or more"
*   24 "Prefer not to answer";

 label define USHHI3   /// $80,000-$99,999 now in 4 values 
   1 "Less than $5,000"
   2 "$5,000-$9,999"
   3 "$10,000-$14,999"
   4 "$15,000-$19,999"
   5 "$20,000-$24,999"
   6 "$25,000-$29,999"
   7 "$30,000-$34,999"
   8 "$35,000-$39,999"
   9 "$40,000-$44,999"
   10 "$45,000-$49,999"
   11 "$50,000-$54,999"
   12 "$55,000-$59,999"
   13 "$60,000-$64,999"
   14 "$65,000-$69,999"
   15 "$70,000-$74,999"
   16 "$75,000-$79,999"
   17 "$80,000-$84,999"
   18 "$85,000-$89,999"
   19 "$90,000-$94,999"
   20 "$95,000-$99,999"
   21 "$100,000-$124,999"
   22 "$125,000-$149,999"
   23 "$150,000-$199,999"
   24 "$200,000-$249,999"
   25 "$250,000 or more"
   26 "Prefer not to answer";

 label define US09KID
   6 "6+";

 label define OWNKIDS
   4 "4+";

 label define KIDS2
   3 "3+";

 label define HHCMP1
   12 "12 or more";

 label define SE2
   1 "In my home or somebody else's home"
   2 "At work, outside of home"
   3 "At a restaurant, café, fast food outlet, cafeteria"
   4 "In a store/retail outlet"
   5 "On the go"
   6 "At another place away from home"
   7 "Other";

 label define OCC2VAR
   1 "Early morning snack alone"
   2 "Early morning snack with significant other"
   3 "Early morning snack with family"
   4 "Early morning snack with friends"
   5 "Kids early morning snack"
   6 "Breakfast alone"
   7 "Breakfast with significant other"
   8 "Breakfast with family"
   9 "Breakfast with friends"
   10 "Kids breakfast"
   11 "Morning snack alone"
   12 "Morning snack with significant other"
   13 "Morning snack with family"
   14 "Morning snack with friends"
   15 "Kids morning snack"
   16 "Lunch alone"
   17 "Lunch with significant other"
   18 "Lunch with family"
   19 "Lunch with friends"
   20 "Kids lunch"
   21 "Afternoon snack alone"
   22 "Afternoon snack with significant other"
   23 "Afternoon snack with family"
   24 "Afternoon snack with friends"
   25 "Kids afternoon snack"
   26 "Dinner alone"
   27 "Dinner with significant other"
   28 "Dinner with family"
   29 "Dinner with friends"
   30 "Kids dinner"
   31 "After dinner snack alone"
   32 "After dinner snack with significant other"
   33 "After dinner snack with family"
   34 "After dinner snack with friends"
   35 "Kids after dinner snack"
   36 "Late night meal alone"
   37 "Late night meal with significant other"
   38 "Late night meal with family"
   39 "Late night meal with friends"
   40 "Kids late night meal";

 label define QB0
   1 "Today"
   2 "Yesterday";

 label define QB1B
   1 "Spouse"
   2 "Unmarried partner I live with"
   3 "Partner I'm dating but don't live with"
   4 "With a date, but it's not serious quite yet";

 label define QB2A
   1 "Your home"
   2 "A friend's home"
   3 "A partner's home"
   4 "A relative's home"
   5 "Another home";

 label define QB2C
   1 "At your desk in an office with a door"
   2 "At your cubicle desk (no door)"
   3 "At a workplace lunch room or public gathering space"
   4 "During a meeting"
   5 "In a conference room (no meeting)"
   6 "On the go in the office"
   7 "In work vehicle"
   8 "At a work site"
   9 "Other, please specify:";

 label define QB2E
   1 "A day-care/pre-school"
   2 "A kindergarten"
   3 "A grade school"
   4 "A middle school"
   5 "A high school"
   6 "A technical or trade school"
   7 "Other, please specify:";

 label define QB2F
   1 "A fast food restaurant"
   2 "A cafe"
   3 "A food court in a shopping mall or airport"
   4 "A cafeteria at work"
   5 "A cafeteria at high school"
   6 "A cafeteria/food court on a college or university campus"
   7 "A national sit-down chain restaurant"
   8 "A local sit-down casual eatery"
   9 "A local sit-down high end restaurant"
  10 "Other, please specify:";

 label define QB2G
   1 "An in-store fast food restaurant"
   2 "An in-store café"
   3 "An in-store cafeteria/lunch counter"
   4 "An in-store U-serve food bar with tables"
   5 "An in-store national chain restaurant"
   6 "An in-store non-chain restaurant"
   7 "Eating/drinking while in a convenience store"
   8 "Eating/drinking while in a drug store"
   9 "Eating/drinking while walking in another kind of store"
  10 "Other, please specify";

 label define QB2H
   1 "In a car"
   2 "On a scooter/motorbike"
   3 "On the bus"
   4 "In a plane"
   5 "On the train/subway"
   6 "On a boat/ferry"
   7 "While walking"
   8 "Other, please specify";

 label define QB2I
   1 "At a professional sports stadium"
   2 "At a church"
   3 "At a school"
   4 "At a museum"
   5 "At a concert/exhibition hall"
   6 "At a picnic"
   7 "At an indoor community activity (e.g. church meeting, club meeting, etc.)"
   8 "At a casual indoor sporting event (e.g. school basketball, hockey)"
   9 "At a casual outdoor sporting event (e.g. kids soccer game, adult pick-up sports)"
  10 "Another place, please specify";

 label define QB3A
   1 "It was a before dinner appetizer"
   2 "It was something I had while dinner was being made"
   3 "It was an after school snack"
   4 "It had nothing to do with dinner"
   5 "Other, please specify:";

 label define QB3B
   1 "It was dessert with dinner"
   2 "It was in addition to the dessert I had with dinner"
   3 "It was its own snack, and I had no dessert"
   4 "Other, please specify:";

 label define QB3C
   1 "Both food and drink/beverage"
   2 "Food only"
   3 "Drink or beverage only";

/* New in 2016 */
  label define QB3E 
   1 "Yes"
   2 "No, had dessert a little later"
   3 "No, did not have a dessert";
  
 label define QB4A
   1 "Less than an hour before"
   2 "About an hour before"
   3 "Several hours before"
   4 "About a day before"
   5 "A couple of days before"
   6 "Several days before"
   7 "A week or more earlier";

/* New in 2019 */
 label define QB4D
   1 "Less than an hour before"
   2 "About an hour before"
   3 "Several hours before"
   4 "About a day before"
   5 "A couple of days before"
   6 "Several days before"
   7 "A week or more earlier";
   
/* New in 2019 */
 label define QB5A
   1 "I had no real say, someone else chose what I had"
   2 "I made some of the decisions, and someone else chose some things for me"
   3 "I made all the decisions about what to have";

/* New in 2019 */
 label define QB5B
   1 "No preparation, just ate/drank/poured straight from the package, container or dispenser"
   2 "I wasn’t involved, someone else did all the assembly and preparation"
   3 "I helped to assemble and prepare the items"
   4 "I did all or most of the assembly and preparation";

 label define Q01
   0 "Does not describe at all"
   5 "Describes extremely well";

 label define Q03
   1 "Not a consideration at all"
   2 "A consideration, but not a very important one"
   3 "Just one of many equally important considerations"
   4 "One of the most important considerations";

 label define Q04B
   1 "All the food/beverage came from a restaurant, including delivery/take out"
   2 "Some of the food/beverage came from a restaurant, including delivery/take out"
   3 "None of the food/beverage came from a restaurant, including delivery/take out";

/* New in 2016 */
 label define Q04F
   1 "Delivered"
   2 "Take out"
   3 "Both delivery and take out"
   4 "Neither, it was eaten/drunk at the restaurant";

 label define Q04C
   1 "All of the food was from leftovers"
   2 "Some of the food was from leftovers"
   3 "None of the food was from leftovers";

 label define Q04D
   1 "A restaurant, including delivery/take out"
   2 "A canned product"
   3 "A frozen product (NOT entrée/meal)"
   4 "Packaged/dry ingredients"
   5 "Bulk/unpackaged"
   6 "A multi-serve frozen entrée/meal"
   7 "A single frozen entrée/meal"
   8 "A multi-serve refrigerated entrée/meal"
   9 "A single-serve refrigerated entrée/meal"
   10 "A deli/prepared foods department"
   11 "Don’t know/Don’t remember";

 label define Q05A
   1 "A restaurant, including delivery/take out"
   2 "A canned product"
   3 "Packaged/dry ingredients"
   4 "Bulk/unpackaged"
   5 "A multi-serve frozen entrée/meal"
   6 "A single frozen entrée/meal"
   7 "A multi-serve refrigerated entrée/meal"
   8 "A single-serve refrigerated entrée/meal"
   9 "A deli/prepared foods department"
   10 "Don’t know/Don’t remember";

 label define Q06A
   1 "A restaurant, including delivery/take out"
   2 "An artisan bakery"
   3 "Packaged, from a bakery department"
   4 "Packaged, from a shelf (e.g. Orowheat, Sara Lee)"
   5 "Refrigerated dough (e.g. Pillsbury)"
   6 "A dry boxed mix"
   7 "Refrigerated product (NOT dough)"
   8 "A frozen dough product"
   9 "Made from scratch using individual ingredients"
   10 "Don’t know/Don’t remember";

 label define Q07A
   1 "A restaurant, including delivery/take out"
   2 "A single serve frozen entrée/meal"
   3 "A multi-serve frozen entrée/meal"
   4 "A multi-serve refrigerated entrée/meal"
   5 "A single-serve refrigerated entrée/meal"
   6 "Made from scratch using individual ingredients"
   7 "Don’t know/Don’t remember";

 label define Q08A
   1 "A restaurant, including delivery/take out"
   2 "A single serve frozen entrée/meal"
   3 "A multi-serve frozen entrée/meal"
   4 "A multi-serve refrigerated entrée/meal"
   5 "A single-serve refrigerated entrée/meal"
   6 "A dried meal kit"
   7 "Made from scratch using individual ingredients"
   8 "Don’t know/Don’t remember";

 label define Q10A
   1 "A restaurant, including delivery/take out"
   2 "A single serve frozen entrée/meal"
   3 "A multi-serve frozen entrée/meal"
   4 "A multi-serve refrigerated entrée/meal"
   5 "A single-serve refrigerated entrée/meal"
   6 "A dried meal kit"
   7 "Made from scratch using individual ingredients, including branded Chinese food products"
   8 "Don’t know/Don’t remember";

 label define Q11A
   1 "A restaurant, including delivery/take out"
   2 "A single serve frozen product"
   3 "A multi-serve frozen product"
   4 "Refrigerated dough"
   5 "Dry mix"
   6 "A multi-serve refrigerated product"
   7 "A single serve refrigerated product"
   8 "Made from scratch using individual ingredients"
   9 "A store-branded bakery item"
   10 "A branded/packaged shelf stable product"
   11 "A branded/packaged refrigerated product"
   12 "A local artisan bakery"
   13 "Don’t know/Don’t remember";

 label define Q14A
   1 "A restaurant, including delivery/take out"
   2 "The meat counter in raw form"
   3 "The meat counter, raw and marinated/seasoned"
   4 "A Pre-packaged,raw meat product (e.g. chicken breasts in a tray)"
   5 "A frozen raw meat product – multiple cuts"
   6 "A frozen product with individually wrapped raw meat cuts"
   7 "A Frozen and pre-cooked/prepared product"
   8 "The hot foods area of a prepared foods/deli dept."
   9 "A single serve frozen entrée/meal"
   10 "A multi-serve frozen entrée/meal"
   11 "A single serve refrigerated entrée/meal"
   12 "A multi-serve refrigerated entrée/meal"
   13 "Don’t know/Don’t remember";

 label define Q15A
   1 "A restaurant, including delivery/take out"
   2 "A single serve frozen entrée/meal"
   3 "A multi-serve frozen entrée/meal"
   4 "A multi-serve refrigerated entrée/meal"
   5 "A single-serve refrigerated entrée/meal"
   6 "A dried meal kit"
   7 "Made from scratch using individual ingredients, including branded Mexican food products"
   8 "Don’t know/Don’t remember";

 label define Q16A
   1 "A restaurant, including delivery/take out"
   2 "A single serve frozen entrée/meal"
   3 "A multi-serve frozen entrée/meal"
   4 "A multi-serve refrigerated entrée/meal"
   5 "A single-serve refrigerated entrée/meal"
   6 "A dried meal kit"
   7 "A canned product"
   8 "A shelf-stable pouch or carton"
   9 "Made from scratch using individual ingredients"
   10 "Don’t know/Don’t remember";

 label define Q17A
   1 "A restaurant, including delivery/take out"
   2 "A boxed dish/kit (mac & cheese)"
   3 "A frozen product (e.g. Buitoni tortellini)"
   4 "A canned/jarred product"
   5 "A product purchased in chilled/refrigerated form (e.g. Buitoni)"
   6 "A single-serve frozen entrée/meal"
   7 "A multi-serve frozen entrée/meal"
   8 "A multi-serve refrigerated entrée/meal"
   9 "A single-serve refrigerated entrée/meal"
   10 "Made from scratch using dried pasta"
   11 "Made from scratch using chilled/fresh pasta"
   12 "Made from scratch using individual ingredients"
   13 "Don’t know/Don’t remember";

 label define Q18A
   1 "A restaurant, including delivery/take out"
   2 "A chilled/refrigerated product"
   3 "A frozen product (excluding side dish)"
   4 "A frozen side dish (e.g. potatoes and vegetables)"
   5 "An instant boxed mix (e.g. instant mashed potatoes)"
   6 "A non-chilled/non-refrigerated product (e.g. Betty Crocker scalloped potatoes)"
   7 "A single serve frozen meal"
   8 "A multi-serve frozen meal"
   9 "Made from scratch using individual ingredients"
   10 "Don’t know/Don’t remember";

 label define Q19A
   1 "A restaurant, including delivery/take out"
   2 "Bulk bins (i.e. unpackaged)"
   3 "Packaged, dry ingredients"
   4 "Packaged branded box mix (e.g. Rice’ Roni)"
   5 "Pre-cooked frozen product"
   6 "Pre-cooked shelf stable/microwaveable pouch"
   7 "A single serve frozen entrée/meal"
   8 "A multi-serve frozen entrée/meal"
   9 "A multi-serve refrigerated entrée/meal"
   10 "A single-serve refrigerated entrée/meal"
   11 "Don’t know/Don’t remember";

 label define Q20A
   1 "A restaurant, including delivery/take out"
   2 "A pre-packaged salad product"
   3 "Complete salad kit"
   4 "A Salad bar at grocery retailer"
   5 "Scratch from ingredients at home"
   6 "Don’t know/Don’t remember";

 label define Q22A
   1 "A restaurant, including delivery/take out"
   2 "A shelf stable (i.e. non-refrigerated) product"
   3 "A dry, powdered mix"
   4 "Product sold chilled/refrigerated"
   5 "A frozen product"
   6 "Scratch from ingredients"
   7 "Don’t know/Don’t remember";

 label define Q23
   0 "Didn't have a sandwich"
   1 "Cold Sandwich - no meat"
   2 "Cold Sandwich - with meat"
   3 "Hot Sandwich - no meat"
   4 "Hot Sandwich - with meat"
   5 "Wraps/pita - no meat"
   6 "Wraps/pita - with meat"
   7 "Prepackaged refrigerated sandwich from a kit"
   8 "Frozen Pockets and Sandwiches";

 label define Q23A
   1 "A restaurant, including delivery/take out"
   2 "A shrink-wrapped, refrigerated product in the deli/prepared foods department"
   3 "A custom, made to order sandwich from the prepared foods department of a grocery store"
   4 "A sandwich made fresh at home with individual ingredients"
   5 "Don’t know/Don’t remember";

 label define Q25A
   1 "A restaurant, including delivery/take out"
   2 "A single serve frozen product"
   3 "A multi-serve frozen product"
   4 "A multi-serve refrigerated entrée/meal"
   5 "A single-serve refrigerated entrée/meal"
   6 "A dry meal/dinner kit (e.g. Thai Kitchen, Hamburger Helper)"
   7 "Scratch ingredients"
   8 "Don’t know/Don’t remember";

 label define Q26A
   1 "A restaurant, including delivery/take out"
   2 "A canned, condensed soup product"
   3 "A canned, ready-to-eat product"
   4 "A dehydrated soup mix (requires cooking)"
   5 "An instant soup mix (requires only hot water)"
   6 "A shelf-stable pouch or carton"
   7 "A chilled/refrigerated container"
   8 "A frozen container"
   9 "A hot, fresh soup display in-store deli/prepared foods dept."
   10 "Made from scratch using individual ingredients"
   11 "Don’t know/Don’t remember";

 label define Q27A
   1 "A shelf stable product (e.g. Hostess baked goods, ready to eat pudding)"
   2 "A store baked product (e.g. Safeway branded donuts)"
   3 "A local, artisan bakery product sold at retail"
   4 "A frozen dough product"
   5 "A frozen, heat-n-serve product"
   6 "A packaged mix (e.g. Betty Crocker, Jell-O)"
   7 "Refrigerated dough/ready to bake product (e.g. Pillsbury)"
   8 "Recipe with raw ingredients"
   9 "Don’t know/Don’t remember";

 label define Q28A
   1 "A restaurant, including delivery/take out"
   2 "A frozen product (e.g. frozen corn, peas, etc.)"
   3 "Fresh produce"
   4 "Frozen vegetable side dish (e.g. Bird’s Eye)"
   5 "Frozen meal in a bag (e.g. Bertolli)"
   6 "A single serve frozen entrée/meal"
   7 "A multi-serve frozen entrée/meal"
   8 "A multi-serve refrigerated entrée/meal"
   9 "A single-serve refrigerated entrée/meal"
   10 "A can"
   11 "A shelf stable cup"
   12 "A pouch"
   13 "A refrigerated container"
   14 "Don’t know/Don’t remember";

 label define Q29A
   1 "A restaurant, including delivery/take out"
   2 "The seafood counter in raw form, not frozen"
   3 "A marinated/seasoned raw item at the seafood counter"
   4 "A marinated/seasoned and pre-cooked frozen product"
   5 "A frozen, raw seafood product"
   6 "From a hot entrée in the prepared foods/deli department"
   7 "A single serve, frozen entrée/meal"
   8 "A multi-serve, frozen entrée/meal"
   9 "A single serve, refrigerated entrée/meal"
   10 "A multi-serve, refrigerated entrée/meal"
   11 "A can"
   12 "A pouch"
   13 "Don’t know/Don’t remember";

 label define Q30A
   1 "A single serve package"
   2 "A multi-serve package"
   3 "Don’t know/Don’t remember";

 label define Q31A
   1 "A restaurant, including delivery/take out"
   2 "A shelf stable bottle or jar"
   3 "A shelf stable can"
   4 "A shelf stable pouch/carton"
   5 "A refrigerated/chilled package"
   6 "A dry/powdered mix"
   7 "A recipe made from scratch"
   8 "Don’t know/don’t remember";

 label define Q33A
   1 "A restaurant, café, bar"
   2 "A food retailer"
   3 "A vending machine";

 label define Q33B
   1 "A ready to drink bottle"
   2 "A ready to drink can"
   3 "A ready to drink pouch/carton"
   4 "Powdered beverage product"
   5 "A liquid concentrate product"
   6 "Individual ingredients made from scratch by me"
   7 "Don’t know/don’t remember";

 label define Q36D
   1 "A ready to drink bottle"
   2 "A ready to drink can"
   3 "A ready to drink pouch/carton"
   4 "Carbonated beverage"
   5 "Powdered beverage product"
   6 "A liquid concentrate product"
   7 "A frozen concentrate product"
   8 "Individual ingredients made from scratch by me"
   9 "Don’t know/don’t remember";

 label define Q40
   1 "Completely satisfying"
   2 "Mostly satisfying"
   3 "Somewhat satisfying"
   4 "Barely satisfying"
   5 "Not at all satisfying";

 label define Q40A
   1 "100% Fruit Juice"
   2 "Alcoholic beverage"
   3 "Cider"
   4 "Carbonated soft drink/Soda/Pop"
   5 "Chocolate milk"
   6 "Coffee"
   7 "Espresso drink"
   8 "Coconut water"
  10 "Frozen slush drink (no-alcohol)"
  11 "Fruit Smoothie"
  12 "Hot chocolate/Cocoa"
  13 "Iced tea"
  14 "Juice Drink"
  15 "Lemonade"
  16 "Meal replacement/Nutrition drink"
  17 "Milk, excluding chocolate milk"
  18 "Milk shake/Malt"
  19 "Milk, flavored (other than chocolate)"
  20 "Milk, alternative not from soy"
  21 "Soy milk"
  22 "Energy drink"
  23 "Sports drink"
  25 "Tea hot"
  26 "Vegetable juice"
  27 "Vegetable + fruit juice"
  28 "Vitamin/fortified water"
  29 "Yogurt drink/Smoothie"
  30 "Water"
  31 "Beans/Lentils/Legumes"
  32 "Breads and bread-like products"
  33 "Casseroles"
  34 "Bars"
  35 "Cheese (string, sliced, chunk)"
  36 "Chinese food"
  37 "Common breakfast items"
  38 "Crackers"
  39 "Dairy products other than cheese"
  40 "Meat Snacks (e.g. jerky)"
  41 "Eggs"
  42 "Fruit/Fruit snacks"
  44 "Hamburger/Cheeseburger"
  45 "Hot Dog"
  46 "Meat, canned"
  47 "Meat Cuts, excluding seafood"
  48 "Mexican style food"
  49 "Nachos"
  51 "Nuts/Peanuts"
  52 "Pizza/Pasta/Italian"
  53 "Potatoes"
  57 "Rice and other starches"
  58 "Salads"
  59 "Salty snacks"
  60 "Sandwiches"
  61 "Sausage"
  63 "Skillet meal/Stir-Fry"
  64 "Snack kit"
  65 "Soup/Stew"
  66 "Sweets"
  67 "Vegetables (other than potatoes)"
  69 "Other Ethnic foods"
  70 "Seafood"
  71 "Meat substitutes"
  72 "Sweeteners"
  73 "Other, please specify"
  74 "All/None of these"
  75 "More than one";

 label define Q45
   1 "A fast food restaurant"
   2 "A café"
   3 "A food court in a shopping mall or airport"
   4 "A cafeteria at work"
   5 "A cafeteria at high school"
   6 "A cafeteria/food court on a college or university campus"
   7 "A national sit-down chain restaurant"
   8 "A local sit-down casual eatery"
   9 "A local sit-down high end restaurant"
   10 "A street vendor/cart"
   11 "Some other restaurant, please specify";

 label define Q45D
   1 "Fast food chain (e.g., KFC, Taco Bell, McDonald’s)"
   2 "Quick casual restaurant chain (e.g., Panera Bread, Chipotle, Panda Express, Five Guys)"
   3 "Full service casual restaurant chain (e.g., Applebee’s, Chili’s, Denny’s)"
   4 "Local casual restaurant, pub or bar (not a national chain)"
   5 "Coffee shop/café (e.g., local coffee shop, Starbucks, Dunkin’ Donuts)";

/* New in 2019 */
 label define Q45H
   1 "Delivered"
   2 "Take out"
   3 "Both delivery and take out"
   4 "Neither, it was eaten/drunk at the restaurant";

 label define Q46
   1 "Not at all interested"
   2 "Somewhat interested"
   3 "Very interested"
   4 "Extremely interested";

 label define QP01
   1 "Not at all important, we never worry about it"
   2 "Hardly important"
   3 "Somewhat important"
   4 "Fairly important"
   5 "Extremely important, we always make healthy eating choices";

 label define QP02
   0 "No food allergies or food sensitivities"
   1 "Yes, one or more food sensitivities only"
   2 "Yes, one or more food allergies";

/* New in 2016 */
* label define QPE01A
*   1 "Within the past year"
*   2 "One to two years ago"
*   3 "More than two years ago"
*   4 "Don't know/Don't remember";
  
 label define QPE2
   1 "Not at all important, we almost never try to do this"
   2 "Hardly important"
   3 "Somewhat important"
   4 "Fairly important"
   5 "Extremely important, we always do this";

 label define QP04
   1 "7-ELEVEN"
   2 "Albertsons"
   3 "ALDI"
   4 "BJ's"
   5 "Circle K"
   6 "Costco"
   7 "CVS"
   8 "Dollar General"
   9 "Dominick's"
   10 "Exxon-Mobil"
   11 "Food Lion"
   12 "Family Dollar"
   13 "Food4Less"
   14 "Fred Meyer"
   15 "Giant Eagle"
   16 "HEB"
   17 "Jewel"
   18 "Kangaroo/Kangaroo Express"
   19 "Kroger"
   20 "Meijer"
   21 "Publix"
   22 "Quick Trip"
   23 "Ralphs"
   24 "Safeway"
   25 "Sam's Club"
   26 "Shaw's"
   27 "Speedway/SuperAmerica"
   28 "Stop & Shop"
   29 "SuperTarget"
   30 "Target"
   31 "The Pantry"
   32 "Tops"
   33 "Trader Joe's"
   34 "Vons"
   35 "Walgreens"
   36 "Wegmans"
   37 "Whole Foods"
   38 "Wild Oats"
   39 "Winn Dixie"
   40 "Walmart"
   41 "Walmart Supercenter"
   42 "Other, please specify"
   43 "SUPERVALU"
   44 "Club"
   45 "Drug"
   46 "Dollar"
   47 "Amazon.com/AmazonFresh"
   48 "Ahold Delhaize";

 label define QP05
   1 "Married"
   2 "Living together"
   3 "Civil union"
   4 "Single (never married)"
   5 "Widowed"
   6 "Separated"
   7 "Divorced"
   8 "Other, please specify:";

 label define QP06
   1 "Own home"
   2 "Rent"
   3 "Other, please specify:";

 label define QP07
   1 "Employed outside the home full-time"
   2 "Employed outside the home part-time"
   3 "Self-employed"
   4 "Homemaker"
   5 "Unemployed"
   6 "Retired"
   7 "Student"
   8 "Other, please specify:";

 label define QP08
   1 "City/urban area"
   2 "Suburbs"
   3 "Rural area";

 label define QP09
   1 "1, I live alone"
  10 "10+";

/* New in 2016 */
 label define QP09B
   1 "A house/condominium/apartment"
   2 "A dormitory/fraternity/sorority house"
   3 "Assisted living quarters"
   4 "Other, please specify:";
  
 label define QP10
   1 "Caucasian / White"
   2 "African-American / Black"
   3 "Asian"
   4 "Hispanic"
   5 "Mixed Race"
   6 "Other";

 label define QP11
   1 "NO, not Hispanic/Latino/Spanish"
   2 "Yes, Mexican, Mexican Am., Chicano"
   3 "Yes, Puerto Rican"
   4 "Yes, Cuban"
   5 "Yes, other Hispanic, Latino or Spanish origin";

 label define QP12
   1 "United States (not Puerto Rico)"
   2 "Mexico"
   3 "Venezuela"
   4 "Colombia"
   5 "Cuba"
   6 "Puerto Rico"
   7 "Dominican Republic"
   8 "Argentina"
   9 "Uruguay"
   10 "Paraguay"
   11 "Chile"
   12 "Peru"
   13 "Nicaragua"
   14 "Panama"
   15 "Guatemala"
   16 "Honduras"
   17 "Other, please specify";

#delimit cr

/* New in 2016 */
 label define QPE01A 1 "Within the past year" 2 "One to two years ago" 3 "More than two years ago" 4 "Don't know/Don't remember"


* label values dchild      DCHILD
capture label values girl        YESNO
capture label values gender      GENDER
capture label values us01pgs     US01PGS
capture label values us09kid     US09KID
capture label values region      REGION
capture label values division    DIVISION
capture label values state       STATE
capture label values usedu3      USEDU3
*capture label values usedu2      USEDU2   Pre 2016 Spring
capture label values usreth2     USRETH2
* New in 2016 *
capture label values usreth3     USRETH3
capture label values kids2 		 KIDS2

* New in 2019: Not asked in 2019 *
capture label values usrace2_1   YESNO
capture label values usrace2_2   YESNO
capture label values usrace2_3   YESNO
capture label values usrace2_4   YESNO
capture label values usrace2_5   YESNO
capture label values usrace2_6   YESNO
capture label values usrace2_7   YESNO
capture label values usrace2_8   YESNO
capture label values usrace2_9   YESNO
capture label values usrace2_10  YESNO
capture label values usrace2_11  YESNO
capture label values usrace2_12  YESNO
capture label values usrace2_13  YESNO
capture label values usrace2_14  YESNO
capture label values usrace2_15  YESNO

* New in 2019 *
capture label values usrace301   YESNO
capture label values usrace302   YESNO
capture label values usrace303   YESNO
capture label values usrace304   YESNO
capture label values usrace305   YESNO
capture label values usrace306   YESNO
capture label values usrace307   YESNO
capture label values usrace308   YESNO
capture label values usrace309   YESNO
capture label values usrace310   YESNO
capture label values usrace311   YESNO
capture label values usrace312   YESNO
capture label values usrace313   YESNO
capture label values usrace314   YESNO
capture label values usrace315   YESNO
capture label values usrace316   YESNO
capture label values usrace41    YESNO
capture label values usrace42    YESNO
capture label values usrace43    YESNO
capture label values usrace44    YESNO
capture label values usrace45    YESNO
capture label values usrace46    YESNO
capture label values usrace47    YESNO

*capture label values ushhi2      USHHI2   // ushhi2 not used starting in SPRING 2017. Use ushhi3 instead
capture label values ushhi3      USHHI3
capture label values hhcmp1      HHCMP1
capture label values sd2         SD2
* New in 2016 *
capture label values p1          P1
capture label values p3          P3
capture label values sd2a        YESNO
capture label values sd2b        YESNO
capture label values sd3a_1      YESNO
capture label values sd3a_2      YESNO
capture label values sd3a_3      YESNO
capture label values sd3a_4      YESNO
capture label values sd3a_5      YESNO
capture label values sd3a_6      YESNO
capture label values sd3a_7      YESNO
capture label values sd3a_8      YESNO
capture label values sd3a_9      YESNO
capture label values sd3a_10     YESNO
capture label values sd3a_11     YESNO
capture label values sd3a_12     YESNO
capture label values sd3a_13     YESNO
capture label values sd3a_14     YESNO
capture label values sd3a_15     YESNO
capture label values sd3a_16     YESNO
capture label values sd3a_17     YESNO
capture label values sd3a_18     YESNO
capture label values sd3a_19     YESNO
capture label values sd3b_1      YESNO
capture label values sd3b_2      YESNO
capture label values sd3b_3      YESNO
capture label values sd3b_4      YESNO
capture label values sd3b_5      YESNO
capture label values sd3b_6      YESNO
capture label values sd3b_7      YESNO
capture label values sd3b_8      YESNO
capture label values sd3b_9      YESNO
capture label values sd3b_10     YESNO
capture label values sd3b_11     YESNO
capture label values sd3b_12     YESNO
capture label values sd3b_13     YESNO
capture label values sd3b_14     YESNO
capture label values sd3b_15     YESNO
capture label values sd3b_16     YESNO
capture label values sd3b_17     YESNO
capture label values sd3b_18     YESNO
capture label values sd3b_19     YESNO
capture label values se1_a       YESNO
capture label values se1_b       YESNO
capture label values se1_c       YESNO
capture label values se1_d       YESNO
capture label values se1_e       YESNO
capture label values se1_f       YESNO
capture label values se1_g       YESNO
capture label values se1_h       YESNO
capture label values se1_i       YESNO
capture label values se1_j       YESNO
capture label values se2_b       SE2
capture label values se2_d       SE2
capture label values se2_f       SE2
capture label values se2_h       SE2
capture label values se3_b_1     YESNO
capture label values se3_b_2     YESNO
capture label values se3_b_3     YESNO
capture label values se3_b_4     YESNO
capture label values se3_b_5     YESNO
capture label values se3_d_1     YESNO
capture label values se3_d_2     YESNO
capture label values se3_d_3     YESNO
capture label values se3_d_4     YESNO
capture label values se3_d_5     YESNO
capture label values se3_f_1     YESNO
capture label values se3_f_2     YESNO
capture label values se3_f_3     YESNO
capture label values se3_f_4     YESNO
capture label values se3_f_5     YESNO
capture label values se3_h_1     YESNO
capture label values se3_h_2     YESNO
capture label values se3_h_3     YESNO
capture label values se3_h_4     YESNO
capture label values se3_h_5     YESNO
capture label values se2_a       SE2
capture label values se2_c       SE2
capture label values se2_e       SE2
capture label values se2_g       SE2
capture label values se3_a_1     YESNO
capture label values se3_a_2     YESNO
capture label values se3_a_3     YESNO
capture label values se3_a_4     YESNO
capture label values se3_a_5     YESNO
capture label values se3_c_1     YESNO
capture label values se3_c_2     YESNO
capture label values se3_c_3     YESNO
capture label values se3_c_4     YESNO
capture label values se3_c_5     YESNO
capture label values se3_e_1     YESNO
capture label values se3_e_2     YESNO
capture label values se3_e_3     YESNO
capture label values se3_e_4     YESNO
capture label values se3_e_5     YESNO
capture label values se3_g_1     YESNO
capture label values se3_g_2     YESNO
capture label values se3_g_3     YESNO
capture label values se3_g_4     YESNO
capture label values se3_g_5     YESNO
capture label values se5_a       YESNO
capture label values se5_b       YESNO
capture label values se5_c       YESNO
capture label values se5_d       YESNO
capture label values se5_e       YESNO
capture label values se5_f       YESNO
capture label values se5_g       YESNO
capture label values se5_h       YESNO
capture label values se5_i       YESNO
capture label values se5_j       YESNO
capture label values se5a_a      YESNO
capture label values se5a_b      YESNO
capture label values se5a_c      YESNO
capture label values se5a_d      YESNO
capture label values se5a_e      YESNO
capture label values se5a_f      YESNO
capture label values se5a_g      YESNO
capture label values se5a_h      YESNO
capture label values se6_b       SE2
capture label values se6_d       SE2
capture label values se6_f       SE2
capture label values se6_h       SE2
capture label values se6_a       SE2
capture label values se6_c       SE2
capture label values se6_e       SE2
capture label values se6_g       SE2
capture label values dchild_1    YESNO
capture label values dchild_2    YESNO
capture label values dchild_3    YESNO
capture label values dchild_4    YESNO
capture label values dchild_5    YESNO
capture label values dchild_6    YESNO
capture label values dchild_7    YESNO
capture label values dchild_8    YESNO
capture label values dchild_9    YESNO
capture label values dchild_10   YESNO
capture label values dchild_11   YESNO
capture label values dchild_12   YESNO
capture label values dchild_13   YESNO
capture label values dchild_14   YESNO
capture label values dchild_15   YESNO
capture label values dchild_16   YESNO
capture label values dchild_17   YESNO
capture label values dchild_18   YESNO
capture label values dchild_19   YESNO
capture label values dchild_20   YESNO
capture label values dchild_21   YESNO
capture label values dchild_22   YESNO
capture label values dchild_23   YESNO
capture label values dchild_24   YESNO
capture label values dchild_25   YESNO
capture label values dchild_26   YESNO
capture label values dchild_27   YESNO
capture label values dchild_28   YESNO
capture label values dchild_29   YESNO
capture label values dchild_30   YESNO
capture label values dchild_31   YESNO
capture label values dchild_32   YESNO
capture label values dchild_33   YESNO
capture label values dchild_34   YESNO
capture label values dchild_35   YESNO
capture label values dchild_36   YESNO
capture label values event_a     OCC2VAR
capture label values event_b     OCC2VAR
capture label values qb0a        QB0
capture label values qb0b        QB0
capture label values qb0aa_1     YESNO
capture label values qb0aa_2     YESNO
capture label values qb0aa_3     YESNO
capture label values qb0aa_4     YESNO
capture label values qb0aa_5     YESNO
capture label values qb0aa_6     YESNO
capture label values qb0aa_7     YESNO
capture label values qb0aa_8     YESNO
capture label values qb0aa_9     YESNO
capture label values qb0aa_10    YESNO
capture label values qb0aa_11    YESNO
capture label values qb0aa_12    YESNO
capture label values qb0aa_13    YESNO
capture label values qb0aa_14    YESNO
capture label values qb0aa_15    YESNO
capture label values qb0aa_16    YESNO
capture label values qb0aa_17    YESNO
capture label values qb0aa_18    YESNO
capture label values qb0ab_1     YESNO
capture label values qb0ab_2     YESNO
capture label values qb0ab_3     YESNO
capture label values qb0ab_4     YESNO
capture label values qb0ab_5     YESNO
capture label values qb0ab_6     YESNO
capture label values qb0ab_7     YESNO
capture label values qb0ab_8     YESNO
capture label values qb0ab_9     YESNO
capture label values qb0ab_10    YESNO
capture label values qb0ab_11    YESNO
capture label values qb0ab_12    YESNO
capture label values qb0ab_13    YESNO
capture label values qb0ab_14    YESNO
capture label values qb0ab_15    YESNO
capture label values qb0ab_16    YESNO
capture label values qb0ab_17    YESNO
capture label values qb0ab_18    YESNO
capture label values qb1aa_1     YESNO
capture label values qb1aa_2     YESNO
capture label values qb1aa_3     YESNO
capture label values qb1aa_4     YESNO
capture label values qb1ab_1     YESNO
capture label values qb1ab_2     YESNO
capture label values qb1ab_3     YESNO
capture label values qb1ab_4     YESNO
capture label values qb1ba       QB1B
capture label values qb1bb       QB1B
capture label values qb1da_1     YESNO
capture label values qb1da_2     YESNO
capture label values qb1da_3     YESNO
capture label values qb1da_4     YESNO
capture label values qb1da_5     YESNO
capture label values qb1da_6     YESNO
capture label values qb1db_1     YESNO
capture label values qb1db_2     YESNO
capture label values qb1db_3     YESNO
capture label values qb1db_4     YESNO
capture label values qb1db_5     YESNO
capture label values qb1db_6     YESNO
capture label values qb1fa_1     YESNO
capture label values qb1fa_2     YESNO
capture label values qb1fa_3     YESNO
capture label values qb1fa_4     YESNO
capture label values qb1fa_5     YESNO
capture label values qb1fb_1     YESNO
capture label values qb1fb_2     YESNO
capture label values qb1fb_3     YESNO
capture label values qb1fb_4     YESNO
capture label values qb1fb_5     YESNO
capture label values qb1ha_1     YESNO
capture label values qb1ha_2     YESNO
capture label values qb1ha_3     YESNO
capture label values qb1hb_1     YESNO
capture label values qb1hb_2     YESNO
capture label values qb1hb_3     YESNO

* New in 2016 *
capture label values qb1ia_1     YESNO
capture label values qb1ia_2     YESNO
capture label values qb1ia_3     YESNO
capture label values qb1ia_4     YESNO
capture label values qb1ia_5     YESNO
capture label values qb1ia_6     YESNO
capture label values qb1ib_1     YESNO
capture label values qb1ib_2     YESNO
capture label values qb1ib_3     YESNO
capture label values qb1ib_4     YESNO
capture label values qb1ib_5     YESNO
capture label values qb1ib_6     YESNO

capture label values qb2aa       QB2A
capture label values qb2ab       QB2A
capture label values qb2ba_1     YESNO
capture label values qb2ba_2     YESNO
capture label values qb2ba_3     YESNO
capture label values qb2ba_4     YESNO
capture label values qb2ba_5     YESNO
capture label values qb2ba_6     YESNO
capture label values qb2ba_7     YESNO
capture label values qb2ba_8     YESNO
capture label values qb2ba_9     YESNO
capture label values qb2ba_10    YESNO

* New in 2019 *
capture label values qb2ba_12    YESNO

capture label values qb2ba_11    YESNO
capture label values qb2bb_1     YESNO
capture label values qb2bb_2     YESNO
capture label values qb2bb_3     YESNO
capture label values qb2bb_4     YESNO
capture label values qb2bb_5     YESNO
capture label values qb2bb_6     YESNO
capture label values qb2bb_7     YESNO
capture label values qb2bb_8     YESNO
capture label values qb2bb_9     YESNO
capture label values qb2bb_10    YESNO

* New in 2019 *
capture label values qb2bb_12    YESNO

capture label values qb2bb_11    YESNO
capture label values qb2ca       QB2C
capture label values qb2cb       QB2C
capture label values qb2da_1     YESNO
capture label values qb2da_2     YESNO
capture label values qb2da_3     YESNO
capture label values qb2da_4     YESNO
capture label values qb2da_5     YESNO
capture label values qb2da_6     YESNO
capture label values qb2da_7     YESNO
capture label values qb2da_8     YESNO
capture label values qb2da_9     YESNO
capture label values qb2da_10    YESNO
capture label values qb2da_11    YESNO
capture label values qb2db_1     YESNO
capture label values qb2db_2     YESNO
capture label values qb2db_3     YESNO
capture label values qb2db_4     YESNO
capture label values qb2db_5     YESNO
capture label values qb2db_6     YESNO
capture label values qb2db_7     YESNO
capture label values qb2db_8     YESNO
capture label values qb2db_9     YESNO
capture label values qb2db_10    YESNO
capture label values qb2db_11    YESNO
capture label values qb2ea       QB2E
capture label values qb2eb       QB2E
capture label values qb2fa       QB2F
capture label values qb2fb       QB2F

* New in 2018 *
capture label values qb2ja_1     YESNO
capture label values qb2ja_2     YESNO
capture label values qb2ja_3     YESNO
capture label values qb2ja_4     YESNO
capture label values qb2ja_5     YESNO
capture label values qb2ja_6     YESNO
capture label values qb2ja_7     YESNO
capture label values qb2ja_8     YESNO
capture label values qb2ja_9     YESNO
capture label values qb2ja_10    YESNO
capture label values qb2ja_11    YESNO
capture label values qb2ja_12    YESNO
capture label values qb2ja_13    YESNO
capture label values qb2ja_14    YESNO
capture label values qb2ja_15    YESNO
capture label values qb2ja_16    YESNO
capture label values qb2ja_17    YESNO
capture label values qb2jb_1     YESNO
capture label values qb2jb_2     YESNO
capture label values qb2jb_3     YESNO
capture label values qb2jb_4     YESNO
capture label values qb2jb_5     YESNO
capture label values qb2jb_6     YESNO
capture label values qb2jb_7     YESNO
capture label values qb2jb_8     YESNO
capture label values qb2jb_9     YESNO
capture label values qb2jb_10    YESNO
capture label values qb2jb_11    YESNO
capture label values qb2jb_12    YESNO
capture label values qb2jb_13    YESNO
capture label values qb2jb_14    YESNO
capture label values qb2jb_15    YESNO
capture label values qb2jb_16    YESNO
capture label values qb2jb_17    YESNO

capture label values qb2ga       QB2G
capture label values qb2gb       QB2G
capture label values qb2ha       QB2H
capture label values qb2hb       QB2H
capture label values qb2ia       QB2I
capture label values qb2ib       QB2I
capture label values qb3aa       QB3A
capture label values qb3ab       QB3A
capture label values qb3ba       QB3B
capture label values qb3bb       QB3B
capture label values qb3da_1     YESNO
capture label values qb3da_2     YESNO
capture label values qb3da_3     YESNO
capture label values qb3da_4     YESNO
capture label values qb3da_5     YESNO
capture label values qb3da_6     YESNO
capture label values qb3da_7     YESNO
capture label values qb3da_8     YESNO
capture label values qb3da_9     YESNO
capture label values qb3da_10    YESNO
capture label values qb3db_1     YESNO
capture label values qb3db_2     YESNO
capture label values qb3db_3     YESNO
capture label values qb3db_4     YESNO
capture label values qb3db_5     YESNO
capture label values qb3db_6     YESNO
capture label values qb3db_7     YESNO
capture label values qb3db_8     YESNO
capture label values qb3db_9     YESNO
capture label values qb3db_10    YESNO
capture label values qb3ca       QB3C
capture label values qb3cb       QB3C

* New in 2016 *
capture label values qb3ea       QB3E
capture label values qb3eb       QB3E

capture label values qb4aa       QB4A
capture label values qb4ab       QB4A
capture label values qb4ba       YESNO
capture label values qb4bb       YESNO
capture label values qb4ca_1     YESNO
capture label values qb4ca_2     YESNO
capture label values qb4ca_3     YESNO
capture label values qb4ca_4     YESNO
capture label values qb4ca_5     YESNO
capture label values qb4ca_6     YESNO
capture label values qb4ca_7     YESNO
capture label values qb4ca_8     YESNO
capture label values qb4ca_9     YESNO
capture label values qb4ca_10    YESNO
capture label values qb4ca_11    YESNO
capture label values qb4ca_12    YESNO
capture label values qb4ca_13    YESNO
capture label values qb4cb_1     YESNO
capture label values qb4cb_2     YESNO
capture label values qb4cb_3     YESNO
capture label values qb4cb_4     YESNO
capture label values qb4cb_5     YESNO
capture label values qb4cb_6     YESNO
capture label values qb4cb_7     YESNO
capture label values qb4cb_8     YESNO
capture label values qb4cb_9     YESNO
capture label values qb4cb_10    YESNO
capture label values qb4cb_11    YESNO
capture label values qb4cb_12    YESNO
capture label values qb4cb_13    YESNO

* New in 2019 *
capture label values qb4da    	 QB4D
capture label values qb4db    	 QB4D
capture label values qb5aa       QB5A
capture label values qb5ab       QB5A
capture label values qb5ba       QB5B
capture label values qb5bb       QB5B
capture label values qb5ca_1     YESNO
capture label values qb5ca_2     YESNO
capture label values qb5ca_3     YESNO
capture label values qb5ca_4     YESNO
capture label values qb5ca_5     YESNO
capture label values qb5cb_1     YESNO
capture label values qb5cb_2     YESNO
capture label values qb5cb_3     YESNO
capture label values qb5cb_4     YESNO
capture label values qb5cb_5     YESNO
capture label values qb5da_43    YESNO
capture label values qb5da_44    YESNO
capture label values qb5da_45    YESNO
capture label values qb5da_46    YESNO
capture label values qb5da_47    YESNO
capture label values qb5da_48    YESNO
capture label values qb5da_49    YESNO
capture label values qb5da_50    YESNO
capture label values qb5da_51    YESNO
capture label values qb5da_52    YESNO
capture label values qb5da_53    YESNO
capture label values qb5da_54    YESNO
capture label values qb5da_55    YESNO
capture label values qb5da_56    YESNO
capture label values qb5da_57    YESNO
capture label values qb5da_42    YESNO
capture label values qb5da_3     YESNO
capture label values qb5da_58    YESNO
capture label values qb5da_21    YESNO
capture label values qb5da_35    YESNO
capture label values qb5da_59    YESNO
capture label values qb5da_60    YESNO
capture label values qb5da_62    YESNO
capture label values qb5da_17    YESNO
capture label values qb5da_19    YESNO
capture label values qb5da_20    YESNO
capture label values qb5da_63    YESNO
capture label values qb5da_64    YESNO
capture label values qb5da_26    YESNO
capture label values qb5da_28    YESNO
capture label values qb5da_2     YESNO
capture label values qb5da_30    YESNO
capture label values qb5da_31    YESNO
capture label values qb5da_65    YESNO
capture label values qb5da_34    YESNO
capture label values qb5da_22    YESNO
capture label values qb5da_66    YESNO
capture label values qb5da_37    YESNO
capture label values qb5da_38    YESNO
capture label values qb5db_43    YESNO
capture label values qb5db_44    YESNO
capture label values qb5db_45    YESNO
capture label values qb5db_46    YESNO
capture label values qb5db_47    YESNO
capture label values qb5db_48    YESNO
capture label values qb5db_49    YESNO
capture label values qb5db_50    YESNO
capture label values qb5db_51    YESNO
capture label values qb5db_52    YESNO
capture label values qb5db_53    YESNO
capture label values qb5db_54    YESNO
capture label values qb5db_55    YESNO
capture label values qb5db_56    YESNO
capture label values qb5db_57    YESNO
capture label values qb5db_42    YESNO
capture label values qb5db_3     YESNO
capture label values qb5db_58    YESNO
capture label values qb5db_21    YESNO
capture label values qb5db_35    YESNO
capture label values qb5db_59    YESNO
capture label values qb5db_60    YESNO
capture label values qb5db_62    YESNO
capture label values qb5db_17    YESNO
capture label values qb5db_19    YESNO
capture label values qb5db_20    YESNO
capture label values qb5db_63    YESNO
capture label values qb5db_64    YESNO
capture label values qb5db_26    YESNO
capture label values qb5db_28    YESNO
capture label values qb5db_2     YESNO
capture label values qb5db_30    YESNO
capture label values qb5db_31    YESNO
capture label values qb5db_65    YESNO
capture label values qb5db_34    YESNO
capture label values qb5db_22    YESNO
capture label values qb5db_66    YESNO
capture label values qb5db_37    YESNO
capture label values qb5db_38    YESNO

capture label values q01a_1      Q01
capture label values q01a_2      Q01
capture label values q01a_3      Q01
capture label values q01a_4      Q01
capture label values q01a_5      Q01
capture label values q01a_6      Q01
capture label values q01b_1      Q01
capture label values q01b_2      Q01
capture label values q01b_3      Q01
capture label values q01b_4      Q01
capture label values q01b_5      Q01
capture label values q01b_6      Q01
forvalues i=1/20 {
   foreach a in a b {
      capture label values q02`a'_`i'     YESNO
      capture label values q02a`a'_`i'    YESNO
      capture label values q02b`a'_`i'    YESNO
   }
}
*forvalues i=1/19 {   * PRE 2018 *
forvalues i=1/25 {   /* New in 2018 */
   foreach a in a b {
      capture label values q03`a'_`i'     Q03
   }
}
*forvalues i=1/17 {   * PRE 2018 *
forvalues i=1/18 {   /* New in 2018 for q03aa_18 and q03ab_18 */
   foreach a in a b {
*      forvalues j=97/105 {
      forvalues j=97/107 {   /* New in 2018 for q03j and q03k */
         local l = char(`j')
      capture label values q03`l'`a'_`i'     YESNO
      }
   }
}
capture label values q04aa       YESNO
capture label values q04ab       YESNO
capture label values q04ba       Q04B
capture label values q04bb       Q04B

* New in 2016 *
capture label values q04fa       Q04F
capture label values q04fb       Q04F

capture label values q04ca       Q04C
capture label values q04cb       Q04C
capture label values q04a_1      YESNO
capture label values q04a_2      YESNO
capture label values q04a_3      YESNO
capture label values q04a_4      YESNO
capture label values q04a_5      YESNO
capture label values q04a_6      YESNO
capture label values q04a_7      YESNO
capture label values q04a_8      YESNO
capture label values q04a_9      YESNO
capture label values q04a_10     YESNO
capture label values q04a_11     YESNO
capture label values q04a_12     YESNO
capture label values q04a_14     YESNO
capture label values q04a_15     YESNO
capture label values q04a_16     YESNO
capture label values q04a_17     YESNO
capture label values q04a_18     YESNO
capture label values q04a_19     YESNO
capture label values q04a_21     YESNO
capture label values q04a_22     YESNO
capture label values q04a_23     YESNO
capture label values q04a_27     YESNO
capture label values q04a_28     YESNO
capture label values q04a_29     YESNO
capture label values q04a_30     YESNO
capture label values q04a_31     YESNO
capture label values q04a_33     YESNO
capture label values q04a_34     YESNO
capture label values q04a_35     YESNO
capture label values q04a_36     YESNO
capture label values q04a_37     YESNO
capture label values q04a_39     YESNO
capture label values q04a_40     YESNO
capture label values q04a_41     YESNO
capture label values q04a_42     YESNO
capture label values q04a_43     YESNO
capture label values q04b_1      YESNO
capture label values q04b_2      YESNO
capture label values q04b_3      YESNO
capture label values q04b_4      YESNO
capture label values q04b_5      YESNO
capture label values q04b_6      YESNO
capture label values q04b_7      YESNO
capture label values q04b_8      YESNO
capture label values q04b_9      YESNO
capture label values q04b_10     YESNO
capture label values q04b_11     YESNO
capture label values q04b_12     YESNO
capture label values q04b_14     YESNO
capture label values q04b_15     YESNO
capture label values q04b_16     YESNO
capture label values q04b_17     YESNO
capture label values q04b_18     YESNO
capture label values q04b_19     YESNO
capture label values q04b_21     YESNO
capture label values q04b_22     YESNO
capture label values q04b_23     YESNO
capture label values q04b_27     YESNO
capture label values q04b_28     YESNO
capture label values q04b_29     YESNO
capture label values q04b_30     YESNO
capture label values q04b_31     YESNO
capture label values q04b_33     YESNO
capture label values q04b_34     YESNO
capture label values q04b_35     YESNO
capture label values q04b_36     YESNO
capture label values q04b_37     YESNO
capture label values q04b_39     YESNO
capture label values q04b_40     YESNO
capture label values q04b_41     YESNO
capture label values q04b_42     YESNO
capture label values q04b_43     YESNO
capture label values q04da_1     Q04D
capture label values q04da_2     Q04D
capture label values q04da_3     Q04D
capture label values q04da_4     Q04D
capture label values q04da_5     Q04D
capture label values q04db_1     Q04D
capture label values q04db_2     Q04D
capture label values q04db_3     Q04D
capture label values q04db_4     Q04D
capture label values q04db_5     Q04D
capture label values q04ea_1     YESNO
capture label values q04ea_2     YESNO
capture label values q04ea_3     YESNO
capture label values q04ea_4     YESNO
capture label values q04ea_5     YESNO
capture label values q04ea_6     YESNO
capture label values q04eb_1     YESNO
capture label values q04eb_2     YESNO
capture label values q04eb_3     YESNO
capture label values q04eb_4     YESNO
capture label values q04eb_5     YESNO
capture label values q04eb_6     YESNO
capture label values q05a_1      YESNO
capture label values q05a_4      YESNO
capture label values q05a_5      YESNO
capture label values q05a_6      YESNO
capture label values q05b_1      YESNO
capture label values q05b_4      YESNO
capture label values q05b_5      YESNO
capture label values q05b_6      YESNO
capture label values q05aa_1     Q05A
capture label values q05aa_4     Q05A
capture label values q05aa_5     Q05A
capture label values q05aa_6     Q05A
capture label values q05ab_1     Q05A
capture label values q05ab_4     Q05A
capture label values q05ab_5     Q05A
capture label values q05ab_6     Q05A
capture label values q06a_1      YESNO
capture label values q06a_2      YESNO
capture label values q06a_3      YESNO
capture label values q06a_4      YESNO
capture label values q06a_5      YESNO
capture label values q06a_6      YESNO
capture label values q06a_7      YESNO
capture label values q06a_8      YESNO
capture label values q06a_9      YESNO
capture label values q06a_10     YESNO
capture label values q06a_11     YESNO
capture label values q06a_12     YESNO
capture label values q06a_13     YESNO
capture label values q06a_14     YESNO
capture label values q06a_15     YESNO
capture label values q06a_16     YESNO
capture label values q06a_17     YESNO
capture label values q06a_18     YESNO
capture label values q06a_19     YESNO
capture label values q06a_20     YESNO
capture label values q06a_21     YESNO
capture label values q06a_22     YESNO
capture label values q06a_23     YESNO
capture label values q06a_24     YESNO
capture label values q06a_25     YESNO
capture label values q06b_1      YESNO
capture label values q06b_2      YESNO
capture label values q06b_3      YESNO
capture label values q06b_4      YESNO
capture label values q06b_5      YESNO
capture label values q06b_6      YESNO
capture label values q06b_7      YESNO
capture label values q06b_8      YESNO
capture label values q06b_9      YESNO
capture label values q06b_10     YESNO
capture label values q06b_11     YESNO
capture label values q06b_12     YESNO
capture label values q06b_13     YESNO
capture label values q06b_14     YESNO
capture label values q06b_15     YESNO
capture label values q06b_16     YESNO
capture label values q06b_17     YESNO
capture label values q06b_18     YESNO
capture label values q06b_19     YESNO
capture label values q06b_20     YESNO
capture label values q06b_21     YESNO
capture label values q06b_22     YESNO
capture label values q06b_23     YESNO
capture label values q06b_24     YESNO
capture label values q06b_25     YESNO
capture label values q06aa_1     Q06A
capture label values q06aa_2     Q06A
capture label values q06aa_3     Q06A
capture label values q06aa_4     Q06A
capture label values q06aa_5     Q06A
capture label values q06aa_6     Q06A
capture label values q06aa_7     Q06A
capture label values q06aa_8     Q06A
capture label values q06aa_9     Q06A
capture label values q06aa_10    Q06A
capture label values q06aa_11    Q06A
capture label values q06aa_12    Q06A
capture label values q06aa_13    Q06A
capture label values q06aa_14    Q06A
capture label values q06aa_15    Q06A
capture label values q06aa_16    Q06A
capture label values q06aa_17    Q06A
capture label values q06aa_18    Q06A
capture label values q06aa_19    Q06A
capture label values q06aa_20    Q06A
capture label values q06aa_21    Q06A
capture label values q06aa_22    Q06A
capture label values q06aa_23    Q06A
capture label values q06aa_24    Q06A
capture label values q06aa_25    Q06A
capture label values q06ab_1     Q06A
capture label values q06ab_2     Q06A
capture label values q06ab_3     Q06A
capture label values q06ab_4     Q06A
capture label values q06ab_5     Q06A
capture label values q06ab_6     Q06A
capture label values q06ab_7     Q06A
capture label values q06ab_8     Q06A
capture label values q06ab_9     Q06A
capture label values q06ab_10    Q06A
capture label values q06ab_11    Q06A
capture label values q06ab_12    Q06A
capture label values q06ab_13    Q06A
capture label values q06ab_14    Q06A
capture label values q06ab_15    Q06A
capture label values q06ab_16    Q06A
capture label values q06ab_17    Q06A
capture label values q06ab_18    Q06A
capture label values q06ab_19    Q06A
capture label values q06ab_20    Q06A
capture label values q06ab_21    Q06A
capture label values q06ab_22    Q06A
capture label values q06ab_23    Q06A
capture label values q06ab_24    Q06A
capture label values q06ab_25    Q06A
capture label values q07a_1      YESNO
capture label values q07a_2      YESNO
capture label values q07a_3      YESNO
capture label values q07a_4      YESNO
capture label values q07a_5      YESNO
capture label values q07a_6      YESNO
capture label values q07a_7      YESNO
capture label values q07a_8      YESNO
capture label values q07a_9      YESNO
capture label values q07a_10     YESNO
capture label values q07b_1      YESNO
capture label values q07b_2      YESNO
capture label values q07b_3      YESNO
capture label values q07b_4      YESNO
capture label values q07b_5      YESNO
capture label values q07b_6      YESNO
capture label values q07b_7      YESNO
capture label values q07b_8      YESNO
capture label values q07b_9      YESNO
capture label values q07b_10     YESNO
capture label values q07aa_1     Q07A
capture label values q07aa_2     Q07A
capture label values q07aa_3     Q07A
capture label values q07aa_4     Q07A
capture label values q07aa_5     Q07A
capture label values q07aa_6     Q07A
capture label values q07aa_7     Q07A
capture label values q07aa_8     Q07A
capture label values q07aa_9     Q07A
capture label values q07aa_10    Q07A
capture label values q07ab_1     Q07A
capture label values q07ab_2     Q07A
capture label values q07ab_3     Q07A
capture label values q07ab_4     Q07A
capture label values q07ab_5     Q07A
capture label values q07ab_6     Q07A
capture label values q07ab_7     Q07A
capture label values q07ab_8     Q07A
capture label values q07ab_9     Q07A
capture label values q07ab_10    Q07A
capture label values q08a_1      YESNO
capture label values q08a_2      YESNO
capture label values q08a_3      YESNO
capture label values q08a_4      YESNO
capture label values q08a_5      YESNO
capture label values q08a_6      YESNO
capture label values q08a_7      YESNO
capture label values q08a_8      YESNO
capture label values q08a_9      YESNO
capture label values q08a_10     YESNO
capture label values q08a_11     YESNO
capture label values q08a_12     YESNO
capture label values q08a_13     YESNO
capture label values q08b_1      YESNO
capture label values q08b_2      YESNO
capture label values q08b_3      YESNO
capture label values q08b_4      YESNO
capture label values q08b_5      YESNO
capture label values q08b_6      YESNO
capture label values q08b_7      YESNO
capture label values q08b_8      YESNO
capture label values q08b_9      YESNO
capture label values q08b_10     YESNO
capture label values q08b_11     YESNO
capture label values q08b_12     YESNO
capture label values q08b_13     YESNO
capture label values q08aa_1     Q08A
capture label values q08aa_2     Q08A
capture label values q08aa_3     Q08A
capture label values q08aa_4     Q08A
capture label values q08aa_5     Q08A
capture label values q08aa_6     Q08A
capture label values q08aa_7     Q08A
capture label values q08aa_8     Q08A
capture label values q08aa_9     Q08A
capture label values q08aa_10    Q08A
capture label values q08aa_11    Q08A
capture label values q08aa_12    Q08A
capture label values q08aa_13    Q08A
capture label values q08ab_1     Q08A
capture label values q08ab_2     Q08A
capture label values q08ab_3     Q08A
capture label values q08ab_4     Q08A
capture label values q08ab_5     Q08A
capture label values q08ab_6     Q08A
capture label values q08ab_7     Q08A
capture label values q08ab_8     Q08A
capture label values q08ab_9     Q08A
capture label values q08ab_10    Q08A
capture label values q08ab_11    Q08A
capture label values q08ab_12    Q08A
capture label values q08ab_13    Q08A
capture label values q10a_1      YESNO
capture label values q10a_2      YESNO
capture label values q10a_3      YESNO
capture label values q10a_4      YESNO
capture label values q10a_5      YESNO
capture label values q10b_1      YESNO
capture label values q10b_2      YESNO
capture label values q10b_3      YESNO
capture label values q10b_4      YESNO
capture label values q10b_5      YESNO
capture label values q10aa_1     Q10A
capture label values q10aa_2     Q10A
capture label values q10aa_3     Q10A
capture label values q10aa_4     Q10A
capture label values q10aa_5     Q10A
capture label values q10ab_1     Q10A
capture label values q10ab_2     Q10A
capture label values q10ab_3     Q10A
capture label values q10ab_4     Q10A
capture label values q10ab_5     Q10A
capture label values q11a_1      YESNO
capture label values q11a_2      YESNO
capture label values q11a_3      YESNO
capture label values q11a_4      YESNO
capture label values q11a_5      YESNO
capture label values q11a_6      YESNO
capture label values q11a_7      YESNO
capture label values q11a_8      YESNO
capture label values q11a_9      YESNO
capture label values q11a_10     YESNO
capture label values q11a_11     YESNO
capture label values q11a_12     YESNO
capture label values q11a_13     YESNO
capture label values q11a_14     YESNO
capture label values q11a_15     YESNO
capture label values q11a_16     YESNO
capture label values q11a_17     YESNO
capture label values q11a_18     YESNO
capture label values q11a_19     YESNO
capture label values q11a_20     YESNO
capture label values q11b_1      YESNO
capture label values q11b_2      YESNO
capture label values q11b_3      YESNO
capture label values q11b_4      YESNO
capture label values q11b_5      YESNO
capture label values q11b_6      YESNO
capture label values q11b_7      YESNO
capture label values q11b_8      YESNO
capture label values q11b_9      YESNO
capture label values q11b_10     YESNO
capture label values q11b_11     YESNO
capture label values q11b_12     YESNO
capture label values q11b_13     YESNO
capture label values q11b_14     YESNO
capture label values q11b_15     YESNO
capture label values q11b_16     YESNO
capture label values q11b_17     YESNO
capture label values q11b_18     YESNO
capture label values q11b_19     YESNO
capture label values q11b_20     YESNO
capture label values q11aa_1     Q11A
capture label values q11aa_2     Q11A
capture label values q11aa_3     Q11A
capture label values q11aa_4     Q11A
capture label values q11aa_5     Q11A
capture label values q11aa_6     Q11A
capture label values q11aa_7     Q11A
capture label values q11aa_8     Q11A
capture label values q11aa_9     Q11A
capture label values q11aa_10    Q11A
capture label values q11aa_11    Q11A
capture label values q11aa_12    Q11A
capture label values q11aa_13    Q11A
capture label values q11aa_14    Q11A
capture label values q11aa_15    Q11A
capture label values q11aa_16    Q11A
capture label values q11aa_17    Q11A
capture label values q11aa_18    Q11A
capture label values q11aa_19    Q11A
capture label values q11aa_20    Q11A
capture label values q11ab_1     Q11A
capture label values q11ab_2     Q11A
capture label values q11ab_3     Q11A
capture label values q11ab_4     Q11A
capture label values q11ab_5     Q11A
capture label values q11ab_6     Q11A
capture label values q11ab_7     Q11A
capture label values q11ab_8     Q11A
capture label values q11ab_9     Q11A
capture label values q11ab_10    Q11A
capture label values q11ab_11    Q11A
capture label values q11ab_12    Q11A
capture label values q11ab_13    Q11A
capture label values q11ab_14    Q11A
capture label values q11ab_15    Q11A
capture label values q11ab_16    Q11A
capture label values q11ab_17    Q11A
capture label values q11ab_18    Q11A
capture label values q11ab_19    Q11A
capture label values q11ab_20    Q11A
* New in 2018 *
capture label values q11ba_1     YESNO
capture label values q11ba_2     YESNO
capture label values q11ba_3     YESNO
capture label values q11ba_4     YESNO
capture label values q11ba_5     YESNO
capture label values q11ba_6     YESNO
capture label values q11ba_7     YESNO
capture label values q11ba_8     YESNO
capture label values q11ba_9     YESNO
capture label values q11ba_10    YESNO
capture label values q11ba_11    YESNO
capture label values q11bb_1     YESNO
capture label values q11bb_2     YESNO
capture label values q11bb_3     YESNO
capture label values q11bb_4     YESNO
capture label values q11bb_5     YESNO
capture label values q11bb_6     YESNO
capture label values q11bb_7     YESNO
capture label values q11bb_8     YESNO
capture label values q11bb_9     YESNO
capture label values q11bb_10    YESNO
capture label values q11bb_11    YESNO
capture label values q12a_1      YESNO
capture label values q12a_2      YESNO
capture label values q12a_3      YESNO
capture label values q12a_4      YESNO
capture label values q12a_5      YESNO
capture label values q12a_6      YESNO
capture label values q12a_7      YESNO
capture label values q12a_8      YESNO
capture label values q12a_9      YESNO
capture label values q12a_10     YESNO
capture label values q12a_11     YESNO
capture label values q12a_12     YESNO
capture label values q12b_1      YESNO
capture label values q12b_2      YESNO
capture label values q12b_3      YESNO
capture label values q12b_4      YESNO
capture label values q12b_5      YESNO
capture label values q12b_6      YESNO
capture label values q12b_7      YESNO
capture label values q12b_8      YESNO
capture label values q12b_9      YESNO
capture label values q12b_10     YESNO
capture label values q12b_11     YESNO
capture label values q12b_12     YESNO
capture label values q13a_1      YESNO
capture label values q13a_2      YESNO
capture label values q13a_3      YESNO
capture label values q13a_4      YESNO
capture label values q13a_5      YESNO
capture label values q13a_6      YESNO
capture label values q13a_7      YESNO
capture label values q13a_8      YESNO
capture label values q13a_9      YESNO
capture label values q13a_10     YESNO
capture label values q13a_11     YESNO
capture label values q13a_12     YESNO
capture label values q13a_13     YESNO
capture label values q13b_1      YESNO
capture label values q13b_2      YESNO
capture label values q13b_3      YESNO
capture label values q13b_4      YESNO
capture label values q13b_5      YESNO
capture label values q13b_6      YESNO
capture label values q13b_7      YESNO
capture label values q13b_8      YESNO
capture label values q13b_9      YESNO
capture label values q13b_10     YESNO
capture label values q13b_11     YESNO
capture label values q13b_12     YESNO
capture label values q13b_13     YESNO
capture label values q14a_1      YESNO
capture label values q14a_2      YESNO
capture label values q14a_3      YESNO
capture label values q14a_4      YESNO
capture label values q14a_5      YESNO
capture label values q14a_6      YESNO
capture label values q14a_7      YESNO
capture label values q14a_8      YESNO
capture label values q14a_9      YESNO
capture label values q14a_10     YESNO
capture label values q14a_11     YESNO
capture label values q14a_12     YESNO
capture label values q14a_13     YESNO
capture label values q14a_14     YESNO
capture label values q14a_15     YESNO
capture label values q14a_16     YESNO
capture label values q14a_17     YESNO
capture label values q14a_18     YESNO
capture label values q14a_19     YESNO
capture label values q14a_20     YESNO
capture label values q14a_21     YESNO
capture label values q14a_23     YESNO
capture label values q14a_25     YESNO
capture label values q14a_27     YESNO
capture label values q14a_28     YESNO
capture label values q14a_30     YESNO
capture label values q14a_31     YESNO
capture label values q14b_1      YESNO
capture label values q14b_2      YESNO
capture label values q14b_3      YESNO
capture label values q14b_4      YESNO
capture label values q14b_5      YESNO
capture label values q14b_6      YESNO
capture label values q14b_7      YESNO
capture label values q14b_8      YESNO
capture label values q14b_9      YESNO
capture label values q14b_10     YESNO
capture label values q14b_11     YESNO
capture label values q14b_12     YESNO
capture label values q14b_13     YESNO
capture label values q14b_14     YESNO
capture label values q14b_15     YESNO
capture label values q14b_16     YESNO
capture label values q14b_17     YESNO
capture label values q14b_18     YESNO
capture label values q14b_19     YESNO
capture label values q14b_20     YESNO
capture label values q14b_21     YESNO
capture label values q14b_23     YESNO
capture label values q14b_25     YESNO
capture label values q14b_27     YESNO
capture label values q14b_28     YESNO
capture label values q14b_30     YESNO
capture label values q14b_31     YESNO
capture label values q14aa_1     Q14A
capture label values q14aa_2     Q14A
capture label values q14aa_3     Q14A
capture label values q14aa_4     Q14A
capture label values q14aa_5     Q14A
capture label values q14aa_6     Q14A
capture label values q14aa_7     Q14A
capture label values q14aa_8     Q14A
capture label values q14aa_9     Q14A
capture label values q14aa_10    Q14A
capture label values q14aa_11    Q14A
capture label values q14aa_12    Q14A
capture label values q14aa_13    Q14A
capture label values q14aa_14    Q14A
capture label values q14aa_15    Q14A
capture label values q14aa_16    Q14A
capture label values q14aa_17    Q14A
capture label values q14aa_18    Q14A
capture label values q14aa_19    Q14A
capture label values q14aa_20    Q14A
capture label values q14aa_21    Q14A
capture label values q14aa_23    Q14A
capture label values q14aa_25    Q14A
capture label values q14aa_27    Q14A
capture label values q14aa_28    Q14A
capture label values q14aa_30    Q14A
capture label values q14aa_31    Q14A
capture label values q14ab_1     Q14A
capture label values q14ab_2     Q14A
capture label values q14ab_3     Q14A
capture label values q14ab_4     Q14A
capture label values q14ab_5     Q14A
capture label values q14ab_6     Q14A
capture label values q14ab_7     Q14A
capture label values q14ab_8     Q14A
capture label values q14ab_9     Q14A
capture label values q14ab_10    Q14A
capture label values q14ab_11    Q14A
capture label values q14ab_12    Q14A
capture label values q14ab_13    Q14A
capture label values q14ab_14    Q14A
capture label values q14ab_15    Q14A
capture label values q14ab_16    Q14A
capture label values q14ab_17    Q14A
capture label values q14ab_18    Q14A
capture label values q14ab_19    Q14A
capture label values q14ab_20    Q14A
capture label values q14ab_21    Q14A
capture label values q14ab_23    Q14A
capture label values q14ab_25    Q14A
capture label values q14ab_27    Q14A
capture label values q14ab_28    Q14A
capture label values q14ab_30    Q14A
capture label values q14ab_31    Q14A
capture label values q15a_1      YESNO
capture label values q15a_2      YESNO
capture label values q15a_3      YESNO
capture label values q15a_4      YESNO
capture label values q15a_5      YESNO
capture label values q15a_6      YESNO
capture label values q15a_7      YESNO
capture label values q15b_1      YESNO
capture label values q15b_2      YESNO
capture label values q15b_3      YESNO
capture label values q15b_4      YESNO
capture label values q15b_5      YESNO
capture label values q15b_6      YESNO
capture label values q15b_7      YESNO
capture label values q15aa_1     Q15A
capture label values q15aa_2     Q15A
capture label values q15aa_3     Q15A
capture label values q15aa_4     Q15A
capture label values q15aa_5     Q15A
capture label values q15aa_6     Q15A
capture label values q15aa_7     Q15A
capture label values q15ab_1     Q15A
capture label values q15ab_2     Q15A
capture label values q15ab_3     Q15A
capture label values q15ab_4     Q15A
capture label values q15ab_5     Q15A
capture label values q15ab_6     Q15A
capture label values q15ab_7     Q15A
capture label values q16a_1      YESNO
capture label values q16a_2      YESNO
capture label values q16a_3      YESNO
capture label values q16a_4      YESNO
capture label values q16a_5      YESNO
capture label values q16a_6      YESNO
capture label values q16a_7      YESNO
capture label values q16a_8      YESNO
capture label values q16a_9      YESNO
capture label values q16a_10     YESNO
capture label values q16a_11     YESNO
capture label values q16b_1      YESNO
capture label values q16b_2      YESNO
capture label values q16b_3      YESNO
capture label values q16b_4      YESNO
capture label values q16b_5      YESNO
capture label values q16b_6      YESNO
capture label values q16b_7      YESNO
capture label values q16b_8      YESNO
capture label values q16b_9      YESNO
capture label values q16b_10     YESNO
capture label values q16b_11     YESNO
capture label values q16aa_1     Q16A
capture label values q16aa_2     Q16A
capture label values q16aa_3     Q16A
capture label values q16aa_4     Q16A
capture label values q16aa_5     Q16A
capture label values q16aa_6     Q16A
capture label values q16aa_7     Q16A
capture label values q16aa_8     Q16A
capture label values q16aa_9     Q16A
capture label values q16aa_10    Q16A
capture label values q16aa_11    Q16A
capture label values q16ab_1     Q16A
capture label values q16ab_2     Q16A
capture label values q16ab_3     Q16A
capture label values q16ab_4     Q16A
capture label values q16ab_5     Q16A
capture label values q16ab_6     Q16A
capture label values q16ab_7     Q16A
capture label values q16ab_8     Q16A
capture label values q16ab_9     Q16A
capture label values q16ab_10    Q16A
capture label values q16ab_11    Q16A
capture label values q17a_1      YESNO
capture label values q17a_2      YESNO
capture label values q17a_3      YESNO
capture label values q17a_4      YESNO
capture label values q17a_5      YESNO
capture label values q17a_6      YESNO
capture label values q17a_7      YESNO
capture label values q17a_8      YESNO
capture label values q17a_9      YESNO
capture label values q17a_10     YESNO
capture label values q17a_11     YESNO
capture label values q17a_12     YESNO
capture label values q17a_13     YESNO   /* New in 2018 */
capture label values q17b_1      YESNO
capture label values q17b_2      YESNO
capture label values q17b_3      YESNO
capture label values q17b_4      YESNO
capture label values q17b_5      YESNO
capture label values q17b_6      YESNO
capture label values q17b_7      YESNO
capture label values q17b_8      YESNO
capture label values q17b_9      YESNO
capture label values q17b_10     YESNO
capture label values q17b_11     YESNO
capture label values q17b_12     YESNO
capture label values q17b_13     YESNO   /* New in 2018 */
capture label values q17aa_1     Q17A
capture label values q17aa_2     Q17A
capture label values q17aa_3     Q17A
capture label values q17aa_4     Q17A
capture label values q17aa_5     Q17A
capture label values q17aa_10    Q17A
capture label values q17aa_11    Q17A
capture label values q17aa_12    Q17A
capture label values q17ab_1     Q17A
capture label values q17ab_2     Q17A
capture label values q17ab_3     Q17A
capture label values q17ab_4     Q17A
capture label values q17ab_5     Q17A
capture label values q17ab_10    Q17A
capture label values q17ab_11    Q17A
capture label values q17ab_12    Q17A
capture label values q18a_1      YESNO
capture label values q18a_2      YESNO
capture label values q18a_3      YESNO
capture label values q18a_4      YESNO
capture label values q18a_5      YESNO
capture label values q18b_1      YESNO
capture label values q18b_2      YESNO
capture label values q18b_3      YESNO
capture label values q18b_4      YESNO
capture label values q18b_5      YESNO
capture label values q18aa_1     Q18A
capture label values q18aa_2     Q18A
capture label values q18aa_3     Q18A
capture label values q18aa_4     Q18A
capture label values q18aa_5     Q18A
capture label values q18ab_1     Q18A
capture label values q18ab_2     Q18A
capture label values q18ab_3     Q18A
capture label values q18ab_4     Q18A
capture label values q18ab_5     Q18A
capture label values q19a_1      YESNO
capture label values q19a_2      YESNO
capture label values q19a_3      YESNO
capture label values q19a_4      YESNO
capture label values q19a_5      YESNO
capture label values q19a_6      YESNO
capture label values q19a_7      YESNO
capture label values q19b_1      YESNO
capture label values q19b_2      YESNO
capture label values q19b_3      YESNO
capture label values q19b_4      YESNO
capture label values q19b_5      YESNO
capture label values q19b_6      YESNO
capture label values q19b_7      YESNO
capture label values q19aa_1     Q19A
capture label values q19aa_2     Q19A
capture label values q19aa_3     Q19A
capture label values q19aa_4     Q19A
capture label values q19aa_5     Q19A
capture label values q19aa_6     Q19A
capture label values q19aa_7     Q19A
capture label values q19ab_1     Q19A
capture label values q19ab_2     Q19A
capture label values q19ab_3     Q19A
capture label values q19ab_4     Q19A
capture label values q19ab_5     Q19A
capture label values q19ab_6     Q19A
capture label values q19ab_7     Q19A
capture label values q20a_1      YESNO
capture label values q20a_2      YESNO
capture label values q20a_3      YESNO
capture label values q20a_4      YESNO
capture label values q20a_5      YESNO
capture label values q20a_6      YESNO
capture label values q20a_7      YESNO
capture label values q20a_8      YESNO
capture label values q20a_9      YESNO
capture label values q20a_10     YESNO
capture label values q20b_1      YESNO
capture label values q20b_2      YESNO
capture label values q20b_3      YESNO
capture label values q20b_4      YESNO
capture label values q20b_5      YESNO
capture label values q20b_6      YESNO
capture label values q20b_7      YESNO
capture label values q20b_8      YESNO
capture label values q20b_9      YESNO
capture label values q20b_10     YESNO
capture label values q20aa_1     Q20A
capture label values q20aa_2     Q20A
capture label values q20aa_3     Q20A
capture label values q20aa_4     Q20A
capture label values q20aa_5     Q20A
capture label values q20aa_6     Q20A
capture label values q20aa_7     Q20A
capture label values q20aa_8     Q20A
capture label values q20aa_9     Q20A
capture label values q20aa_10    Q20A
capture label values q20ab_1     Q20A
capture label values q20ab_2     Q20A
capture label values q20ab_3     Q20A
capture label values q20ab_4     Q20A
capture label values q20ab_5     Q20A
capture label values q20ab_6     Q20A
capture label values q20ab_7     Q20A
capture label values q20ab_8     Q20A
capture label values q20ab_9     Q20A
capture label values q20ab_10    Q20A
capture label values q21a_1      YESNO
capture label values q21a_2      YESNO
capture label values q21a_3      YESNO
capture label values q21a_4      YESNO
capture label values q21a_5      YESNO
capture label values q21a_6      YESNO
capture label values q21a_7      YESNO
capture label values q21a_8      YESNO

* New in 2019 *
capture label values q21a_9      YESNO

capture label values q21b_1      YESNO
capture label values q21b_2      YESNO
capture label values q21b_3      YESNO
capture label values q21b_4      YESNO
capture label values q21b_5      YESNO
capture label values q21b_6      YESNO
capture label values q21b_7      YESNO
capture label values q21b_8      YESNO

* New in 2019 *
capture label values q21b_9      YESNO

capture label values q22a_1      YESNO
capture label values q22a_2      YESNO
capture label values q22a_3      YESNO
capture label values q22a_4      YESNO
capture label values q22a_5      YESNO
capture label values q22a_6      YESNO
capture label values q22a_7      YESNO
capture label values q22a_8      YESNO
capture label values q22a_9      YESNO
capture label values q22a_10     YESNO
capture label values q22b_1      YESNO
capture label values q22b_2      YESNO
capture label values q22b_3      YESNO
capture label values q22b_4      YESNO
capture label values q22b_5      YESNO
capture label values q22b_6      YESNO
capture label values q22b_7      YESNO
capture label values q22b_8      YESNO
capture label values q22b_9      YESNO
capture label values q22b_10     YESNO
capture label values q22aa_1     Q22A
capture label values q22aa_2     Q22A
capture label values q22aa_3     Q22A
capture label values q22aa_4     Q22A
capture label values q22aa_5     Q22A
capture label values q22aa_6     Q22A
capture label values q22aa_7     Q22A
capture label values q22aa_8     Q22A
capture label values q22aa_9     Q22A
capture label values q22ab_1     Q22A
capture label values q22ab_2     Q22A
capture label values q22ab_3     Q22A
capture label values q22ab_4     Q22A
capture label values q22ab_5     Q22A
capture label values q22ab_6     Q22A
capture label values q22ab_7     Q22A
capture label values q22ab_8     Q22A
capture label values q22ab_9     Q22A
capture label values q23a        Q23
capture label values q23b        Q23
capture label values q23aa       Q23A
capture label values q23ab       Q23A
capture label values q25a_1      YESNO
capture label values q25a_2      YESNO
capture label values q25a_3      YESNO
capture label values q25a_4      YESNO
capture label values q25a_5      YESNO
capture label values q25b_1      YESNO
capture label values q25b_2      YESNO
capture label values q25b_3      YESNO
capture label values q25b_4      YESNO
capture label values q25b_5      YESNO
capture label values q25aa_1     Q25A
capture label values q25aa_2     Q25A
capture label values q25aa_3     Q25A
capture label values q25aa_4     Q25A
capture label values q25aa_5     Q25A
capture label values q25ab_1     Q25A
capture label values q25ab_2     Q25A
capture label values q25ab_3     Q25A
capture label values q25ab_4     Q25A
capture label values q25ab_5     Q25A
capture label values q26a_1      YESNO
capture label values q26a_2      YESNO
capture label values q26a_3      YESNO
capture label values q26b_1      YESNO
capture label values q26b_2      YESNO
capture label values q26b_3      YESNO
capture label values q26aa_1     Q26A
capture label values q26aa_2     Q26A
capture label values q26aa_3     Q26A
capture label values q26ab_1     Q26A
capture label values q26ab_2     Q26A
capture label values q26ab_3     Q26A
capture label values q27a_1      YESNO
capture label values q27a_2      YESNO
capture label values q27a_3      YESNO
capture label values q27a_4      YESNO
capture label values q27a_5      YESNO
capture label values q27a_6      YESNO
capture label values q27a_7      YESNO
capture label values q27a_8      YESNO
capture label values q27a_9      YESNO
capture label values q27a_10     YESNO
capture label values q27a_11     YESNO
capture label values q27a_12     YESNO
capture label values q27a_13     YESNO
capture label values q27a_14     YESNO
capture label values q27a_15     YESNO
capture label values q27a_16     YESNO
capture label values q27a_17     YESNO
capture label values q27a_18     YESNO
capture label values q27a_19     YESNO
capture label values q27a_20     YESNO
capture label values q27a_21     YESNO
capture label values q27a_22     YESNO
capture label values q27a_23     YESNO
capture label values q27a_24     YESNO
capture label values q27b_1      YESNO
capture label values q27b_2      YESNO
capture label values q27b_3      YESNO
capture label values q27b_4      YESNO
capture label values q27b_5      YESNO
capture label values q27b_6      YESNO
capture label values q27b_7      YESNO
capture label values q27b_8      YESNO
capture label values q27b_9      YESNO
capture label values q27b_10     YESNO
capture label values q27b_11     YESNO
capture label values q27b_12     YESNO
capture label values q27b_13     YESNO
capture label values q27b_14     YESNO
capture label values q27b_15     YESNO
capture label values q27b_16     YESNO
capture label values q27b_17     YESNO
capture label values q27b_18     YESNO
capture label values q27b_19     YESNO
capture label values q27b_20     YESNO
capture label values q27b_21     YESNO
capture label values q27b_22     YESNO
capture label values q27b_23     YESNO
capture label values q27b_24     YESNO
capture label values q27aa_1     Q27A
capture label values q27aa_3     Q27A
capture label values q27aa_4     Q27A
capture label values q27aa_9     Q27A
capture label values q27aa_10    Q27A
capture label values q27aa_11    Q27A
capture label values q27aa_17    Q27A
capture label values q27aa_18    Q27A
capture label values q27aa_19    Q27A
capture label values q27aa_20    Q27A
capture label values q27aa_21    Q27A
capture label values q27aa_22    Q27A
capture label values q27aa_23    Q27A
capture label values q27aa_24    Q27A
capture label values q27ab_1     Q27A
capture label values q27ab_3     Q27A
capture label values q27ab_4     Q27A
capture label values q27ab_9     Q27A
capture label values q27ab_10    Q27A
capture label values q27ab_11    Q27A
capture label values q27ab_17    Q27A
capture label values q27ab_18    Q27A
capture label values q27ab_19    Q27A
capture label values q27ab_20    Q27A
capture label values q27ab_21    Q27A
capture label values q27ab_22    Q27A
capture label values q27ab_23    Q27A
capture label values q27ab_24    Q27A
capture label values q28a_1      YESNO
capture label values q28a_2      YESNO
capture label values q28a_3      YESNO
capture label values q28a_4      YESNO
capture label values q28a_5      YESNO
capture label values q28a_6      YESNO
capture label values q28a_7      YESNO
capture label values q28a_8      YESNO
capture label values q28a_9      YESNO
capture label values q28a_10     YESNO
capture label values q28a_11     YESNO
capture label values q28a_12     YESNO
capture label values q28a_13     YESNO
capture label values q28a_14     YESNO
capture label values q28a_15     YESNO
capture label values q28a_16     YESNO
capture label values q28a_17     YESNO
capture label values q28a_18     YESNO
capture label values q28a_19     YESNO
capture label values q28a_20     YESNO
capture label values q28a_21     YESNO
capture label values q28a_22     YESNO
capture label values q28a_23     YESNO
capture label values q28a_24     YESNO
capture label values q28b_1      YESNO
capture label values q28b_2      YESNO
capture label values q28b_3      YESNO
capture label values q28b_4      YESNO
capture label values q28b_5      YESNO
capture label values q28b_6      YESNO
capture label values q28b_7      YESNO
capture label values q28b_8      YESNO
capture label values q28b_9      YESNO
capture label values q28b_10     YESNO
capture label values q28b_11     YESNO
capture label values q28b_12     YESNO
capture label values q28b_13     YESNO
capture label values q28b_14     YESNO
capture label values q28b_15     YESNO
capture label values q28b_16     YESNO
capture label values q28b_17     YESNO
capture label values q28b_18     YESNO
capture label values q28b_19     YESNO
capture label values q28b_20     YESNO
capture label values q28b_21     YESNO
capture label values q28b_22     YESNO
capture label values q28b_23     YESNO
capture label values q28b_24     YESNO
capture label values q28aa_1     Q28A
capture label values q28aa_2     Q28A
capture label values q28aa_3     Q28A
capture label values q28aa_4     Q28A
capture label values q28aa_5     Q28A
capture label values q28aa_6     Q28A
capture label values q28aa_7     Q28A
capture label values q28aa_8     Q28A
capture label values q28aa_9     Q28A
capture label values q28aa_10    Q28A
capture label values q28aa_11    Q28A
capture label values q28aa_12    Q28A
capture label values q28aa_13    Q28A
capture label values q28aa_14    Q28A
capture label values q28aa_15    Q28A
capture label values q28aa_16    Q28A
capture label values q28aa_17    Q28A
capture label values q28aa_18    Q28A
capture label values q28aa_19    Q28A
capture label values q28aa_20    Q28A
capture label values q28aa_21    Q28A
capture label values q28aa_22    Q28A
capture label values q28aa_23    Q28A
capture label values q28aa_24    Q28A
capture label values q28ab_1     Q28A
capture label values q28ab_2     Q28A
capture label values q28ab_3     Q28A
capture label values q28ab_4     Q28A
capture label values q28ab_5     Q28A
capture label values q28ab_6     Q28A
capture label values q28ab_7     Q28A
capture label values q28ab_8     Q28A
capture label values q28ab_9     Q28A
capture label values q28ab_10    Q28A
capture label values q28ab_11    Q28A
capture label values q28ab_12    Q28A
capture label values q28ab_13    Q28A
capture label values q28ab_14    Q28A
capture label values q28ab_15    Q28A
capture label values q28ab_16    Q28A
capture label values q28ab_17    Q28A
capture label values q28ab_18    Q28A
capture label values q28ab_19    Q28A
capture label values q28ab_20    Q28A
capture label values q28ab_21    Q28A
capture label values q28ab_22    Q28A
capture label values q28ab_23    Q28A
capture label values q28ab_24    Q28A
capture label values q29a_1      YESNO
capture label values q29a_2      YESNO
capture label values q29a_3      YESNO
capture label values q29a_4      YESNO
capture label values q29a_5      YESNO
capture label values q29a_6      YESNO
capture label values q29a_7      YESNO
capture label values q29a_8      YESNO
capture label values q29a_9      YESNO
capture label values q29a_10     YESNO
capture label values q29a_11     YESNO
capture label values q29a_12     YESNO
capture label values q29a_13     YESNO
capture label values q29a_14     YESNO
capture label values q29a_15     YESNO
capture label values q29a_16     YESNO
capture label values q29a_17     YESNO
capture label values q29b_1      YESNO
capture label values q29b_2      YESNO
capture label values q29b_3      YESNO
capture label values q29b_4      YESNO
capture label values q29b_5      YESNO
capture label values q29b_6      YESNO
capture label values q29b_7      YESNO
capture label values q29b_8      YESNO
capture label values q29b_9      YESNO
capture label values q29b_10     YESNO
capture label values q29b_11     YESNO
capture label values q29b_12     YESNO
capture label values q29b_13     YESNO
capture label values q29b_14     YESNO
capture label values q29b_15     YESNO
capture label values q29b_16     YESNO
capture label values q29b_17     YESNO
capture label values q29aa_1     Q29A
capture label values q29aa_2     Q29A
capture label values q29aa_3     Q29A
capture label values q29aa_4     Q29A
capture label values q29aa_5     Q29A
capture label values q29aa_6     Q29A
capture label values q29aa_7     Q29A
capture label values q29aa_8     Q29A
capture label values q29aa_9     Q29A
capture label values q29aa_10    Q29A
capture label values q29aa_11    Q29A
capture label values q29aa_12    Q29A
capture label values q29aa_13    Q29A
capture label values q29aa_14    Q29A
capture label values q29aa_15    Q29A
capture label values q29aa_16    Q29A
capture label values q29aa_17    Q29A
capture label values q29ab_1     Q29A
capture label values q29ab_2     Q29A
capture label values q29ab_3     Q29A
capture label values q29ab_4     Q29A
capture label values q29ab_5     Q29A
capture label values q29ab_6     Q29A
capture label values q29ab_7     Q29A
capture label values q29ab_8     Q29A
capture label values q29ab_9     Q29A
capture label values q29ab_10    Q29A
capture label values q29ab_11    Q29A
capture label values q29ab_12    Q29A
capture label values q29ab_13    Q29A
capture label values q29ab_14    Q29A
capture label values q29ab_15    Q29A
capture label values q29ab_16    Q29A
capture label values q29ab_17    Q29A
capture label values q30a_1      YESNO
capture label values q30a_2      YESNO
capture label values q30a_3      YESNO
capture label values q30a_4      YESNO
capture label values q30a_5      YESNO
capture label values q30a_6      YESNO
capture label values q30b_1      YESNO
capture label values q30b_2      YESNO
capture label values q30b_3      YESNO
capture label values q30b_4      YESNO
capture label values q30b_5      YESNO
capture label values q30b_6      YESNO
capture label values q30aa_1     Q30A
capture label values q30aa_2     Q30A
capture label values q30aa_3     Q30A
capture label values q30aa_4     Q30A
capture label values q30aa_5     Q30A
capture label values q30aa_6     Q30A
capture label values q30aa_7     Q30A
capture label values q30aa_8     Q30A
capture label values q30aa_9     Q30A
capture label values q30aa_10    Q30A
capture label values q30aa_11    Q30A
capture label values q30aa_12    Q30A
capture label values q30aa_13    Q30A
capture label values q30aa_14    Q30A
capture label values q30aa_15    Q30A
capture label values q30aa_16    Q30A
capture label values q30aa_17    Q30A
capture label values q30aa_18    Q30A
capture label values q30aa_19    Q30A
capture label values q30aa_20    Q30A
capture label values q30aa_21    Q30A
capture label values q30aa_22    Q30A
capture label values q30aa_23    Q30A
capture label values q30aa_24    Q30A
capture label values q30aa_25    Q30A
capture label values q30aa_26    Q30A
capture label values q30aa_27    Q30A

* New in 2019 *
capture label values q30aa_28    Q30A

capture label values q30ab_1     Q30A
capture label values q30ab_2     Q30A
capture label values q30ab_3     Q30A
capture label values q30ab_4     Q30A
capture label values q30ab_5     Q30A
capture label values q30ab_6     Q30A
capture label values q30ab_7     Q30A
capture label values q30ab_8     Q30A
capture label values q30ab_9     Q30A
capture label values q30ab_10    Q30A
capture label values q30ab_11    Q30A
capture label values q30ab_12    Q30A
capture label values q30ab_13    Q30A
capture label values q30ab_14    Q30A
capture label values q30ab_15    Q30A
capture label values q30ab_16    Q30A
capture label values q30ab_17    Q30A
capture label values q30ab_18    Q30A
capture label values q30ab_19    Q30A
capture label values q30ab_20    Q30A
capture label values q30ab_21    Q30A
capture label values q30ab_22    Q30A
capture label values q30ab_23    Q30A
capture label values q30ab_24    Q30A
capture label values q30ab_25    Q30A
capture label values q30ab_26    Q30A
capture label values q30ab_27    Q30A

* New in 2019 *
capture label values q30ab_28    Q30A

* New in 2019: Drop Q31 - ENDED UP KEEPING FOR MASTER FILE 111119 *
capture label values q31a_1      YESNO
capture label values q31a_2      YESNO
capture label values q31a_3      YESNO
capture label values q31a_4      YESNO
capture label values q31a_5      YESNO
capture label values q31a_6      YESNO
capture label values q31a_7      YESNO
capture label values q31a_8      YESNO
capture label values q31a_9      YESNO
capture label values q31a_10     YESNO
capture label values q31a_11     YESNO
capture label values q31a_12     YESNO
capture label values q31a_13     YESNO
capture label values q31a_14     YESNO
capture label values q31a_15     YESNO
capture label values q31a_16     YESNO
capture label values q31a_17     YESNO
capture label values q31a_18     YESNO
capture label values q31a_19     YESNO
capture label values q31a_20     YESNO
capture label values q31a_21     YESNO
capture label values q31a_22     YESNO
capture label values q31a_23     YESNO
capture label values q31a_24     YESNO
capture label values q31a_25     YESNO
capture label values q31a_26     YESNO
capture label values q31a_27     YESNO
capture label values q31a_28     YESNO
capture label values q31a_29     YESNO
capture label values q31a_30     YESNO
capture label values q31a_31     YESNO
capture label values q31a_32     YESNO
capture label values q31a_33     YESNO
capture label values q31a_34     YESNO
capture label values q31a_35     YESNO
capture label values q31a_36     YESNO
capture label values q31a_37     YESNO
capture label values q31a_38     YESNO
* New in 2016 *
capture label values q31a_39     YESNO
* New in 2018 *
capture label values q31a_40     YESNO
capture label values q31a_41     YESNO
capture label values q31a_42     YESNO
* New in 2019: Drop Q31 - ENDED UP KEEPING FOR MASTER FILE 111119 *
capture label values q31b_1      YESNO
capture label values q31b_2      YESNO
capture label values q31b_3      YESNO
capture label values q31b_4      YESNO
capture label values q31b_5      YESNO
capture label values q31b_6      YESNO
capture label values q31b_7      YESNO
capture label values q31b_8      YESNO
capture label values q31b_9      YESNO
capture label values q31b_10     YESNO
capture label values q31b_11     YESNO
capture label values q31b_12     YESNO
capture label values q31b_13     YESNO
capture label values q31b_14     YESNO
capture label values q31b_15     YESNO
capture label values q31b_16     YESNO
capture label values q31b_17     YESNO
capture label values q31b_18     YESNO
capture label values q31b_19     YESNO
capture label values q31b_20     YESNO
capture label values q31b_21     YESNO
capture label values q31b_22     YESNO
capture label values q31b_23     YESNO
capture label values q31b_24     YESNO
capture label values q31b_25     YESNO
capture label values q31b_26     YESNO
capture label values q31b_27     YESNO
capture label values q31b_28     YESNO
capture label values q31b_29     YESNO
capture label values q31b_30     YESNO
capture label values q31b_31     YESNO
capture label values q31b_32     YESNO
capture label values q31b_33     YESNO
capture label values q31b_34     YESNO
capture label values q31b_35     YESNO
capture label values q31b_36     YESNO
capture label values q31b_37     YESNO
capture label values q31b_38     YESNO
* New in 2016 *
capture label values q31b_39     YESNO
* New in 2018 *
capture label values q31b_40     YESNO
capture label values q31b_41     YESNO
capture label values q31b_42     YESNO

* New in 2019 *
capture label values q31ca       YESNO
capture label values q31cb    	 YESNO
capture label values q31da_1     YESNO
capture label values q31da_2     YESNO
capture label values q31da_3     YESNO
capture label values q31da_6     YESNO
capture label values q31da_7     YESNO
capture label values q31da_39    YESNO
capture label values q31da_8     YESNO
capture label values q31da_9     YESNO
capture label values q31da_10    YESNO
capture label values q31da_11    YESNO
capture label values q31da_12    YESNO
capture label values q31da_13    YESNO
capture label values q31da_14    YESNO
capture label values q31da_15    YESNO
capture label values q31da_16    YESNO
capture label values q31da_17    YESNO
capture label values q31da_18    YESNO
capture label values q31da_19    YESNO
capture label values q31da_20    YESNO
capture label values q31da_21    YESNO
capture label values q31da_22    YESNO
capture label values q31da_23    YESNO
capture label values q31da_24    YESNO
capture label values q31da_25    YESNO
capture label values q31da_26    YESNO
capture label values q31da_27    YESNO
capture label values q31da_28    YESNO
capture label values q31da_29    YESNO
capture label values q31da_30    YESNO
capture label values q31da_31    YESNO
capture label values q31da_32    YESNO
capture label values q31da_33    YESNO
capture label values q31da_34    YESNO
capture label values q31da_35    YESNO
capture label values q31da_36    YESNO
capture label values q31da_40    YESNO
capture label values q31da_42    YESNO
capture label values q31da_43    YESNO
capture label values q31da_44    YESNO
capture label values q31da_46    YESNO
capture label values q31da_49    YESNO
capture label values q31da_51    YESNO
capture label values q31da_52    YESNO
capture label values q31da_55    YESNO
capture label values q31da_56    YESNO
capture label values q31da_57    YESNO
capture label values q31da_60    YESNO
capture label values q31da_61    YESNO
capture label values q31da_65    YESNO
capture label values q31da_37    YESNO
capture label values q31da_38    YESNO
capture label values q31db_1     YESNO
capture label values q31db_2     YESNO
capture label values q31db_3     YESNO
capture label values q31db_6     YESNO
capture label values q31db_7     YESNO
capture label values q31db_39    YESNO
capture label values q31db_8     YESNO
capture label values q31db_9     YESNO
capture label values q31db_10    YESNO
capture label values q31db_11    YESNO
capture label values q31db_12    YESNO
capture label values q31db_13    YESNO
capture label values q31db_14    YESNO
capture label values q31db_15    YESNO
capture label values q31db_16    YESNO
capture label values q31db_17    YESNO
capture label values q31db_18    YESNO
capture label values q31db_19    YESNO
capture label values q31db_20    YESNO
capture label values q31db_21    YESNO
capture label values q31db_22    YESNO
capture label values q31db_23    YESNO
capture label values q31db_24    YESNO
capture label values q31db_25    YESNO
capture label values q31db_26    YESNO
capture label values q31db_27    YESNO
capture label values q31db_28    YESNO
capture label values q31db_29    YESNO
capture label values q31db_30    YESNO
capture label values q31db_31    YESNO
capture label values q31db_32    YESNO
capture label values q31db_33    YESNO
capture label values q31db_34    YESNO
capture label values q31db_35    YESNO
capture label values q31db_36    YESNO
capture label values q31db_40    YESNO
capture label values q31db_42    YESNO
capture label values q31db_43    YESNO
capture label values q31db_44    YESNO
capture label values q31db_46    YESNO
capture label values q31db_49    YESNO
capture label values q31db_51    YESNO
capture label values q31db_52    YESNO
capture label values q31db_55    YESNO
capture label values q31db_56    YESNO
capture label values q31db_57    YESNO
capture label values q31db_60    YESNO
capture label values q31db_61    YESNO
capture label values q31db_65    YESNO
capture label values q31db_37    YESNO
capture label values q31db_38    YESNO

capture label values q31aa_1     Q31A
capture label values q31aa_2     Q31A
capture label values q31aa_3     Q31A
capture label values q31aa_4     Q31A
capture label values q31aa_5     Q31A
capture label values q31aa_6     Q31A
capture label values q31aa_7     Q31A
capture label values q31aa_8     Q31A
capture label values q31aa_9     Q31A
capture label values q31aa_10    Q31A
capture label values q31aa_11    Q31A
capture label values q31aa_12    Q31A
capture label values q31aa_13    Q31A
capture label values q31aa_14    Q31A
capture label values q31aa_15    Q31A
capture label values q31aa_16    Q31A
capture label values q31aa_17    Q31A
capture label values q31aa_18    Q31A
capture label values q31aa_19    Q31A
capture label values q31aa_20    Q31A
capture label values q31aa_21    Q31A
capture label values q31aa_22    Q31A
capture label values q31aa_23    Q31A
capture label values q31aa_24    Q31A
capture label values q31aa_25    Q31A
capture label values q31aa_26    Q31A
capture label values q31aa_27    Q31A
capture label values q31aa_28    Q31A
capture label values q31aa_29    Q31A
capture label values q31aa_30    Q31A
capture label values q31aa_31    Q31A
capture label values q31aa_32    Q31A
capture label values q31aa_33    Q31A
capture label values q31aa_34    Q31A
capture label values q31aa_35    Q31A
capture label values q31aa_36    Q31A
capture label values q31aa_37    Q31A
* New in 2016 *
capture label values q31aa_39    Q31A
* New in 2018 *
capture label values q31aa_40    Q31A
capture label values q31aa_41    Q31A
capture label values q31aa_42    Q31A

* New in 2019 *
capture label values q31aa_43    Q31A
capture label values q31aa_44    Q31A
capture label values q31aa_46    Q31A
capture label values q31aa_49    Q31A
capture label values q31aa_51    Q31A
capture label values q31aa_52    Q31A
capture label values q31aa_55    Q31A
capture label values q31aa_56    Q31A
capture label values q31aa_57    Q31A
capture label values q31aa_60    Q31A
capture label values q31aa_61    Q31A
capture label values q31aa_65    Q31A

* New in 2019: KEEP Q31A FOR MASTER FILE 111119 *
capture label values q31ab_1     Q31A
capture label values q31ab_2     Q31A
capture label values q31ab_3     Q31A
capture label values q31ab_4     Q31A
capture label values q31ab_5     Q31A
capture label values q31ab_6     Q31A
capture label values q31ab_7     Q31A
capture label values q31ab_8     Q31A
capture label values q31ab_9     Q31A
capture label values q31ab_10    Q31A
capture label values q31ab_11    Q31A
capture label values q31ab_12    Q31A
capture label values q31ab_13    Q31A
capture label values q31ab_14    Q31A
capture label values q31ab_15    Q31A
capture label values q31ab_16    Q31A
capture label values q31ab_17    Q31A
capture label values q31ab_18    Q31A
capture label values q31ab_19    Q31A
capture label values q31ab_20    Q31A
capture label values q31ab_21    Q31A
capture label values q31ab_22    Q31A
capture label values q31ab_23    Q31A
capture label values q31ab_24    Q31A
capture label values q31ab_25    Q31A
capture label values q31ab_26    Q31A
capture label values q31ab_27    Q31A
capture label values q31ab_28    Q31A
capture label values q31ab_29    Q31A
capture label values q31ab_30    Q31A
capture label values q31ab_31    Q31A
capture label values q31ab_32    Q31A
capture label values q31ab_33    Q31A
capture label values q31ab_34    Q31A
capture label values q31ab_35    Q31A
capture label values q31ab_36    Q31A
capture label values q31ab_37    Q31A
* New in 2016 *
capture label values q31ab_39    Q31A
* New in 2018 *
capture label values q31ab_40    Q31A
capture label values q31ab_41    Q31A
capture label values q31ab_42    Q31A

* New in 2019 *
capture label values q31ab_43    Q31A
capture label values q31ab_44    Q31A
capture label values q31ab_46    Q31A
capture label values q31ab_49    Q31A
capture label values q31ab_51    Q31A
capture label values q31ab_52    Q31A
capture label values q31ab_55    Q31A
capture label values q31ab_56    Q31A
capture label values q31ab_57    Q31A
capture label values q31ab_60    Q31A
capture label values q31ab_61    Q31A
capture label values q31ab_65    Q31A

* New in 2018 *
capture label values q31ba_1     YESNO
capture label values q31ba_2     YESNO
capture label values q31ba_3     YESNO
capture label values q31ba_4     YESNO
capture label values q31ba_5     YESNO
capture label values q31ba_6     YESNO
capture label values q31ba_7     YESNO
capture label values q31bb_1     YESNO
capture label values q31bb_2     YESNO
capture label values q31bb_3     YESNO
capture label values q31bb_4     YESNO
capture label values q31bb_5     YESNO
capture label values q31bb_6     YESNO
capture label values q31bb_7     YESNO

capture label values q32a        YESNO
capture label values q32b        YESNO
capture label values q33a_1      YESNO
capture label values q33a_2      YESNO
capture label values q33a_3      YESNO
capture label values q33a_4      YESNO
capture label values q33a_5      YESNO
capture label values q33a_6      YESNO
capture label values q33a_7      YESNO
capture label values q33a_8      YESNO
capture label values q33a_10     YESNO
capture label values q33a_11     YESNO
capture label values q33a_12     YESNO
capture label values q33a_13     YESNO
capture label values q33a_14     YESNO
capture label values q33a_15     YESNO
capture label values q33a_16     YESNO
capture label values q33a_17     YESNO
capture label values q33a_18     YESNO
capture label values q33a_19     YESNO
capture label values q33a_20     YESNO
capture label values q33a_21     YESNO
capture label values q33a_22     YESNO
capture label values q33a_23     YESNO
capture label values q33a_25     YESNO
capture label values q33a_26     YESNO
capture label values q33a_27     YESNO
capture label values q33a_28     YESNO
capture label values q33a_29     YESNO
capture label values q33a_30     YESNO
capture label values q33a_31     YESNO
capture label values q33b_1      YESNO
capture label values q33b_2      YESNO
capture label values q33b_3      YESNO
capture label values q33b_4      YESNO
capture label values q33b_5      YESNO
capture label values q33b_6      YESNO
capture label values q33b_7      YESNO
capture label values q33b_8      YESNO
capture label values q33b_10     YESNO
capture label values q33b_11     YESNO
capture label values q33b_12     YESNO
capture label values q33b_13     YESNO
capture label values q33b_14     YESNO
capture label values q33b_15     YESNO
capture label values q33b_16     YESNO
capture label values q33b_17     YESNO
capture label values q33b_18     YESNO
capture label values q33b_19     YESNO
capture label values q33b_20     YESNO
capture label values q33b_21     YESNO
capture label values q33b_22     YESNO
capture label values q33b_23     YESNO
capture label values q33b_25     YESNO
capture label values q33b_26     YESNO
capture label values q33b_27     YESNO
capture label values q33b_28     YESNO
capture label values q33b_29     YESNO
capture label values q33b_30     YESNO
capture label values q33b_31     YESNO
capture label values q33aa_1     Q33A
capture label values q33aa_2     Q33A
capture label values q33aa_3     Q33A
capture label values q33aa_4     Q33A
capture label values q33aa_5     Q33A
capture label values q33aa_6     Q33A
capture label values q33aa_7     Q33A
capture label values q33aa_8     Q33A
capture label values q33aa_10    Q33A
capture label values q33aa_11    Q33A
capture label values q33aa_12    Q33A
capture label values q33aa_13    Q33A
capture label values q33aa_14    Q33A
capture label values q33aa_15    Q33A
capture label values q33aa_16    Q33A
capture label values q33aa_17    Q33A
capture label values q33aa_18    Q33A
capture label values q33aa_19    Q33A
capture label values q33aa_20    Q33A
capture label values q33aa_21    Q33A
capture label values q33aa_22    Q33A
capture label values q33aa_23    Q33A
capture label values q33aa_25    Q33A
capture label values q33aa_26    Q33A
capture label values q33aa_27    Q33A
capture label values q33aa_28    Q33A
capture label values q33aa_29    Q33A
capture label values q33aa_30    Q33A
capture label values q33aa_31    Q33A
capture label values q33aa_32    Q33A
capture label values q33aa_33    Q33A
capture label values q33aa_34    Q33A
capture label values q33aa_35    Q33A
capture label values q33aa_36    Q33A

* New in 2019 *
capture label values q33aa_37    Q33A
capture label values q33aa_38    Q33A
capture label values q33aa_39    Q33A

capture label values q33ab_1     Q33A
capture label values q33ab_2     Q33A
capture label values q33ab_3     Q33A
capture label values q33ab_4     Q33A
capture label values q33ab_5     Q33A
capture label values q33ab_6     Q33A
capture label values q33ab_7     Q33A
capture label values q33ab_8     Q33A
capture label values q33ab_10    Q33A
capture label values q33ab_11    Q33A
capture label values q33ab_12    Q33A
capture label values q33ab_13    Q33A
capture label values q33ab_14    Q33A
capture label values q33ab_15    Q33A
capture label values q33ab_16    Q33A
capture label values q33ab_17    Q33A
capture label values q33ab_18    Q33A
capture label values q33ab_19    Q33A
capture label values q33ab_20    Q33A
capture label values q33ab_21    Q33A
capture label values q33ab_22    Q33A
capture label values q33ab_23    Q33A
capture label values q33ab_25    Q33A
capture label values q33ab_26    Q33A
capture label values q33ab_27    Q33A
capture label values q33ab_28    Q33A
capture label values q33ab_29    Q33A
capture label values q33ab_30    Q33A
capture label values q33ab_31    Q33A
capture label values q33ab_32    Q33A
capture label values q33ab_33    Q33A
capture label values q33ab_34    Q33A
capture label values q33ab_35    Q33A
capture label values q33ab_36    Q33A

* New in 2019 *
capture label values q33ab_37    Q33A
capture label values q33ab_38    Q33A
capture label values q33ab_39    Q33A

capture label values q33ba_1     Q33B
capture label values q33ba_2     Q33B
capture label values q33ba_3     Q33B
capture label values q33ba_4     Q33B
capture label values q33ba_5     Q33B
capture label values q33ba_6     Q33B
capture label values q33ba_7     Q33B
capture label values q33ba_8     Q33B
capture label values q33ba_9     Q33B
capture label values q33ba_10    Q33B
capture label values q33ba_11    Q33B
capture label values q33ba_12    Q33B
capture label values q33ba_13    Q33B
capture label values q33ba_14    Q33B
capture label values q33ba_15    Q33B
capture label values q33ba_16    Q33B
capture label values q33bb_1     Q33B
capture label values q33bb_2     Q33B
capture label values q33bb_3     Q33B
capture label values q33bb_4     Q33B
capture label values q33bb_5     Q33B
capture label values q33bb_6     Q33B
capture label values q33bb_7     Q33B
capture label values q33bb_8     Q33B
capture label values q33bb_9     Q33B
capture label values q33bb_10    Q33B
capture label values q33bb_11    Q33B
capture label values q33bb_12    Q33B
capture label values q33bb_13    Q33B
capture label values q33bb_14    Q33B
capture label values q33bb_15    Q33B
capture label values q33bb_16    Q33B
capture label values q33ca_1     YESNO
capture label values q33ca_2     YESNO
capture label values q33ca_3     YESNO
capture label values q33ca_4     YESNO
capture label values q33ca_5     YESNO
capture label values q33ca_6     YESNO
capture label values q33ca_7     YESNO
capture label values q33ca_8     YESNO
capture label values q33ca_9     YESNO
capture label values q33ca_10    YESNO
capture label values q33ca_11    YESNO
capture label values q33ca_12    YESNO
capture label values q33ca_13    YESNO

* New in 2019 *
capture label values q33ca_14    YESNO
capture label values q33ca_15    YESNO
capture label values q33ca_16    YESNO

capture label values q33cb_1     YESNO
capture label values q33cb_2     YESNO
capture label values q33cb_3     YESNO
capture label values q33cb_4     YESNO
capture label values q33cb_5     YESNO
capture label values q33cb_6     YESNO
capture label values q33cb_7     YESNO
capture label values q33cb_8     YESNO
capture label values q33cb_9     YESNO
capture label values q33cb_10    YESNO
capture label values q33cb_11    YESNO
capture label values q33cb_12    YESNO
capture label values q33cb_13    YESNO

* New in 2019 *
capture label values q33cb_14    YESNO
capture label values q33cb_15    YESNO
capture label values q33cb_16    YESNO

capture label values q34a_1      YESNO
capture label values q34a_2      YESNO
capture label values q34a_3      YESNO
capture label values q34a_4      YESNO
capture label values q34a_5      YESNO
capture label values q34a_6      YESNO
capture label values q34a_7      YESNO
capture label values q34a_8      YESNO
capture label values q34a_9      YESNO
capture label values q34a_10     YESNO
* New in 2018 *
capture label values q34a_11     YESNO
capture label values q34a_12     YESNO
capture label values q34a_13     YESNO
capture label values q34b_1      YESNO
capture label values q34b_2      YESNO
capture label values q34b_3      YESNO
capture label values q34b_4      YESNO
capture label values q34b_5      YESNO
capture label values q34b_6      YESNO
capture label values q34b_7      YESNO
capture label values q34b_8      YESNO
capture label values q34b_9      YESNO
capture label values q34b_10     YESNO
* New in 2018 *
capture label values q34b_11     YESNO
capture label values q34b_12     YESNO
capture label values q34b_13     YESNO
capture label values q35a_1      YESNO
capture label values q35a_2      YESNO
capture label values q35a_3      YESNO
capture label values q35a_4      YESNO
capture label values q35a_5      YESNO
capture label values q35a_6      YESNO
capture label values q35a_7      YESNO
capture label values q35a_8      YESNO
capture label values q35a_9      YESNO
capture label values q35a_10     YESNO
capture label values q35a_11     YESNO
capture label values q35a_12     YESNO
capture label values q35a_13     YESNO
capture label values q35a_14     YESNO
capture label values q35a_15     YESNO
capture label values q35b_1      YESNO
capture label values q35b_2      YESNO
capture label values q35b_3      YESNO
capture label values q35b_4      YESNO
capture label values q35b_5      YESNO
capture label values q35b_6      YESNO
capture label values q35b_7      YESNO
capture label values q35b_8      YESNO
capture label values q35b_9      YESNO
capture label values q35b_10     YESNO
capture label values q35b_11     YESNO
capture label values q35b_12     YESNO
capture label values q35b_13     YESNO
capture label values q35b_14     YESNO
capture label values q35b_15     YESNO
capture label values q36aa_1     YESNO   /* removed in 2019 */
capture label values q36aa_2     YESNO
capture label values q36aa_3     YESNO
capture label values q36aa_4     YESNO
capture label values q36aa_5     YESNO
capture label values q36aa_6     YESNO

* New in 2019 *
capture label values q36aa_7     YESNO
capture label values q36aa_8     YESNO
capture label values q36aa_9     YESNO

capture label values q36ab_1     YESNO   /* removed in 2019 */
capture label values q36ab_2     YESNO
capture label values q36ab_3     YESNO
capture label values q36ab_4     YESNO
capture label values q36ab_5     YESNO
capture label values q36ab_6     YESNO

* New in 2019 *
capture label values q36ab_7     YESNO
capture label values q36ab_8     YESNO
capture label values q36ab_9     YESNO

capture label values q36ba_1     YESNO
capture label values q36ba_2     YESNO
capture label values q36ba_3     YESNO
capture label values q36ba_4     YESNO
capture label values q36ba_5     YESNO
capture label values q36ba_6     YESNO
capture label values q36ba_7     YESNO
capture label values q36ba_8     YESNO
capture label values q36bb_1     YESNO
capture label values q36bb_2     YESNO
capture label values q36bb_3     YESNO
capture label values q36bb_4     YESNO
capture label values q36bb_5     YESNO
capture label values q36bb_6     YESNO
capture label values q36bb_7     YESNO
capture label values q36bb_8     YESNO
capture label values q36ca_1     YESNO
capture label values q36ca_2     YESNO
capture label values q36ca_3     YESNO
capture label values q36ca_4     YESNO
capture label values q36ca_5     YESNO
capture label values q36ca_6     YESNO
capture label values q36ca_7     YESNO
capture label values q36ca_8     YESNO
capture label values q36ca_9     YESNO
capture label values q36ca_10    YESNO
capture label values q36ca_11    YESNO
capture label values q36ca_12    YESNO
capture label values q36ca_13    YESNO
capture label values q36ca_14    YESNO
capture label values q36ca_15    YESNO
capture label values q36cb_1     YESNO
capture label values q36cb_2     YESNO
capture label values q36cb_3     YESNO
capture label values q36cb_4     YESNO
capture label values q36cb_5     YESNO
capture label values q36cb_6     YESNO
capture label values q36cb_7     YESNO
capture label values q36cb_8     YESNO
capture label values q36cb_9     YESNO
capture label values q36cb_10    YESNO
capture label values q36cb_11    YESNO
capture label values q36cb_12    YESNO
capture label values q36cb_13    YESNO
capture label values q36cb_14    YESNO
capture label values q36cb_15    YESNO
capture label values q36da_1     Q36D
capture label values q36da_14    Q36D
capture label values q36da_15    Q36D
capture label values q36da_26    Q36D
capture label values q36da_27    Q36D
capture label values q36db_1     Q36D
capture label values q36db_14    Q36D
capture label values q36db_15    Q36D
capture label values q36db_26    Q36D
capture label values q36db_27    Q36D
capture label values q36ea_1     YESNO
capture label values q36ea_2     YESNO
capture label values q36ea_3     YESNO
capture label values q36ea_4     YESNO
capture label values q36ea_5     YESNO
capture label values q36ea_6     YESNO
capture label values q36ea_7     YESNO
capture label values q36eb_1     YESNO
capture label values q36eb_2     YESNO
capture label values q36eb_3     YESNO
capture label values q36eb_4     YESNO
capture label values q36eb_5     YESNO
capture label values q36eb_6     YESNO
capture label values q36eb_7     YESNO




* New in 2019 *
capture label values q50fda_1    YESNO
capture label values q50fda_2    YESNO
capture label values q50fda_3    YESNO
capture label values q50fda_4    YESNO
capture label values q50fda_5    YESNO
capture label values q50fda_6    YESNO
capture label values q50fda_7    YESNO
capture label values q50fda_8    YESNO
capture label values q50fda_9    YESNO
capture label values q50fda_10   YESNO
capture label values q50fda_11   YESNO
capture label values q50fda_12   YESNO
capture label values q50fda_13   YESNO
capture label values q50fda_14   YESNO
capture label values q50fda_15   YESNO
capture label values q50fda_16   YESNO
capture label values q50fda_17   YESNO
capture label values q50fda_18   YESNO
capture label values q50fda_19   YESNO
capture label values q50fda_20   YESNO
capture label values q50fda_21   YESNO
capture label values q50fda_22   YESNO
capture label values q50fda_23   YESNO
capture label values q50fda_24   YESNO
capture label values q50fda_25   YESNO
capture label values q50fda_26   YESNO
capture label values q50fda_27   YESNO
capture label values q50fda_28   YESNO
capture label values q50fda_29   YESNO
capture label values q50fdb_1    YESNO
capture label values q50fdb_2    YESNO
capture label values q50fdb_3    YESNO
capture label values q50fdb_4    YESNO
capture label values q50fdb_5    YESNO
capture label values q50fdb_6    YESNO
capture label values q50fdb_7    YESNO
capture label values q50fdb_8    YESNO
capture label values q50fdb_9    YESNO
capture label values q50fdb_10   YESNO
capture label values q50fdb_11   YESNO
capture label values q50fdb_12   YESNO
capture label values q50fdb_13   YESNO
capture label values q50fdb_14   YESNO
capture label values q50fdb_15   YESNO
capture label values q50fdb_16   YESNO
capture label values q50fdb_17   YESNO
capture label values q50fdb_18   YESNO
capture label values q50fdb_19   YESNO
capture label values q50fdb_20   YESNO
capture label values q50fdb_21   YESNO
capture label values q50fdb_22   YESNO
capture label values q50fdb_23   YESNO
capture label values q50fdb_24   YESNO
capture label values q50fdb_25   YESNO
capture label values q50fdb_26   YESNO
capture label values q50fdb_27   YESNO
capture label values q50fdb_28   YESNO
capture label values q50fdb_29   YESNO
capture label values q50bda_1    YESNO
capture label values q50bda_2    YESNO
capture label values q50bda_3    YESNO
capture label values q50bda_4    YESNO
capture label values q50bda_5    YESNO
capture label values q50bda_6    YESNO
capture label values q50bda_7    YESNO
capture label values q50bda_8    YESNO
capture label values q50bda_9    YESNO
capture label values q50bda_10   YESNO
capture label values q50bda_11   YESNO
capture label values q50bda_12   YESNO
capture label values q50bda_13   YESNO
capture label values q50bda_14   YESNO
capture label values q50bda_15   YESNO
capture label values q50bda_16   YESNO
capture label values q50bda_17   YESNO
capture label values q50bda_18   YESNO
capture label values q50bda_19   YESNO
capture label values q50bda_20   YESNO
capture label values q50bda_21   YESNO
capture label values q50bda_22   YESNO
capture label values q50bda_23   YESNO
capture label values q50bda_24   YESNO
capture label values q50bda_25   YESNO
capture label values q50bda_26   YESNO
capture label values q50bda_27   YESNO
capture label values q50bda_28   YESNO
capture label values q50bdb_1    YESNO
capture label values q50bdb_2    YESNO
capture label values q50bdb_3    YESNO
capture label values q50bdb_4    YESNO
capture label values q50bdb_5    YESNO
capture label values q50bdb_6    YESNO
capture label values q50bdb_7    YESNO
capture label values q50bdb_8    YESNO
capture label values q50bdb_9    YESNO
capture label values q50bdb_10   YESNO
capture label values q50bdb_11   YESNO
capture label values q50bdb_12   YESNO
capture label values q50bdb_13   YESNO
capture label values q50bdb_14   YESNO
capture label values q50bdb_15   YESNO
capture label values q50bdb_16   YESNO
capture label values q50bdb_17   YESNO
capture label values q50bdb_18   YESNO
capture label values q50bdb_19   YESNO
capture label values q50bdb_20   YESNO
capture label values q50bdb_21   YESNO
capture label values q50bdb_22   YESNO
capture label values q50bdb_23   YESNO
capture label values q50bdb_24   YESNO
capture label values q50bdb_25   YESNO
capture label values q50bdb_26   YESNO
capture label values q50bdb_27   YESNO
capture label values q50bdb_28   YESNO

capture label values q40a        Q40
capture label values q40b        Q40
capture label values q40aa       Q40A
capture label values q40ab       Q40A
capture label values q40ba       Q40A
capture label values q40bb       Q40A
capture label values q40da       Q40A
capture label values q40db       Q40A
capture label values q42a_1      YESNO
capture label values q42a_2      YESNO
capture label values q42a_3      YESNO
capture label values q42a_4      YESNO
capture label values q42a_5      YESNO
capture label values q42a_6      YESNO
capture label values q42a_7      YESNO
capture label values q42a_8      YESNO
capture label values q42a_9      YESNO
capture label values q42b_1      YESNO
capture label values q42b_2      YESNO
capture label values q42b_3      YESNO
capture label values q42b_4      YESNO
capture label values q42b_5      YESNO
capture label values q42b_6      YESNO
capture label values q42b_7      YESNO
capture label values q42b_8      YESNO
capture label values q42b_9      YESNO
capture label values q43a_1      YESNO
capture label values q43a_2      YESNO
capture label values q43a_3      YESNO
capture label values q43a_4      YESNO
capture label values q43a_5      YESNO
capture label values q43a_6      YESNO

* New in 2016 *
capture label values q43a_7      YESNO

capture label values q43b_1      YESNO
capture label values q43b_2      YESNO
capture label values q43b_3      YESNO
capture label values q43b_4      YESNO
capture label values q43b_5      YESNO
capture label values q43b_6      YESNO

* New in 2016 *
capture label values q43b_7      YESNO

capture label values q44a_1      YESNO
capture label values q44a_2      YESNO
capture label values q44a_3      YESNO
capture label values q44a_4      YESNO
capture label values q44a_5      YESNO
capture label values q44a_6      YESNO
capture label values q44a_7      YESNO
capture label values q44a_8      YESNO
capture label values q44a_9      YESNO
capture label values q44a_10     YESNO
capture label values q44a_11     YESNO
capture label values q44b_1      YESNO
capture label values q44b_2      YESNO
capture label values q44b_3      YESNO
capture label values q44b_4      YESNO
capture label values q44b_5      YESNO
capture label values q44b_6      YESNO
capture label values q44b_7      YESNO
capture label values q44b_8      YESNO
capture label values q44b_9      YESNO
capture label values q44b_10     YESNO
capture label values q44b_11     YESNO
capture label values q45a        Q45
capture label values q45b        Q45
capture label values q45da       Q45D
capture label values q45db       Q45D
capture label values q45aa_1     YESNO
capture label values q45aa_2     YESNO
capture label values q45aa_3     YESNO
capture label values q45aa_4     YESNO
capture label values q45aa_5     YESNO
capture label values q45aa_6     YESNO
capture label values q45aa_7     YESNO
capture label values q45aa_8     YESNO
capture label values q45aa_9     YESNO
capture label values q45aa_10    YESNO
capture label values q45aa_11    YESNO
capture label values q45aa_12    YESNO
capture label values q45aa_13    YESNO
capture label values q45aa_14    YESNO
capture label values q45aa_15    YESNO
capture label values q45aa_16    YESNO
capture label values q45aa_17    YESNO
capture label values q45aa_18    YESNO
capture label values q45aa_19    YESNO
capture label values q45aa_20    YESNO
capture label values q45aa_21    YESNO
capture label values q45aa_22    YESNO
capture label values q45aa_23    YESNO
capture label values q45aa_24    YESNO
capture label values q45aa_25    YESNO
capture label values q45aa_26    YESNO

* New in 2018 *
capture label values q45aa_27     YESNO
capture label values q45aa_28     YESNO
capture label values q45aa_29     YESNO
capture label values q45aa_30     YESNO
capture label values q45aa_31     YESNO
capture label values q45aa_32     YESNO
capture label values q45aa_33     YESNO
capture label values q45aa_34     YESNO
capture label values q45aa_35     YESNO
capture label values q45aa_36     YESNO
capture label values q45aa_37     YESNO
capture label values q45aa_38     YESNO
capture label values q45aa_39     YESNO
capture label values q45aa_40     YESNO
capture label values q45aa_41     YESNO
capture label values q45aa_42     YESNO
capture label values q45aa_43     YESNO
capture label values q45aa_44     YESNO
capture label values q45aa_45     YESNO
capture label values q45aa_46     YESNO
capture label values q45aa_47     YESNO
capture label values q45aa_48     YESNO
capture label values q45aa_49     YESNO
capture label values q45aa_50     YESNO

capture label values q45ab_1     YESNO
capture label values q45ab_2     YESNO
capture label values q45ab_3     YESNO
capture label values q45ab_4     YESNO
capture label values q45ab_5     YESNO
capture label values q45ab_6     YESNO
capture label values q45ab_7     YESNO
capture label values q45ab_8     YESNO
capture label values q45ab_9     YESNO
capture label values q45ab_10    YESNO
capture label values q45ab_11    YESNO
capture label values q45ab_12    YESNO
capture label values q45ab_13    YESNO
capture label values q45ab_14    YESNO
capture label values q45ab_15    YESNO
capture label values q45ab_16    YESNO
capture label values q45ab_17    YESNO
capture label values q45ab_18    YESNO
capture label values q45ab_19    YESNO
capture label values q45ab_20    YESNO
capture label values q45ab_21    YESNO
capture label values q45ab_22    YESNO
capture label values q45ab_23    YESNO
capture label values q45ab_24    YESNO
capture label values q45ab_25    YESNO
capture label values q45ab_26    YESNO
* New in 2018 *
capture label values q45ab_27     YESNO
capture label values q45ab_28     YESNO
capture label values q45ab_29     YESNO
capture label values q45ab_30     YESNO
capture label values q45ab_31     YESNO
capture label values q45ab_32     YESNO
capture label values q45ab_33     YESNO
capture label values q45ab_34     YESNO
capture label values q45ab_35     YESNO
capture label values q45ab_36     YESNO
capture label values q45ab_37     YESNO
capture label values q45ab_38     YESNO
capture label values q45ab_39     YESNO
capture label values q45ab_40     YESNO
capture label values q45ab_41     YESNO
capture label values q45ab_42     YESNO
capture label values q45ab_43     YESNO
capture label values q45ab_44     YESNO
capture label values q45ab_45     YESNO
capture label values q45ab_46     YESNO
capture label values q45ab_47     YESNO
capture label values q45ab_48     YESNO
capture label values q45ab_49     YESNO
capture label values q45ab_50     YESNO
* Shown 2016 - 2017 *
capture label values q45ea_1     YESNO
capture label values q45ea_2     YESNO
capture label values q45ea_3     YESNO
capture label values q45ea_4     YESNO
capture label values q45ea_5     YESNO
capture label values q45ea_6     YESNO
capture label values q45ea_7     YESNO
capture label values q45ea_8     YESNO
capture label values q45ea_9     YESNO
capture label values q45ea_10    YESNO
capture label values q45ea_11    YESNO
capture label values q45ea_12    YESNO
capture label values q45ea_13    YESNO
capture label values q45eb_1     YESNO
capture label values q45eb_2     YESNO
capture label values q45eb_3     YESNO
capture label values q45eb_4     YESNO
capture label values q45eb_5     YESNO
capture label values q45eb_6     YESNO
capture label values q45eb_7     YESNO
capture label values q45eb_8     YESNO
capture label values q45eb_9     YESNO
capture label values q45eb_10    YESNO
capture label values q45eb_11    YESNO
capture label values q45eb_12    YESNO
capture label values q45eb_13    YESNO
* New in 2018 *
capture label values q45fa_17    YESNO
capture label values q45fa_1     YESNO
capture label values q45fa_2     YESNO
capture label values q45fa_3     YESNO
capture label values q45fa_4     YESNO
capture label values q45fa_5     YESNO
capture label values q45fa_6     YESNO
capture label values q45fa_7     YESNO
capture label values q45fa_8     YESNO
capture label values q45fa_9     YESNO
capture label values q45fa_10    YESNO
capture label values q45fa_11    YESNO
capture label values q45fa_12    YESNO
capture label values q45fa_13    YESNO
capture label values q45fa_14    YESNO
capture label values q45fa_15    YESNO
capture label values q45fa_16    YESNO
capture label values q45fb_17    YESNO
capture label values q45fb_1     YESNO
capture label values q45fb_2     YESNO
capture label values q45fb_3     YESNO
capture label values q45fb_4     YESNO
capture label values q45fb_5     YESNO
capture label values q45fb_6     YESNO
capture label values q45fb_7     YESNO
capture label values q45fb_8     YESNO
capture label values q45fb_9     YESNO
capture label values q45fb_10    YESNO
capture label values q45fb_11    YESNO
capture label values q45fb_12    YESNO
capture label values q45fb_13    YESNO
capture label values q45fb_14    YESNO
capture label values q45fb_15    YESNO
capture label values q45fb_16    YESNO
* New in 2018 *
capture label values q45ga_1     YESNO
capture label values q45ga_2     YESNO
capture label values q45ga_3     YESNO
capture label values q45ga_4     YESNO
capture label values q45ga_5     YESNO
capture label values q45ga_6     YESNO
capture label values q45ga_7     YESNO
capture label values q45gb_1     YESNO
capture label values q45gb_2     YESNO
capture label values q45gb_3     YESNO
capture label values q45gb_4     YESNO
capture label values q45gb_5     YESNO
capture label values q45gb_6     YESNO
capture label values q45gb_7     YESNO

* New in 2019 *
capture label values q45ha    	 Q45H
capture label values q45hb    	 Q45H

capture label values q45ca_1     YESNO
capture label values q45ca_2     YESNO
capture label values q45ca_3     YESNO
capture label values q45ca_4     YESNO
capture label values q45ca_5     YESNO
capture label values q45ca_6     YESNO
capture label values q45ca_7     YESNO
capture label values q45ca_8     YESNO
capture label values q45ca_9     YESNO
capture label values q45ca_10    YESNO
capture label values q45ca_11    YESNO
capture label values q45ca_12    YESNO
capture label values q45ca_13    YESNO
capture label values q45ca_14    YESNO
capture label values q45ca_15    YESNO
capture label values q45cb_1     YESNO
capture label values q45cb_2     YESNO
capture label values q45cb_3     YESNO
capture label values q45cb_4     YESNO
capture label values q45cb_5     YESNO
capture label values q45cb_6     YESNO
capture label values q45cb_7     YESNO
capture label values q45cb_8     YESNO
capture label values q45cb_9     YESNO
capture label values q45cb_10    YESNO
capture label values q45cb_11    YESNO
capture label values q45cb_12    YESNO
capture label values q45cb_13    YESNO
capture label values q45cb_14    YESNO
capture label values q45cb_15    YESNO
capture label values q45da       Q45D
capture label values q45db       Q45D
capture label values q46a        Q46
capture label values q46b        Q46
capture label values qp01        QP01
capture label values qp02        QP02
capture label values qp02_1      YESNO
capture label values qp02_2      YESNO
capture label values qp02_3      YESNO
capture label values qp02_4      YESNO
capture label values qp02a_1     YESNO
capture label values qp02a_2     YESNO
capture label values qp02a_3     YESNO
capture label values qp02a_4     YESNO
capture label values qp02a_5     YESNO
capture label values qp02a_6     YESNO
capture label values qp02a_7     YESNO
capture label values qp02a_8     YESNO
capture label values qp02a_9     YESNO
capture label values qp02a_10    YESNO
capture label values qp02a_11    YESNO
capture label values qp02a_12    YESNO
capture label values qp02b_1     YESNO
capture label values qp02b_2     YESNO
capture label values qp02b_3     YESNO
capture label values qp02b_4     YESNO
capture label values qp02b_5     YESNO
capture label values qp02b_6     YESNO
capture label values qp02b_7     YESNO
capture label values qp02b_8     YESNO
capture label values qp02b_9     YESNO
capture label values qp02b_10    YESNO
capture label values qpe01_1     YESNO
capture label values qpe01_2     YESNO
capture label values qpe01_3     YESNO

* New in 2016 * 
capture label values qpe01a      QPE01A

capture label values qpe02       QPE2
capture label values qp03_1      YESNO
capture label values qp03_2      YESNO
capture label values qp03_3      YESNO

* New in 2016 * 
capture label values qp03_47     YESNO

capture label values qp03_4      YESNO
capture label values qp03_5      YESNO
capture label values qp03_6      YESNO
capture label values qp03_7      YESNO
capture label values qp03_8      YESNO
capture label values qp03_9      YESNO
capture label values qp03_10     YESNO
capture label values qp03_11     YESNO
capture label values qp03_12     YESNO
capture label values qp03_13     YESNO
capture label values qp03_14     YESNO
capture label values qp03_15     YESNO
capture label values qp03_16     YESNO
capture label values qp03_17     YESNO
capture label values qp03_18     YESNO
capture label values qp03_19     YESNO
capture label values qp03_20     YESNO
capture label values qp03_21     YESNO
capture label values qp03_22     YESNO
capture label values qp03_23     YESNO
capture label values qp03_24     YESNO
capture label values qp03_25     YESNO
capture label values qp03_26     YESNO
capture label values qp03_27     YESNO
capture label values qp03_28     YESNO
capture label values qp03_29     YESNO
capture label values qp03_30     YESNO
capture label values qp03_31     YESNO
capture label values qp03_32     YESNO
capture label values qp03_33     YESNO
capture label values qp03_34     YESNO
capture label values qp03_35     YESNO
capture label values qp03_36     YESNO
capture label values qp03_37     YESNO
capture label values qp03_38     YESNO
capture label values qp03_39     YESNO
capture label values qp03_40     YESNO
capture label values qp03_41     YESNO
capture label values qp03_42     YESNO
capture label values qp03_43     YESNO
capture label values qp03_44     YESNO
capture label values qp03_45     YESNO
capture label values qp03_46     YESNO

* New in 2016 * 
capture label values qp03_48     YESNO

capture label values qp04        QP04
capture label values qp05        QP05
capture label values qp06        QP06
capture label values qp07        QP07
capture label values qp08        QP08
capture label values qp09        QP09

* New in 2016 * 
capture label values qp09a_1     YESNO
capture label values qp09a_2     YESNO
capture label values qp09a_3     YESNO
capture label values qp09a_4     YESNO
capture label values qp09a_5     YESNO
capture label values qp09a_6     YESNO
capture label values qp09a_7     YESNO

* New in 2016 * 
capture label values qp09b       QP09B

capture label values qp12        QP12


