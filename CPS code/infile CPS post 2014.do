***
// code to load a standard *post 2014* CPS raw data file
//    it expects the data file to have specific variables, names and codes
//    it will fail if these expectations aren't met
//    it is called as the first step in the "run CPS.do" program
***
#delimit ;
clear ;

label define YESNO 0 "No" 1 "Yes";

label define GESTFIPS
01  "Alabama"
02  "Alaska"
04  "Arizona"
05  "Arkansas"
06  "California"
08  "Colorado"
09  "Connecticut"
10  "Delaware"
11  "District of Columbia"
12  "Florida"
13  "Georgia"
15  "Hawaii"
16  "Idaho"
17  "Illinois"
18  "Indiana"
19  "Iowa"
20  "Kansas"
21  "Kentucky"
22  "Louisiana"
23  "Maine"
24  "Maryland"
25  "Massachusetts"
26  "Michigan"
27  "Minnesota"
28  "Mississippi"
29  "Missouri"
30  "Montana"
31  "Nebraska"
32  "Nevada"
33  "New Hampshire"
34  "New Jersey"
35  "New Mexico"
36  "New York"
37  "North Carolina"
38  "North Dakota"
39  "Ohio"
40  "Oklahoma"
41  "Oregon"
42  "Pennsylvania"
44  "Rhode Island"
45  "South Carolina"
46  "South Dakota"
47  "Tennessee"
48  "Texas"
49  "Utah"
50  "Vermont"
51  "Virginia"
53  "Washington"
54  "West Virginia"
55  "Wisconsin"
56  "Wyoming"
72  "Puerto Rico"
;
label define PEEDUCA
-1  "Not in Universe"
31  "Less Than 1st Grade"
32  "1st,2nd,3rd Or 4th Grade"
33  "5th Or 6th Grade"
34  "7th Or 8th Grade"
35  "9th Grade"
36  "10th Grade"
37  "11th Grade"
38  "12th Grade No Diploma"
39  "High School Grad-Diploma Or Equiv (ged)"
40  "Some College But No Degree"
41  "Associate Degree-Occupational/Vocationl"
42  "Associate Deg.-Academic Program"
43  "Bachelor''s Degree(ex:ba,ab,bs)"
44  "MASTER''S DEGREE(EX:MA,MS,MEng,MEd,MSW)"
45  "Professional School Deg(ex:md,dds,dvm)"
46  "DOCTORATE DEGREE(EX:PhD,EdD)"
;
label define PEHSPNON
1  "Hispanic"
2  "Non-Hispanic"
;
label define PEMARITL
-1  "Not in Universe"
1  "Married - Spouse Present"
2  "Married-Spouse Absent"
3  "Widowed"
4  "Divorced"
5  "Separated"
6  "Never Married"
;
label define PERRP
1  "Ref Pers with other relativew in HH"
2  "REF PERS WITH NO OTHER RELATIVES IN HH"
3  "SPOUSE"
4  "CHILD"
5  "GRANDCHILD"
6  "PARENT"
7  "BROTHER/SISTER"
8  "OTHER RELATIVE"
9  "FOSTER CHILD"
10  "Non-rel of ref. per w/own rels in HH"
11  "Not used"
12  "NON-REL OF REF PER W/NO OWN RELS IN HH"
13  "Unmarried partner w/ own rels in HH"
14  "Unmar. partner w/ no own rels in HH"
15  "Housemate/roommate w/ own rels in HH"
16  "Hsemate/roommate w/ no own rels in HH"
17  "Roomer/boarder w/ own rels in HH"
18  "Roomer/brder w/ no own rels in HH"
;
label define PESEX
1  "Male"
2  "Female"
;
label define PRCHLD
-1  "NIU (Not a parent)"
0  "No own children under 18 years of age"
1  "All own children 0- 2 years of age"
2  "All own chldrn 3- 5 years of age"
3  "All own chldrn 6-13 years of age"
4  "All own chldrn 14-17 years of age"
5  "Own chldrn 0-2,3-5 years of age (none  6-17)"
6  "Own chldrn 0-2,6-13 years of age (none  3- 5 or 14-17)"
7  "Own chldrn 0-2,14-17 years of age (none  3-13)"
8  "Own chldrn 3-5,6-13 years of age (none  0- 2 or 14-17)"
9  "Own chldrn 3-5,14-17 years of age (none  0- 2 or  6-13)"
10  "Own children 6-13 and 14-17 years of age (none  0- 5)"
11  "Own children 0-2, 3- 5, and  6-13 years of age (none 14-17)"
12  "Own chldrn 0-2, 3- 5, and 14-17 years of age (none 6-13)"
13  "Own childrn 0-2, 6-13, and 14-17 years of age (none 3- 5)"
14  "Own children 3-5, 6-13, and 14-17 years of age (none  0- 2)"
15  "Own children from all age groups"
;
label define PRCITSHP
1  "Native, Born In US"
2  "Native, Born in PR or US Outlying Area"
3  "Native, Born Abroad Of US Parent(s)"
4  "Foreign Born, US Cit By Naturalization"
5  "Foreign Born, Not a US Citizen"
;
label define PRFAMTYP
1  "Primary family"
2  "Primary Individual"
3  "Related subfamily"
4  "Unrelated subfamily"
5  "Secondary individual"
;
label define PRINUYER
-1  "Not In Universe (Born In U.S.)"
0  "Not Foreign Born,(Born in the U. S.)"
1  "Before 1950"
2  "1950-1959"
3  "1960-1964"
4  "1965-1969"
5  "1970-1974"
6  "1975-1979"
7  "1980-1981"
8  "1982-1983"
9  "1984-1985"
10  "1986-1987"
11  "1988-1989"
12  "1990-1991"
13  "1992-1993"
14  "1994-1995"
15  "1996-1997"
16  "1998-1999"
17  "2000-2001"
18  "2002-2003"
19  "2004-2005"
20  "2006-2007"
21  "2008-2009"
22  "2010-2011"
23  "2012-2014"
;
label define PRNMCHLD
-1  "NIU (Not a parent)"
;
label define PTDTRACE
01  "White only"
02  "Black only"
03  "American Indian, Alaskan Native Only"
04  "Asian only"
05  "Hawaiian/Pacific Islander Only"
06  "White-Black"
07  "White-AI"
08  "White-Asian"
09  "White-HP"
10  "Black-AI"
11  "Black-Asian"
12  "Black-HP"
13  "AI-Asian"
14  "AI-HP"
15  "Asian-HP"
16  "W-B-AI"
17  "W-B-A"
18  "W-B-HP"
19  "W-AI-A"
20  "W-AI-HP"
21  "W-A-HP"
22  "B-AI-A"
23  "W-B-AI-A"
24  "W-AI-A-HP"
25  "Other 3 Race Combinations"
26  "Other 4 and 5 Race Combinations"
;
label define GEREG
1  "Northeast"
2  "Midwest (formerly North Central)"
3  "South"
4  "West"
;
label define HEFAMINC
1  "Less Than $5,000"
2  "5,000 To 7,499"
3  "7,500 To 9,999"
4  "10,000 To 12,499"
5  "12,500 To 14,999"
6  "15,000 To 19,999"
7  "20,000 To 24,999"
8  "25,000 To 29,999"
9  "30,000 To 34,999"
10  "35,000 To 39,999"
11  "40,000 To 49,999"
12  "50,000 To 59,999"
13  "60,000 To 74,999"
14  "75,000 To 99,999"
15  "100,000 To 149,999"
16  "150,000 or More"
;
label define HRHTYPE
-1  "In Universe, Met No Conditions To Assign"
0  "Non-Interview Household"
1  "Husband/Wife Primary Family(neither AF)"
2  "Husb/Wife Prim. Family(either/Both AF)"
3  "Unmarried Civilian Male-Prim Fam Hhlder"
4  "Unmarried Civ. Female-Prim Fam Hhlder"
5  "Primary Family Hhlder-Rp In AF,unmar."
6  "Civilian Male Primary Individual"
7  "Civilian Female Primary Individual"
8  "Primary Individual Hhld-Rp In AF"
9  "Group Quarters With Family"
10  "Grp Quarters Without Family"
;
label define PEMLR
-1  "Not in Universe"
1  "Employed-At Work"
2  "Employed-Absent"
3  "Unemployed-On Layoff"
4  "Unemployed-Looking"
5  "Retired-Not In Labor Force"
6  "Disabled-Not In Labor Force"
7  "Other-Not In Labor Force"
;
label define PENLFACT
-1  "Not in Universe"
1  "Disabled"
2  "Ill"
3  "In School"
4  "Taking Care Of House Or Family"
5  "In Retirement"
6  "Something Else/Other"
;
label define PRFTLF
-1  "In Universe, Met No Conditions To Assign"
1  "Full time labor force"
2  "Part Time Labor Force"
;

