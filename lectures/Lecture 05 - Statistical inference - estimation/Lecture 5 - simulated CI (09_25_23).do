

// Lecture 5: simulating samples from a population distribution and 
// constructing confidence intervals

	clear all
	set seed 4321

// The program chi2 will draw a sample of n=50 from the Chi-squared(10)
// distribution and capture the sample mean and sd. Note the population 
// mean of a Chi2 distribution is E(x)=k=10. The population variance is
// Var(x)=2k=20.

	capture program drop chi2
	program chi2, rclass
		drop _all
		set obs 50
		gen x=rchi2(10)
		summ x
		return scalar mean=r(mean)
		return scalar sd=r(sd)
	end

// Run the simulation by running the program 100 times. Plot the histogram
// of resulting means.
	
	simulate mean=r(mean) sd=r(sd), reps(100) nodots: chi2
	histogram mean

// Using the resulting data (xbars and sds) calculate 95% confidence intervals
// assuming sigma is known (sqrt(20))

	gen lb = mean - 1.96*(sqrt(20)/sqrt(50))
	gen ub = mean + 1.96*(sqrt(20)/sqrt(50))
	*browse
	
// Flag observations where 95% CI contains the mean (10)

	gen yesitdoes=(lb<10 & ub>10)
	tabulate yesitdoes

// Now calculate 95% confidence interval assuming sigma is unknown
// First, determine t value needed in CI (alpha=0.05 and df=49)

	display invttail(49, 0.025)
	gen lb2 = mean - 2.0095752*(sd / sqrt(50))
	gen ub2 = mean + 2.0095752*(sd / sqrt(50))
	*browse

// Flag observations where 95% CI contains the mean (10)

	gen yesitdoes2=(lb2<10 & ub2>10)
	tabulate yesitdoes2

// See variability from sample to sample in estimated std deviation

	histogram sd

// Compare widths of confidence intervals (sigma known vs unknown)
// Notice differential *variability* in CI widths--when sigma is known, CI
//   width is always 1.96*(sqrt(20)/sqrt(50))

	gen diff1 = ub-lb
	gen diff2 = ub2-lb2
	summ diff*


// ***********************************************************************
// ***********************************************************************

// Now do the same thing for a binary (dichotomous) variable where
// population mean pi=0.35

	capture program drop binary
	program binary, rclass
		drop _all
		set obs 50
		gen x=runiform()<0.35
		summ x
		return scalar mean=r(mean)
	end

// Run the simulation by running the program 100 times. Plot the histogram
// of resulting means.
	
	simulate mean=r(mean), reps(100) nodots: binary
	rename mean pihat
	histogram pihat

// Using the resulting data (xbars and sds) calculate 95% confidence intervals
// using estimated pi

	gen lb = pihat - 1.96*sqrt((pihat*(1-pihat))/50)
	gen ub = pihat + 1.96*sqrt((pihat*(1-pihat))/50)
	*browse
	
// Flag observations where 95% CI contains the mean (10)

	gen yesitdoes=(lb<0.35 & ub>0.35)
	tabulate yesitdoes

// Note: should always use z (and not t) when calculation confidence intervals
// for proportions (as long as there are 10+ cases where x=0 and 10+ cases
// where x=1). 
