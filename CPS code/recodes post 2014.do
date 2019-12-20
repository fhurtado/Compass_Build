***
// code to create appropriate categories for weighting
//    and output the counts for constructing weights
//    it is called by the "run CPS.do" program
***
#delimit ;

capture drop year;
gen year = int(yyyymm/100);
vlabel year "Year of survey";

capture label drop AGEGRP;
capture drop agegrp;
recode prtage (min/17=0 "Too young")
              (18/24=1  "18 - 24")
              (25/34=2  "25 - 34")
              (35/44=3  "35 - 44")
              (45/54=4  "45 - 54")
              (55/64=5  "55 - 64")
              (65/70=6  "65 - 70")
              (71/max=7 "71 +"),
           gen(agegrp) label(AGEGRP);
vlabel agegrp "Age";

capture label drop AGEGRP2;
capture drop agegrp2;
recode prtage (min/17=0  "Too young")
              (18/24=1   "18 - 24")
              (25/29=2   "25 - 29")
              (30/34=3   "30 - 34")
              (35/39=4   "35 - 39")
              (40/44=5   "40 - 44")
              (45/49=6   "45 - 49")
              (50/54=7   "50 - 54")
              (55/59=8   "55 - 59")
              (60/64=9   "60 - 64")
              (65/max=10 "65 +"),
           gen(agegrp2) label(AGEGRP2);
vlabel agegrp2 "Age";

capture label drop AGEGRP3;
capture drop agegrp3;
recode prtage (min/17=0  "Too young")
              (18/20=1   "18 - 20")
              (21/25=2   "21 - 25")
              (26/45=3   "26 - 45")
              (46/55=4   "46 - 55")
              (56/64=5   "56 - 64")
              (65/74=6   "65 - 74")
              (75/max=10 "75 +"),
           gen(agegrp3) label(AGEGRP3);
vlabel agegrp3 "Age";

* Added to capture 13-17 year olds, Spring 2016 

capture label drop AGEGRP4;
capture drop agegrp4;
recode prtage (min/12=0 "Too young")
              (13/17=1  "13 - 17")
              (18/24=2  "18 - 24")
              (25/34=3  "25 - 34")
              (35/44=4  "35 - 44")
              (45/54=5  "45 - 54")
              (55/64=6  "55 - 64")
              (65/70=7  "65 - 70")
              (71/max=8 "71 +"),
           gen(agegrp4) label(AGEGRP4);
vlabel agegrp4 "Age";

capture drop agem;
gen agem = agegrp3 if pesex==1;
vlabel agem "Age (male)";
label val agem AGEGRP3;

capture drop agef;
gen agef = agegrp3 if pesex==2;
vlabel agef "Age (female)";
label val agef AGEGRP3;

capture label drop ADULT;
capture drop adult;
recode prtage (min/17=0 "0 - 17")
              (18/70=1  "18 - 70")
              (71/max=2 "71 +"),
           gen(adult) label(ADULT);
vlabel adult "Age group";

* Added to capture 13-17 year olds, Spring 2016 

capture label drop ADULT2;
capture drop adult2;
recode prtage (min/12=0 "0 - 12")
              (13/17=1  "13 - 17")
              (18/70=2  "18 - 70")
              (71/max=3 "71 +"),
           gen(adult2) label(ADULT2);
vlabel adult2 "Age group";

recode pemaritl (-1=6); //those under age 15 can be called never married
capture label drop MARRSTAT;
capture drop marrstat;
recode pemaritl (1/2=1 "Married") (6=2 "Never married") (3/5=3 "Widowed/Divorced/Separated"),
      gen(marrstat) label(MARRSTAT);
vlabel marrstat "Marital status";

capture label drop HHSIZE;
capture drop hhsize;
recode hrnumhou (6/max=6 "6 +"), gen(hhsize) label(HHSIZE);
vlabel hhsize "HH size";

capture label drop OWNKIDS;
capture drop ownkids;
recode prnmchld (-1=0) (4/99=4 "4 +"), gen(ownkids) label(OWNKIDS);
vlabel ownkids, from(prnmchld);

capture drop kids;
gen kids = ownkids > 0;
vlabel kids "Children under 18 present in household";
label define KIDS 0 "No own children" 1 "Have children";
label val kids KIDS;

capture label drop RACE;
capture drop race;
recode ptdtrace (1=1              "Caucasian")
                (6 10/12=2        "African American")
                (3/5 7/9 13/max=3 "Other"),
             gen(race) label(RACE);
vlabel race "Race";

capture drop black;
gen black = race==2;
vlabel black "Race";
label define BLACK 0 "Not African American" 1 "African American";
label val black BLACK;