insheet using "CPS `yymm'.asc", names tab clear;
lowvar;

label variable hrhhid   "HRHHID";
label variable hrhhid2  "HRHHID2";
label variable occurnum " ";
label variable yyyymm   " ";
label variable gestfips "Geography-FIPS state code";
label variable peeduca  "Demographics-highest level of school completed";
label variable pehspnon "Demographics- hispanic/non-hispanic origin";
label variable pemaritl "Demographics-marital status";
label variable perrp    "Demographics-relationship to reference person";
label variable pesex    "Demographics-sex";
label variable prchld   "Demographics-presence of own children <18 years by age group";
label variable prcitshp "Demographics-United States citizenship group";
label variable prfamtyp "Demographics-family type(recode)";
label variable prinuyer "Recoded Year of Entry for Foreign Born";
label variable prnmchld "Demographics-number of own children <18 years of age";
label variable prtage   "Demographics - age topcoded at 85, 90 or 80 (see full description)";
label variable ptdtrace "Demographics- race of respondent";
label variable gereg    "Geography-region";
label variable hefaminc "Household-total family income in past 12 months";
label variable hrhtype  "Household-type of family/single individual";
label variable hrnumhou "Household-total # of members";
label variable pemlr    "Labor Force-employment status";
label variable penlfact "Labor Force-(not in)reason";
label variable prftlf   "Labor Force-full-time/part-time";
label variable hwhhwgt  "Weight-household";
label variable pwfmwgt  "Weight-family";
label variable pwsswgt  "Weight-second stage weight (rake 6 final step weight)";

label values gestfips   GESTFIPS;
label values peeduca    PEEDUCA;
label values pehspnon   PEHSPNON;
label values pemaritl   PEMARITL;
label values perrp      PERRP;
label values pesex      PESEX;
label values prchld     PRCHLD;
label values prcitshp   PRCITSHP;
label values prfamtyp   PRFAMTYP;
label values prinuyer   PRINUYER;
label values prnmchld   PRNMCHLD;
label values ptdtrace   PTDTRACE;
label values gereg      GEREG;
label values hefaminc   HEFAMINC;
label values hrhtype    HRHTYPE;
label values pemlr      PEMLR;
label values penlfact   PENLFACT;
label values prftlf     PRFTLF;


svyset [pweight=pwsswgt];
