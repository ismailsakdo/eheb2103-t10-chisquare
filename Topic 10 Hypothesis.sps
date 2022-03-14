* Encoding: UTF-8.
* Encoding: .

//14/3/2022 - Chi Square

FREQUENCIES VARIABLES=y
  /FORMAT=NOTABLE
  /STATISTICS=MEAN MEDIAN MODE
  /ORDER=ANALYSIS.

center line will be "19" = Mean/ Mode 19

// transform data - convert from numeric into category

RECODE y (Lowest thru 19=1) (19.01 thru Highest=2) INTO y.cat.
VARIABLE LABELS  y.cat 'Status of Tooth Health - 19'.
EXECUTE.

NPAR TESTS
  /CHISQUARE=dose.cat
  /EXPECTED=EQUAL
  /MISSING ANALYSIS.

// Expected count less than 5 not more than 20% - then can use the CHI SQUARE

NPAR TESTS
  /CHISQUARE=y.cat
  /EXPECTED=EQUAL
  /MISSING ANALYSIS.

/// IKUT DATA BARU PASAL BUDAK SKOLAH

NPAR TESTS
  /CHISQUARE=stayup
  /EXPECTED=EQUAL
  /MISSING ANALYSIS.

5 step
1) Null : there is nosignificant different of propotion for stayup
Alternative: there is significant different of propotion for stayup

2) alpha = 0.05

3) run/ calculate and report
chi square = 3.20
p-value = 0.074  what is the status??? more or less than alpha?

4) Decision
p<0.05 - REJECT NULL
p> 0.05 - FAIL TO REJECT (select)

5) Conclusion
REJECT NULL - There is different
FAIL TO REJECT NULL - There is NO different (Select)

Conclusion:
There is no significant different of the propotion for the factor stay up at the level of 
significant 0.05, where the chi value = 3.20 and the p-value = 0.074. Therefore the stayup was 
consider not risk factors.

NPAR TESTS
  /CHISQUARE=gender
  /EXPECTED=EQUAL
  /MISSING ANALYSIS.

// Factor Age

RECODE age (17=1) (18=1) (ELSE=2) INTO age.cat.
VARIABLE LABELS  age.cat 'Kategori Umur (17)'.
EXECUTE.

NPAR TESTS
  /CHISQUARE=age.cat
  /EXPECTED=EQUAL
  /MISSING ANALYSIS.

// Cross-tabulation (Chi Square nO 2 = test for the independent)/ relationship
hubungan antara variable iv dan dv

Hypothesis
1) Null: IV independnet to DV
Alternative: ID dependent to DV

1) Null: There is NO significant association between status makan and status kesihatan
Alternative : There is signficant association between status makan and status kesihatan

2) alpha = p=0.05

3) run/ calculate and report

4) Decide

5) conclude

CROSSTABS
  /TABLES=makan BY sakit
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ CC PHI 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

//

// Tuko dataset kepada Cumulative

DATASET ACTIVATE DataSet1.
WEIGHT BY freq.

SORT CASES  BY x1.
SPLIT FILE LAYERED BY x1.

CROSSTABS
  /TABLES=status BY health
  /FORMAT=AVALUE TABLES
  /STATISTICS=CHISQ CC PHI 
  /CELLS=COUNT COLUMN 
  /COUNT ROUND CELL.

SPLIT FILE OFF.

///

