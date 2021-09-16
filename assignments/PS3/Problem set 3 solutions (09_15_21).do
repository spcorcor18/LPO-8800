
// ***********************************************************************
// LPO.8800 Problem Set 3 - Solutions
// Last updated: September 15, 2021
// ***********************************************************************

macro drop 	_all
set more off
capture log close
set linesize 80

global db  "C:\Users\corcorsp\Dropbox"
global pset "$db\_TEACHING\Statistics I - PhD\Problem sets\Problem set 3"
global datetag: display %td!(NN!_DD!_YY!) date(c(current_date), "DMY")
cd "$pset"

log using "PS3_results_$datetag.txt", text replace nomsg

// ***********************************************************************
// LPO.8800 Problem Set 3 - Solution to Question 2
// Last updated: September 15, 2021
// ***********************************************************************

/* QUESTION #2: Texas elementary and middle 2007-08.dta, represents test 
performance and other characteristics of Texas elementary and middle schools 
during the 2007-08 AY. Each observation is a school (N=6,354). */

use https://github.com/spcorcor18/LPO-8800/raw/main/data/TexasEM2007-08.dta, ///
   clear

// ********
// Part a
// ********
// 5 POINTS

/* The variables called ca311tmr, ca311tcr, ca311tsr, and ca311trr provide the 
percent of students in a school testing at the proficient level or higher in 
math, science, social studies, and reading, respectively. Provide a five 
number summary (min, Q1, median, Q3, max) for these four variables and include 
the interquartile range. Do this once for the whole population of schools, and 
then a second time restricting the sample to schools in Houston. (There is an 
indicator variable called houston that equals one for schools in Houston). How 
do the distributions of scores compare? Which subject has the lowest median, 
and which has the greatest variability based on the IQR? */

tabstat ca311tmr ca311tcr ca311tsr ca311trr, stat(min p25 p50 p75 max iqr)

// Houston only
tabstat ca311tmr ca311tcr ca311tsr ca311trr if houston==1, stat(min p25 p50 p75 max iqr)

// ***********************************************************************
// ***********************************************************************
/* The five-number summaries are shown above. The subject with the lowest 
median proficiency (79) and highest variability (21) is science. The 
median in the other three subjects is quite high. The minimum values and 
Q1 are lowest in math and science.*/
// ***********************************************************************
// ***********************************************************************

// ********
// Part b
// ********
/* Create a boxplot that shows the distribution of student attendance rates 
(ca0atr), restricting the analysis to schools in Houston. What do the 
whiskers (tails) represent in this graph? Are there any outlier values of 
attenance rates? */

graph box ca0atr if houston==1, title("Q2b: School attendance rates, Houston") ///
	name(attboxhouston, replace)
graph export ca0atr.pdf, name(attboxhouston) as(pdf) replace

/* The whiskers extend to the maximum and minimum, or the adjacent values 
if there are outliers. There are outliers at the bottom of the distribution. 
These represent attendance rates that are more than 1.5 IQR below the 25th 
percentile */


// ********
// Part c
// ********
/* Now create a boxplot that shows the distribution of student attendance 
rates specifically for Black, Hispanic, and white students, restricting the 
analysis to schools in Houston. These subgroup-specific attendance rates are
reported as separate variables (cb0atr, ch0atr, cw0atr). How do these 
distributions compare? */

# delimit ;
graph box cb0atr ch0atr cw0atr if houston==1, legend(position(6) row(1) 
	label(1 "Black students") label(2 "Hispanic students") 
	label(3 "White students") title("Attendance rates of:")) 
	title("Q2c: School attendance rates for student subgroups, Houston") 
	name(attboxhoustonr, replace);
graph export attrace.pdf, name(attboxhoustonr) as(pdf) replace;
# delimit cr

/* The median attendance rate appears to be highest for Hispanic students, 
followed by white students and then Black. The attendance rates for Black 
students appears to be most variable, and for Hispanic students the least 
variable (although in both cases there are a lot of outliers on the low 
end). In all three cases, the vast majority of schools have an attendance 
rate of 90% or greater */


// ********
// Part d
// ********
/* How would you describe the skewness of the variables you have examined thus
far (proficiency and attendance rates)? Use any summary statistics or graphical
summary that is appropriate. */

/* Based on a visual inspection of the boxplots thus far, school proficiency 
and attendance rates appear to have a negative (left) skew. This is 
confirmed by a look at the skewness statistic for each variable (again 
limiting the analysis to Houston). */

