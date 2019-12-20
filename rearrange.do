***
// code to resequence the variables in the file to match the order we might expect as a user
//    it is called by the initial cleanup program
***
* put the standard demos after the standard geo vars

move gender state
move age state
*move us01pgs qp12
*move us09kp usedu2
*move ushhi2 us09kp
*move hhcmp1 us09kp

* New in 2018 *
move us09kid usedu3

*move ushhi2 us09kid   // ushhi2 not used starting in SPRING 2017. Use ushhi3 instead
move ushhi3 us09kid

*move usreth3 sd3b_19
*move girl usrace2_1
*move agekid usrace2_1
*forvalues i=15(-1)1 {
*   move usrace2_`i' sd3b_19
*}

* New in 2019 *
move usreth3 dumqp11
move girl usrace301
move agekid usrace301
forvalues i=316(-1)301 {
   move usrace`i' dumqp11
}
forvalues i=47(-1)41 {
   move usrace`i' usrace316
}

move sd2  sd3a_1
move sd2a sd3a_1
move sd2b sd3a_1

forvalues i=1/36 {
   move dchild_`i' sd3a_1
}

* resort the screener questions
forvalues l=1(2)7 {
   local a = char(`l'+96)
   local b = char(`l'+97)
   move se2_`a' se2_`b'
   move se1a_`l' se2_a
*   move se1a_`a' se1a_1
   forvalues i = 1/5 {
      move se3_`a'_`i' se3_`b'_1
   }
   move se6_`a' se6_`b'
   move se5b_`l' se6_a
   move se5b_`a' se5b_1
}

* resort the occasion-specific questions into blocks for each occasion
foreach o in a b {

* arrange the QB series before the main occasion questions
   forvalues i=0/5 {
      capture confirm numeric var qb`i'`o'
      if !_rc move qb`i'`o' event_a
      forvalues k=97/110 {
         local a = char(`k')
         capture confirm numeric var qb`i'`a'`o'
         if !_rc move qb`i'`a'`o' event_a
         capture confirm string var qb`i'`a'`o'_text
         if !_rc move qb`i'`a'`o'_text event_a
*         forvalues j=1/20 {
* New in 2019 for QB5D
         forvalues j=1/70 {
            capture confirm numeric var qb`i'`a'`o'_`j'
            if !_rc move qb`i'`a'`o'_`j' event_a
            capture confirm string var qb`i'`a'`o'_`j'_text
            if !_rc move qb`i'`a'`o'_`j'_text event_a
         }
      }
   }
  
* zone
   forvalues i=1/3 {
      capture confirm numeric var q0`i'`o'
      if !_rc move q0`i'`o' event_a
*      forvalues j=1/20 {
      forvalues j=1/25 {   /* New in 2018 */
         capture confirm numeric var q0`i'`o'_`j'
         if !_rc move q0`i'`o'_`j' event_a
         capture confirm string var q0`i'`o'_`j'_text
         if !_rc move q0`i'`o'_`j'_text event_a
      }
*      forvalues k=97/105 {
* New in 2018 *
      forvalues k=97/107 {
         local a = char(`k')
         capture confirm numeric var q0`i'`a'`o'
         if !_rc move q0`i'`a'`o' event_a
         capture confirm string var q0`i'`a'`o'_text
         if !_rc move q0`i'`a'`o'_text event_a
         forvalues j=1/20 {
            capture confirm numeric var q0`i'`a'`o'_`j'
            if !_rc move q0`i'`a'`o'_`j' event_a
            capture confirm string var q0`i'`a'`o'_`j'_text
            if !_rc move q0`i'`a'`o'_`j'_text event_a
         }
      }
   }

* pre-foods
   forvalues k=97/99 {
      local a = char(`k')
      capture confirm numeric var q04`a'`o'
      if !_rc move q04`a'`o' event_a
      capture confirm string var q04`a'`o'_text
      if !_rc move q04`a'`o'_text event_a
      forvalues j=1/20 {
         capture confirm numeric var q04`a'`o'_`j'
         if !_rc move q04`a'`o'_`j' event_a
         capture confirm string var q04`a'`o'_`j'_text
         if !_rc move q04`a'`o'_`j'_text event_a
      }
   }

* foods
   forvalues j=1/45 {
      capture confirm numeric var q04`o'_`j'
      if !_rc move q04`o'_`j' event_a
   }
   forvalues k=100/102 {
      local a = char(`k')
      capture confirm numeric var q04`a'`o'
      if !_rc move q04`a'`o' event_a
      capture confirm string var q04`a'`o'_text
      if !_rc move q04`a'`o'_text event_a
      forvalues j=1/45 {
         capture confirm numeric var q04`a'`o'_`j'
         if _rc continue
         move q04`a'`o'_`j' event_a
         capture confirm string var q04`a'`o'_`j'_text
         if !_rc move q04`a'`o'_`j'_text event_a
      }
   }
   forvalues i=5/9 {
      capture confirm numeric var q0`i'`o'
      if !_rc move q0`i'`o' event_a
      forvalues j=1/30 {
         capture confirm numeric var q0`i'`o'_`j'
         if _rc continue
         move q0`i'`o'_`j' event_a
         capture confirm string var q0`i'`o'_`j'_text
         if !_rc move q0`i'`o'_`j'_text event_a
      }
      forvalues k=97/99 {
         local a = char(`k')
         capture confirm numeric var q0`i'`a'`o'
         if !_rc move q0`i'`a'`o' event_a
         capture confirm string var q0`i'`a'`o'_text
         if !_rc move q0`i'`a'`o'_text event_a
         forvalues j=1/30 {
            capture confirm numeric var q0`i'`a'`o'_`j'
            if _rc continue
            move q0`i'`a'`o'_`j' event_a
            capture confirm string var q0`i'`a'`o'_`j'_text
            if !_rc move q0`i'`a'`o'_`j'_text event_a
         }
      }
   }
   forvalues i=10/32 {
      capture confirm numeric var q`i'`o'
      if !_rc {
         move q`i'`o' event_a
         capture confirm string var q`i'`o'_text
         if !_rc move q`i'`o'_text event_a
      }
*      forvalues j=1/39 {
* New in 2018 *
	  forvalues j=1/42 {
         capture confirm numeric var q`i'`o'_`j'
         if _rc continue
         move q`i'`o'_`j' event_a
         capture confirm string var q`i'`o'_`j'_text
         if !_rc move q`i'`o'_`j'_text event_a
      }
      forvalues k=97/99 {
         local a = char(`k')
         capture confirm numeric var q`i'`a'`o'
         if !_rc move q`i'`a'`o' event_a
         capture confirm string var q`i'`a'`o'_text
         if !_rc move q`i'`a'`o'_text event_a
*         forvalues j=1/39 {
* New in 2018 *
		 forvalues j=1/42 {
            capture confirm numeric var q`i'`a'`o'_`j'
            if _rc continue
            move q`i'`a'`o'_`j' event_a
            capture confirm string var q`i'`a'`o'_`j'_text
            if !_rc move q`i'`a'`o'_`j'_text event_a
         }
      }
   }

* beverages
   forvalues i=33/36 {
      capture confirm numeric var q`i'`o'
      if !_rc move q`i'`o' event_a
*      forvalues j=1/36 {
* New in 2019 *
      forvalues j=1/39 {
         capture confirm numeric var q`i'`o'_`j'
         if _rc continue
         move q`i'`o'_`j' event_a
         capture confirm string var q`i'`o'_`j'_text
         if !_rc move q`i'`o'_`j'_text event_a
      }
      forvalues k=97/101 {
         local a = char(`k')
         capture confirm numeric var q`i'`a'`o'
         if !_rc move q`i'`a'`o' event_a
         capture confirm string var q`i'`a'`o'_text
         if !_rc move q`i'`a'`o'_text event_a
*         forvalues j=1/36 {
* New in 2019 *
         forvalues j=1/39 {
            capture confirm numeric var q`i'`a'`o'_`j'
            if _rc continue
            move q`i'`a'`o'_`j' event_a
            capture confirm string var q`i'`a'`o'_`j'_text
            if !_rc move q`i'`a'`o'_`j'_text event_a
         }
      }
   }

* satisfaction, shopping, categories & brands
   forvalues i=38/46 {
      capture confirm numeric var q`i'`o'
      if !_rc move q`i'`o' event_a
      capture confirm string var q`i'`o'_text
      if !_rc move q`i'`o'_text event_a
      forvalues j=1/26 {
         capture confirm numeric var q`i'`o'_`j'
         if !_rc move q`i'`o'_`j' event_a
         capture confirm string var q`i'`o'_`j'_text
         if !_rc move q`i'`o'_`j'_text event_a
      }
*      forvalues k=97/101 {
* New in 2018 *
*      forvalues k=97/103 {
* New in 2019 for Q45H *
      forvalues k=97/104 {
         local a = char(`k')
         capture confirm numeric var q`i'`a'`o'
         if !_rc move q`i'`a'`o' event_a
         capture confirm string var q`i'`a'`o'_text
         if !_rc move q`i'`a'`o'_text event_a
*         forvalues j=1/26 {
* New in 2018 *
         forvalues j=1/50 {
            capture confirm numeric var q`i'`a'`o'_`j'
            if !_rc move q`i'`a'`o'_`j' event_a
            capture confirm string var q`i'`a'`o'_`j'_text
            if !_rc move q`i'`a'`o'_`j'_text event_a
         }
      }
   }

* Reorder new variables added to existing lists over the years   
* New in 2019 *
    move qb2b`o'_12 qb2b`o'_11
	move qb5d`o'_2 qb5d`o'_64
	move qb5d`o'_3 qb5d`o'_57
	move qb5d`o'_17 qb5d`o'_62
	move qb5d`o'_19 qb5d`o'_17
	move qb5d`o'_20 qb5d`o'_19
	move qb5d`o'_21 qb5d`o'_58
	move qb5d`o'_22 qb5d`o'_65
	move qb5d`o'_26 qb5d`o'_64
	move qb5d`o'_28 qb5d`o'_26
	move qb5d`o'_30 qb5d`o'_2
	move qb5d`o'_31 qb5d`o'_30
	move qb5d`o'_34 qb5d`o'_65
	move qb5d`o'_35 qb5d`o'_21
	move qb5d`o'_37 qb5d`o'_66
	move qb5d`o'_38 qb5d`o'_37
	move qb5d`o'_42 qb5d`o'_57
	move qb5d`o'_37_text qb5d`o'_37

	move q03a`o'_12 q03a`o'_3   /* New in 2016 */
	move q03a`o'_13 q03a`o'_7   /* New in 2016 */
	move q03a`o'_14 q03a`o'_7   /* New in 2016 */
	move q03a`o'_15 q03a`o'_7   /* New in 2016 */
	move q03a`o'_16 q03a`o'_7   /* New in 2016 */
	move q03a`o'_17 q03a`o'_7   /* New in 2016 */
	move q03a`o'_18 q03a`o'_11   /* New in 2018 */
	move q17`o'_13 q17`o'_8   /* New in 2018 */
	
* New in 2019 *
    move q21`o'_9 q21`o'_4
    move q30a`o'_28 q30a`o'_23

	move q31`o'_39 q31`o'_7   /* New in 2016; removed in 2019 because Q31 is removed - ENDED UP KEEPING FOR MASTER FILE 111119 */ 
	move q31`o'_40 q31`o'_13   /* New in 2018; removed in 2019 because Q31 is removed - ENDED UP KEEPING FOR MASTER FILE 111119 */
	move q31`o'_41 q31`o'_13   /* New in 2018; removed in 2019 because Q31 is removed - ENDED UP KEEPING FOR MASTER FILE 111119 */
	move q31`o'_42 q31`o'_30   /* New in 2018; removed in 2019 because Q31 is removed - ENDED UP KEEPING FOR MASTER FILE 111119 */
	move q31a`o'_39 q31a`o'_7   /* New in 2016 */
	move q31a`o'_40 q31a`o'_13   /* New in 2018 */
	move q31a`o'_41 q31a`o'_13   /* New in 2018; removed in 2019 because Q31 is removed - ENDED UP KEEPING FOR MASTER FILE 111119 */
	move q31a`o'_42 q31a`o'_30

* New in 2019 *
    move q31c`o' q31`o'_1
    move q31d`o'_1 q31a`o'_1
    move q31d`o'_2 q31a`o'_1
    move q31d`o'_3 q31a`o'_1
    move q31d`o'_6 q31a`o'_1
    move q31d`o'_7 q31a`o'_1
    move q31d`o'_39 q31d`o'_7
    move q31d`o'_8 q31a`o'_1
    move q31d`o'_9 q31a`o'_1
    move q31d`o'_10 q31a`o'_1
    move q31d`o'_11 q31a`o'_1
    move q31d`o'_12 q31a`o'_1
    move q31d`o'_13 q31a`o'_1
    move q31d`o'_14 q31a`o'_1
    move q31d`o'_15 q31a`o'_1
    move q31d`o'_16 q31a`o'_1
    move q31d`o'_17 q31a`o'_1
    move q31d`o'_18 q31a`o'_1
    move q31d`o'_19 q31a`o'_1
    move q31d`o'_20 q31a`o'_1
    move q31d`o'_21 q31a`o'_1
    move q31d`o'_22 q31a`o'_1
    move q31d`o'_23 q31a`o'_1
    move q31d`o'_24 q31a`o'_1
    move q31d`o'_25 q31a`o'_1
    move q31d`o'_26 q31a`o'_1
    move q31d`o'_27 q31a`o'_1
    move q31d`o'_28 q31a`o'_1
    move q31d`o'_29 q31a`o'_1
    move q31d`o'_30 q31a`o'_1
    move q31d`o'_31 q31a`o'_1
    move q31d`o'_32 q31a`o'_1
    move q31d`o'_33 q31a`o'_1
    move q31d`o'_34 q31a`o'_1
    move q31d`o'_35 q31a`o'_1
    move q31d`o'_36 q31a`o'_1
    move q31d`o'_40 q31d`o'_13
    move q31d`o'_42 q31d`o'_30
    move q31d`o'_43 q31d`o'_28
    move q31d`o'_44 q31d`o'_31
    move q31d`o'_46 q31d`o'_3
    move q31d`o'_49 q31d`o'_12
    move q31d`o'_51 q31d`o'_13
    move q31d`o'_52 q31d`o'_13
    move q31d`o'_55 q31d`o'_9
    move q31d`o'_56 q31d`o'_22
    move q31d`o'_57 q31d`o'_6
    move q31d`o'_60 q31d`o'_57
    move q31d`o'_61 q31d`o'_57
    move q31d`o'_65 q31d`o'_34
    move q31d`o'_37 q31a`o'_1
    move q31d`o'_37_text q31a`o'_1
    move q31d`o'_38 q31a`o'_1
    move q31a`o'_43 q31a`o'_28
    move q31a`o'_44 q31a`o'_31
    move q31a`o'_46 q31a`o'_3
    move q31a`o'_49 q31a`o'_12
    move q31a`o'_51 q31a`o'_13
    move q31a`o'_52 q31a`o'_13
    move q31a`o'_55 q31a`o'_9
    move q31a`o'_56 q31a`o'_22
    move q31a`o'_57 q31a`o'_6
    move q31a`o'_60 q31a`o'_57
    move q31a`o'_61 q31a`o'_57
    move q31a`o'_65 q31a`o'_34

	
	*ROBERT - also q36a before q33a

	
	
	
	
* New in 2019 *
	move q33c`o'_14 q33c`o'_13
	move q33c`o'_15 q33c`o'_13
	move q33c`o'_16 q33c`o'_13

	move q34`o'_11 q34`o'_10
	move q34`o'_12 q34`o'_10
	move q34`o'_13 q34`o'_10

* New in 2019 *
    move q36a`o'_7 q36a`o'_2
    move q36a`o'_4 q36a`o'_3
    move q36a`o'_8 q36a`o'_3
    move q36a`o'_9 q36a`o'_5
	
	move q45a`o'_27 q45a`o'_1	
	move q45a`o'_28 q45a`o'_2
	move q45a`o'_29 q45a`o'_2
	move q45a`o'_30 q45a`o'_2	
	move q45a`o'_31 q45a`o'_4	
	move q45a`o'_32 q45a`o'_6	
	move q45a`o'_33 q45a`o'_8
	move q45a`o'_34 q45a`o'_8
	move q45a`o'_35 q45a`o'_8
	move q45a`o'_36 q45a`o'_8	
	move q45a`o'_37 q45a`o'_9
	move q45a`o'_38 q45a`o'_9
	move q45a`o'_39 q45a`o'_9
	move q45a`o'_40 q45a`o'_9
	move q45a`o'_41 q45a`o'_9
	move q45a`o'_42 q45a`o'_9
	move q45a`o'_43 q45a`o'_9	
	move q45a`o'_44 q45a`o'_10	
	move q45a`o'_45 q45a`o'_16	
	move q45a`o'_46 q45a`o'_17	
	move q45a`o'_47 q45a`o'_18
	move q45a`o'_48 q45a`o'_21	
	move q45a`o'_49 q45a`o'_25
	move q45a`o'_50 q45a`o'_26
}

* move the QP series above the QB questions
forvalues i=1/9 {
   capture confirm numeric var qp0`i'
   if !_rc {
*      move qp0`i' usrace2_1   * Pre-2016
*      move qp0`i' se1_a   * New in 2016
* New in 2019
	  move qp0`i' dumqp101
      capture confirm string var qp0`i'_text
*      if !_rc move qp0`i'_text usrace2_1   * Pre-2016
*      if !_rc move qp0`i'_text se1_a   * New in 2016
* New in 2019
      if !_rc move qp0`i'_text dumqp101
   }
   forvalues j=1/50 {
      capture confirm numeric var qp0`i'_`j'
      if _rc continue, break
*      move qp0`i'_`j' usrace2_1   * Pre-2016
*      move qp0`i'_`j' se1_a   * New in 2016
* New in 2019
      move qp0`i'_`j' dumqp101   
      capture confirm string var qp0`i'_`j'_text
*      if !_rc move qp0`i'_`j'_text usrace2_1   * Pre-2016
*      if !_rc move qp0`i'_`j'_text se1_a   * New in 2016
* New in 2019
      if !_rc move qp0`i'_`j'_text dumqp101
   }
   forvalues k=97/99 {
      local a = char(`k')
      capture confirm numeric var qp0`i'`a'
      if !_rc {
*         move qp0`i'`a' usrace2_1   * Pre-2016
*         move qp0`i'`a' se1_a   * New in 2016
* New in 2019
         move qp0`i'`a' dumqp101
         capture confirm string var qp0`i'`a'_text
*         if !_rc move qp0`i'`a'_text usrace2_1   * Pre-2016
*         if !_rc move qp0`i'`a'_text se1_a   * New in 2016
* New in 2019
         if !_rc move qp0`i'`a'_text dumqp101
      }
      forvalues j=1/15 {
         capture confirm numeric var qp0`i'`a'_`j'
         if _rc continue, break
*         move qp0`i'`a'_`j' usrace2_1   * Pre-2016
*         move qp0`i'`a'_`j' se1_a   * New in 2016
* New in 2019
         move qp0`i'`a'_`j' dumqp101
         capture confirm string var qp0`i'`a'_`j'_text
*         if !_rc move qp0`i'`a'_`j'_text usrace2_1   * Pre-2016
*         if !_rc move qp0`i'`a'_`j'_text se1_a   * New in 2016
* New in 2019
         if !_rc move qp0`i'`a'_`j'_text dumqp101
      }
   }
}

forvalues i=1/2 {
   capture confirm numeric var qpe0`i'
   if !_rc move qpe0`i' se1_a
   forvalues j=1/4 {
      capture confirm numeric var qpe0`i'_`j'
      if !_rc move qpe0`i'_`j' se1_a
   }
}

* New in 2016 *
move mrk_qpe1a qpe02
move qp03_47 qp03_4
move qpe01a qpe02

* New in 2019 *
move qa1a qb0a
move qa1b qb0b
move event_a qa1a
move event_b qa1b
move qb0aa_18 qb5ca_5
move qb0aa_17_text qb5ca_5
move qb0aa_17 qb5ca_5
move qb0aa_16 qb5ca_5
move qb0aa_15 qb5ca_5
move qb0aa_14 qb5ca_5
move qb0aa_13 qb5ca_5
move qb0aa_12 qb5ca_5
move qb0aa_11 qb5ca_5
move qb0aa_10 qb5ca_5
move qb0aa_9 qb5ca_5
move qb0aa_8 qb5ca_5
move qb0aa_7 qb5ca_5
move qb0aa_6 qb5ca_5
move qb0aa_5 qb5ca_5
move qb0aa_4 qb5ca_5
move qb0aa_3 qb5ca_5
move qb0aa_2 qb5ca_5
move qb0aa_1 qb5ca_5
move qb0ab_18 qb5cb_5
move qb0ab_17_text qb5cb_5
move qb0ab_17 qb5cb_5
move qb0ab_16 qb5cb_5
move qb0ab_15 qb5cb_5
move qb0ab_14 qb5cb_5
move qb0ab_13 qb5cb_5
move qb0ab_12 qb5cb_5
move qb0ab_11 qb5cb_5
move qb0ab_10 qb5cb_5
move qb0ab_9 qb5cb_5
move qb0ab_8 qb5cb_5
move qb0ab_7 qb5cb_5
move qb0ab_6 qb5cb_5
move qb0ab_5 qb5cb_5
move qb0ab_4 qb5cb_5
move qb0ab_3 qb5cb_5
move qb0ab_2 qb5cb_5
move qb0ab_1 qb5cb_5

* New in 2019 *
* arrange the Q50 series before Q40a
foreach var of varlist prog_q50_food01 - prog_q50_beverage28 {
move `var' q40a
}

foreach o in f b {
	foreach i in a b {
		forvalues j=1/29 {
			capture confirm string var q50`o'`i'_`j'
			if !_rc move q50`o'`i'_`j' q40`i'
		}
		forvalues j=1/29 {
			capture confirm numeric var q50`o'd`i'_`j'
			if !_rc move q50`o'd`i'_`j' q40`i'
		}  
	} 
} 
         

*** create all of the dummy stub variables so our "check all" variables have titles

* New in 2016 *
gen sd2c = .
move sd2c sd2
gen sd3a = .
move sd3a sd3a_1
gen sd3b = .
move sd3b sd3b_1
gen se1 = .
move se1 se1_a
gen se1a = .
move se1a se1a_a
gen se2 = .
move se2 se2_a
gen se3 = .
move se3 se3_a_1
gen se5 = .
move se5 se5_a
gen se5a = .
move se5a se5a_a
gen se5b = .
move se5b se5b_a
gen se6 = .
move se6 se6_a
gen qp02a = .
move qp02a qp02a_1
gen qp02b = .
move qp02b qp02b_1
gen qpe01 = .
move qpe01 qpe01_1
gen qp03 = .
move qp03 qp03_1

* New in 2016 *
gen qp09a = .
move qp09a qp09a_1

gen qb0aa = .
move qb0aa qb0aa_1
gen qb1a = .
move qb1a qb1aa_1
gen qb1d = .
move qb1d qb1da_1
gen qb1f = .
move qb1f qb1fa_1
gen qb1h = .
move qb1h qb1ha_1

* New in 2016 *
gen qb1i = .
move qb1i qb1ia_1

gen qb2b = .
move qb2b qb2ba_1
gen qb2d = .
move qb2d qb2da_1

* New in 2018 *
gen qb2j = .
move qb2j qb2ja_1

gen qb3d = .
move qb3d qb3da_1

gen qb4c = .
move qb4c qb4ca_1

* New in 2019 *
gen qb5c = .
move qb5c qb5ca_1
gen qb5d = .
move qb5d qb5da_43

gen q01 = .
move q01 q01a_1
gen q02 = .
move q02 q02a_1
gen q02a = .
move q02a q02aa_2
gen q02b = .
move q02b q02ba_1
gen q03 = .
move q03 q03a_1
*forvalues i=97/105 {
* New in 2018 *
forvalues i=97/107 {
   local a = char(`i')
   capture confirm numeric var q03`a'a
   if _rc {
      gen q03`a' = .
      move q03`a' q03`a'a_1
   }
}

gen q04 = .
move q04 q04a_1
gen q04d = .
move q04d q04da_1
gen q04e = .
move q04e q04ea_1

forvalues i=5/8 {
   capture confirm numeric var q0`i'a
   if _rc {
      gen q0`i' = .
      move q0`i' q0`i'a_1
   }
   capture confirm numeric var q0`i'aa
   if _rc {
      gen q0`i'a = .
      move q0`i'a q0`i'aa_1
   }
}
forvalues i=10/32 {
   capture confirm numeric var q`i'a
   if _rc {
      capture confirm numeric var q`i'a_1
      if !_rc {
         gen q`i' = .
         move q`i' q`i'a_1
      }
   }
*   capture confirm numeric var q`i'aa
*   if _rc {
*      capture confirm numeric var q`i'aa_1
*      if !_rc {
*         gen q`i'a = .
*         move q`i'a q`i'aa_1
*      }
*   }

* New in 2018 for Q11B and Q31B*
   forvalues l=97/101 {
      local a = char(`l')
      capture confirm numeric var q`i'`a'a
      if _rc {
         capture confirm numeric var q`i'`a'a_1
         if !_rc {
            gen q`i'`a' = .
            move q`i'`a' q`i'`a'a_1
         }
      }
   }
}
forvalues i=33/36 {
   capture confirm numeric var q`i'a
   if _rc {
      capture confirm numeric var q`i'a_1
      if !_rc {
         gen q`i' = .
         move q`i' q`i'a_1
      }
   }
   forvalues l=97/101 {
      local a = char(`l')
      capture confirm numeric var q`i'`a'a
      if _rc {
         capture confirm numeric var q`i'`a'a_1
         if !_rc {
            gen q`i'`a' = .
            move q`i'`a' q`i'`a'a_1
         }
      }
   }
}

* New in 2019 *
gen q50f = .
move q50f q50fa_1
gen q50b = .
move q50b q50ba_1

gen q42 = .
move q42 q42a_1
gen q43 = .
move q43 q43a_1
gen q44 = .
move q44 q44a_1
gen q45aa = .
*move q45aa q45aa_1

* New in 2018 *
move q45aa q45aa_27

gen q45c = .
move q45c q45ca_1
* New in 2016 *
gen q45e = .
move q45e q45ea_1
* New in 2018 *
gen q45f = .
move q45f q45fa_1
gen q45g = .
move q45g q45ga_1