capture label drop DIVISION;
capture drop division;
recode gestfips (17 18 26 39 55 =             1 "East North Central")
                (1 21 28 47 =                 2 "East South Central")
                (34 36 42 =                   3 "Middle Atlantic")
                (4 8 16 30 32 35 49 56 =      4 "Mountain")
                (9 23 25 33 44 50 =           5 "New England")
                (2 6 15 41 53 =               6 "Pacific")
                (10 11 12 13 24 37 45 51 54 = 7 "South Atlantic")
                (19 20 27 29 31 38 46 =       8 "West North Central")
                (5 22 40 48 =                 9 "West South Central"),
             gen(division) label(DIVISION);
vlabel division "Census Division";

capture label drop EDUC;
capture drop educ;
recode peeduca (min/38=1 "Less than high school")
               (39=2     "High school graduate")
               (40=3     "Some college")
               (41/43=4  "College graduate")
               (44/46=6  "Graduate school"),
            gen(educ) label(EDUC);
vlabel educ "Education of respondent";

capture label drop EDUC2;
capture drop educ2;
recode educ (1=1   "< H.S.")
            (2 3=2 "H.S.")
            (4=3   "College degree (BA, BS, etc.)")
            (6=4  "Professional/Graduate degree"),
         gen(educ2) label(EDUC2);
vlabel educ2 "Education of respondent";

capture label drop INCOME;
capture drop income;
recode hefaminc (min/0=.)
                (1/6=0  "Under $20,000")
                (7 8=1  "$20,000 - $29,999")
                (9 10=2 "$30,000 - $39,000")
                (11=3   "$40,000 - $49,999")
                (12=4   "$50,000 - $59,999")
                (13=5   "$60,000 - $74,999")
                (14=6   "$75,000 - $99,999")
                (15=9   "$100,000 - $149,999")
                (16=10  "$150,000 or more"),
             gen(income) label(INCOME);
vlabel income "Total family income in past 12 months";

capture label drop INCOME2;
capture drop income2;
recode hefaminc (min/0=.)
                (1/6=0   "Under $20,000")
                (7 8=1   "$20,000 - $29,999")
                (9 10=2  "$30,000 - $39,000")
                (11=3    "$40,000 - $49,999")
                (12=4    "$50,000 - $59,999")
                (13 14=5 "$60,000 - $99,999")
                (15=9    "$100,000 - $149,999")
                (16=10   "$150,000 or more"),
             gen(income2) label(INCOME2);
vlabel income2 "Total family income in past 12 months";

capture label drop INC2;
capture drop inc2;
recode hefaminc (min/0=.)
                (1/5 = 1   "< $15,000")
                (6/9 = 2   "$15,000 - $34,999")
                (10/11 = 3 "$35,000 - $49,999")
                (12/14 = 4 "$50,000 - $99,999")
                (15/16 = 5 "$100,000 +"),
            gen(inc2) label(INC2);
vlabel inc2 "Annual household income";

capture label drop RINCOME;
capture drop rincome;
recode hefaminc (1/9=1   "Under $35,000")
                (10/14=2 "$35,000 - $99,999")
                (15 16=3 "$100,000 +"),
             gen(rincome) label(RINCOME);
vlabel rincome, from(hefaminc);

recode prinuyer ( 0=.)
                ( 1=1950)
                ( 2=1955)
                ( 3=1962)
                ( 4=1967)
                ( 5=1972)
                ( 6=1977)
                ( 7=1981)
                ( 8=1983)
                ( 9=1985)
                (10=1987)
                (11=1989)
                (12=1991)
                (13=1993)
                (14=1995)
                (15=1997)
                (16=1999)
                (17=2001)
                (18=2003)
                (19=2005)
                (20=2007)
                (21=2009)
                (22=2011)
                (23=2013)
                (24=2015)
                (25=2017),
            gen(inyear) label(INYEAR);
vlabel inyear "Year entered US";
* adjust for aggregation error in year immigrated;
replace inyear = year - prtage if (year-inyear)>prtage & inyear<.;

capture drop hisp;
* an arbitrary exclusion of Hispanics who are older than 35 and not citizens to better approximate the proportion who are acculturated;
gen hisp = pehspnon==1 & ( prcitshp<5 | (prcitshp==5 & 17<prtage & prtage<36) );
vlabel hisp "Acculturated Hispanic";
label define HISP 0 "Not Hispanic" 1 "Hispanic/Latino";
label val hisp HISP;

capture label drop SES;
capture drop ses;
recode hefaminc (1/9=1   "Down")
                (10/14=2 "Mid")
                (15 16=3 "Up"),
             gen(ses) label(SES);
vlabel ses "Market segment";
replace ses = 2 if ses==1 & educ>2;
replace ses = 2 if ses==3 & educ<4;