tabstat ca0atr cb0atr ch0atr cw0atr if houston==1, stat(skew)


// ********
// Part e
// ********
	
/* Consider the variable called cpemallp, which represents the school's 
percentage of students who attended that school less than 83% percent of the 
school year. (They refer to this as the "mobility" rate). Use the skewness 
statistic to assess the skewness of this variable. In your do file, calculate 
the standard error of the skewness (see the lecture notes for the formula) 
and determine whether this distribution is "significantly" skewed or not.*/

summ cpemallp, detail

// Divide the skewness statistic (saved as "a") by the standard error of 
// the skewness (calculated as "b"). r(N) is the count of observations used 
// in the above command. The rule of thumb is that if this absolute value of 
// the ratio is >2, the distribution is significantly skewed. It is.

scalar a=r(skewness)
scalar b=sqrt((6*r(N)*(r(N)-1))/((r(N)-2)*(r(N)+1)*(r(N)+3)))
display a
display b
display a/b


// ********
// Part f
// ********

/* Generate a new variable that contains the natural log of cpemallp. Find 
its skewness statistic and standard error of the skewness. Has this log 
transformation reduced the severity of skewness in this variable? Are all of 
the values of cpemallp valid for the log transformation? */

/* Results are below. The ratio of skewness to the standard error of the 
skewness is now less than 2 in absolute value. Logs are only valid for 
values >0, and we prefer that they be >1. There is one case of cpemallp 
less than 0, and 3 values less than 1. */

gen lnmobility=ln(cpemallp)
summ lnmobility, detail

scalar a=r(skewness)
scalar b=sqrt((6*r(N)*(r(N)-1))/((r(N)-2)*(r(N)+1)*(r(N)+3)))
display a
display b
display a/b

count if cpemallp<1


// ********
// Part g
// ********

/* As an alternative to the log transformation, generate a new variable that 
contains the inverse hyperbolic sine of cpemallp. The IHS function for a 
variable x is defined as: IHS = ln(x + sqrt(x^2 + 1)). How does the skewness 
of this variable compare the original cpemallp variable? */

/* Results are below. The transformed variable is less skewed than the
original cpemallp variable. */

gen ihsmobility=ln(cpemallp + sqrt(cpemallp^2 + 1))
summ ihsmobility, detail

scalar a=r(skewness)
scalar b=sqrt((6*r(N)*(r(N)-1))/((r(N)-2)*(r(N)+1)*(r(N)+3)))
display a
display b
display a/b

histogram ihsmobility, title("Q2b: IHS transformation of mobility rates") ///
	name(ihsmob, replace)
graph export ihsmob.pdf, name(ihsmob) as(pdf) replace


// ********
// Part h
// ********

/* The variable cpetecop contains the percent of students in the school who 
are considered to be economically disadvantaged. Use this variable to create 
a z-score for cpetecop as shown in class. Run a full set of descriptive 
statistics to demonstrate this new variable has a mean of 0 and standard 
deviation of 1. */

/* Results are below. The mean is ~0 and standard deviation ~1 */

egen zecondis=std(cpetecop)
summ zecondis


// ********
// Part i
// ********

/* Using the information from part (h), what level of economic disadvantage 
corresponds to a z-score of 1.2? Of -1.2? Interpret these values in words. */

/* Results are below, calculated using the mean and sd from the original 
cpetecop variable. A school that is 1.2 standard deviations above the mean 
(z=1.2) in economic disadvantage has a 92.3% share of disadvantaged 
students. A school that is 1.2 standard deviations below the mean (z=-1.2) 
has a 28.1% share of disadvantaged students */

summ cpetecop
display r(mean) + 1.2*r(sd)
display r(mean) - 1.2*r(sd)


// ********
// Part j
// ********

/* What proportion of schools have a level of economic disadvantage between a 
z-score of -1 and +1? Why isn't this value 68% (or at least closer to it), 
as the Empirical Rule would suggest? */

/* Results are below. First I count the observations with a z-score 
between -1 and 1 and store it as "a". Then I count the number of non-
missing z-scores and store this as "b". The proportion is a/b, or 60.6%. 
The Empirical Rule applies to **normal** distributions, which this is not */

count if zecondis>=-1 & zecondis<=1
scalar a = r(N)
count if zecondis~=.
scalar b = r(N)
display a/b

capture log close

graphlog using "PS3_results_$datetag.txt",replace keeptex lspacing(1) fwidth(0.8)
