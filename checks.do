***
// code to produce any output desired to check on transformations or anything else
//   these are meant only to be diagnostics for the file building process
//    it is called by the "reform vars.do" program as its last step
***
t day piece, miss
t weekday weekpart

t age generation, miss

t state division, miss
t state region, miss

summ eatings, detail
t1 eatings keatings

t zone

*pcent   occ2var if !kidocc, inc(all) by(sd2) out(occ2var.txt) n("U N W E I G H T E D   ( A D U L T )")
*pcent   occ2var if  kidocc, inc(all) by(sd2) out(occ2var.txt) n("U N W E I G H T E D   ( K I D S )") app
pcent   adult occ2var, inc(all) by(sd2) out(occ2var.txt) n("U N W E I G H T E D")


* Combine Teen significant other with friends occasions 011719
clonevar occ2vart = occ2var if occasion==2
label copy OCC2VAR OCC2VART
label define OCC2VART 2 "Early morning snack with significant other/friends" 7 "Breakfast with significant other/friends" 12 "Morning snack with significant other/friends" 17 "Lunch with significant other/friends" 22 "Afternoon snack with significant other/friends" 27 "Dinner with significant other/friends" 32 "After dinner snack with significant other/friends" 37 "Late night meal with significant other/friends", modify
label val occ2vart OCC2VART
recode occ2vart (4=2) (9=7) (14=12) (19=17) (24=22) (29=27) (34=32) (39=37)

preserve
keep if occasion==2
pcent   occasion occ2vart, inc(all) by(gender) out(occ2var_teen.txt) n("U N W E I G H T E D  T E E N S")
restore
