
// Lecture 5 - code for sampling examples

// ***************************************************************************
// All possible samples of size n=2 from a population consisting of 10 values
// (0, 1, 3, 3, 5, 7, 7, 7, 8, 10)
// ***************************************************************************

set obs 1
gen x1=.
gen x2=.

set more off
foreach j in 0 1 3 3 5 7 7 7 8 10 {
foreach k in 0 1 3 3 5 7 7 7 8 10 {
   replace x1=`j' if _n==_N
   replace x2=`k' if _n==_N
   local new = _N+1
   set obs `new'
   }
   }
drop if _n==101

gen mean=(x1+x2)/2
histogram mean,bin(15) freq
summ mean

// ***************************************************************************
// 50,000 draws of a sample of size n=8 from the same distribution
// ***************************************************************************
// note: bootstrap prefix executes the summ command 50,000 times (specified in
// the reps option) using sampling with replacement of size n=8 (specified in
// the size option). It saves the results in a file called draws50k.

clear
qui set obs 10
qui gen x1=0 if _n==1
qui replace x1=1 if _n==2 
qui replace x1=3 if _n==3 
qui replace x1=3 if _n==4 
qui replace x1=5 if _n==5 
qui replace x1=7 if _n==6 
qui replace x1=7 if _n==7 
qui replace x1=7 if _n==8 
qui replace x1=8 if _n==9 
qui replace x1=10 if _n==10

bootstrap r(mean) , reps(50000) size(8) saving(draws50k, replace): summ x1

clear
use draws50k
histogram _bs_1, bin(24)
summ _bs_1


// ***************************************************************************
// 200 draws from a normal distribution (mean 10 sd 5)
// ***************************************************************************

set seed 5001
clear
set obs 200
gen x=rnormal(10,5)
save origdata.dta,replace

// 100 samples of size 25 from this data

forvalues j = 1/100 {
tempfile sample`j'
preserve
bsample 25
collapse (mean) xbar=x
gen obsno=`j'
save `sample`j''
restore
}
clear
forvalues j= 1/100 {
append using `sample`j''
}

