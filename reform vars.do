***
// this just calls all of the programs that do the real work,
//   here we can insert new programs, as needed, without messing up the general Compass build program
//      we re-run the "vallabel.do" program, since labels for variables newly created in this phase
//       weren't saved with the cleaned data file
//       (i.e., the variables didn't exist, so the label defs were dropped)
//    it is called by the "build Compass.do" program after the initial cleanup
***

* pull up the label definitions again
include "`dir'\vallabel.do"

* create some vars needed for weighting
include "`dir'\prewgt.do"

* weight the population to match Census
include "`dir'\popwgt.do"

* stack the occasion data
include "`dir'\stack occs.do"

* create some useful variables and edit some others
include "`dir'\transforms.do"

* check our codings to see if they worked as expected
include "`dir'\checks.do"
