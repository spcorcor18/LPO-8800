
// Lecture 5 - code for sampling and simulation examples

cd "C:\Users\corcorsp\Dropbox\_TEACHING\Statistics I - PhD\Lectures\Lecture 5 - Sampling distributions"

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
// 50,000 draws of a sample of size n=2 from the same distribution
// ***************************************************************************
// note: bootstrap prefix executes the summ command 50,000 times (specified in
// the reps option) using sampling with replacement of size n=2 (specified in
// the size option). It saves the results in a file called draws50k2n.

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

bootstrap r(mean) , reps(50000) size(2) saving(draws50k2n, replace): summ x1

clear
use draws50k2n
histogram _bs_1, bin(15)
summ _bs_1

// ***************************************************************************
// 50,000 draws of a sample of size n=8 from the same distribution
// ***************************************************************************
// note: bootstrap prefix executes the summ command 50,000 times (specified in
// the reps option) using sampling with replacement of size n=8 (specified in
// the size option). It saves the results in a file called draws50k8n.

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

bootstrap r(mean) , reps(50000) size(8) saving(draws50k8n, replace): summ x1

clear
use draws50k8n
histogram _bs_1, bin(24)
summ _bs_1


// ***************************************************************************
// Create a population of 200 from a normal distribution (mean 10 sd 5), then
// draw 100 repeated samples of size 25 using a loop
// ***************************************************************************

set seed 5001
clear
set obs 200
gen x=rnormal(10,5)
save origdata.dta,replace

// 100 samples of size 25 from this data using a loop, bsample, and save.
// The bootstrap prefix used above would do this much more efficiently.

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

// ***************************************************************************
// Lecture 5 Application 1 simulation
// ***************************************************************************

// Method 1 - program and simulate
clear
capture program drop app1

program app1, rclass
   drop _all
   set obs 16
   gen x=rnormal(15, 3)
   summ x
   return scalar mean=r(mean)
   return scalar Var =r(Var)
end

set seed 4321
simulate mean=r(mean) var=r(Var), reps(1000) nodots: app1
summ mean var


// Method 2 - postfile commands
// tempname is temporary holding place where results are held
// tempfile is temporary file for collecting results
clear
tempname results
tempfile meantable

// postfile tells Stata where results will be iteratively saved, which items
// will be saved, and where the final results will be collected
postfile `results' xmean xvar using `meantable'

forvalues j=1/1000 {
   clear
   drawnorm x, n(16) mean(15) sds(3)
   quietly summ
   post `results' (r(mean)) (r(Var))
   }
postclose `results'

use `meantable', clear


// ***************************************************************************
// Lecture 5 Application 2a-2c simulation
// ***************************************************************************
// Repeated samples of n=16 from a population with mean=15 and sd=3

clear
tempname results
tempfile meantable

postfile `results' xmean using `meantable'

forvalues j=1/1000 {
   clear
   quietly drawnorm x, n(16) mean(15) sds(3)
   quietly summ
   post `results' (r(mean))
   }
postclose `results'
use `meantable', clear

histogram xmean

gen lt13 = xmean<=13
gen lt14 = xmean<=14
gen betw = xmean>=13.5 & xmean<=16.5
summ lt13 lt14 betw


// ***************************************************************************
// Lecture 5 Application 4 simulation
// ***************************************************************************
// Repeated samples of n=100 from a Bernoulli with mean (pi) 0.46

clear
tempname results
tempfile meantable

postfile `results' pihat using `meantable'

forvalues j=1/1000 {
   clear
   set obs 100
   gen u=runiform(0,1)
   gen x=(u<=0.46)
   quietly summ
   post `results' (r(mean))
   }
postclose `results'
use `meantable', clear

histogram pihat

gen mt50 = pihat>=0.50
summ mt50
