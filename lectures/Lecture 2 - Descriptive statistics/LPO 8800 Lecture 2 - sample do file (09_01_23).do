
cd "C:\Users\corcorsp\Dropbox\_TEACHING\Statistics I - PhD\Lectures\Lecture 2 - Descriptive statistics I"
capture log close
log using Lecture2_Examples.txt, text replace

******************************************************************************
******************************************************************************
**
** Sample do file - Lecture 2
** Useful commands for descriptive statistics
**
** Sean P. Corcoran
** Created:	 9/5/22, updated 9/1/23
**
******************************************************************************
******************************************************************************

	// Read NELS sample data from Github

	use https://github.com/spcorcor18/LPO-8800/raw/main/data/nels.dta, clear

	// Frequency/relative frequency distributions
	
	tabulate region
	tabulate parmarl8, missing
		* missing option includes missing values among the counts
	fre parmarl8
		* fre command reports with and without missing values
	table parmarl8
		* basic frequency distribution - note the tables command was
		* significantly overhauled in Stata 17

	// Bar graph examples with combine and graph export to PDF

	graph bar (count), over(region) name(region1, replace) nodraw
	graph bar (percent), over(region) name(region2, replace) nodraw
	graph bar (count), over(parmarl8) name(parmarl8, replace) nodraw
	histogram region, discrete percent gap(2) xlabel(,valuelabel) name(region3, replace) nodraw
		* histogram with discrete option can be used for discrete variables
	graph combine region1 region2 region3 parmarl8, ysize(6) xsize(3) col(1)
	graph export bargraphs.pdf, as(pdf) fontface(default) replace

	// Pie graph examples

	graph pie , over(region) name(regionpie, replace) nodraw
	graph pie , over(parmarl8) name(parmarl8pie, replace) nodraw
	graph combine regionpie parmarl8pie, ysize(4) xsize(3) col(1)
	graph export piegraphs.pdf, as(pdf) replace

	// Histogram examples

	histogram achmat08, percent name(mathhist1, replace) nodraw
	histogram achmat08, percent bin(10) name(mathhist2, replace) nodraw
	graph combine mathhist1 mathhist2, ysize(4) xsize(3) col(1)
	graph export histograms.pdf, as(pdf) replace

	// Stem and leaf plot example

	stem achmat08

	// Summary statistics: mean, standard deviation, min, and max
	
	summ achmat08
	summ expinc
	summ advmath8

	// Use detail option to get median and other percentiles, stats
	
	summ achmat08, detail

	// Note: there is no simple command for the mode. For discrete variables 
	// can use tabulate and sort option. There is a user-written command that
	// will display the modes (install using the net install line below).
	
	tabulate famsize, sort
	net install sg113_2.pkg, from("http://www.stata-journal.com/software/sj9-4")
	modes famsize 

	// Another option: egen ("extended generate") creates a new variable that
	// in this case is the mode of famsize
	
	egen mode=mode(famsize)
	table mode

	// Using tabstat to collect summary statistics (mean, median, n of obs)
	
	tabstat achrdg*, stat(mean p50 n)
	tabstat achrdg*, stat(mean p50 n) col(stat)

	// Measures of variability: range
	
	summ achmat08
	display r(max)-r(min)
		* taking stored results from the summarizing command and calculating
	tabstat achmat08, stat(range)
		* range is one of the stat options in tabstat
	
	// Measures of variability: variance and standard deviation
	
	summ achmat08, detail
	tabstat achrdg08, stat(n sd var)
	
	// Skewness statistic
	
	summ achsci08, detail
	tabstat achsci08, stat(skew)
	
	// Standard error of the skewness: as a rule of thumb, a skewness statistic
	// more than 2x this in absolute value is "significantly skewed"
	
	summ achsci08, detail
	scalar skewsci = r(skewness)
	scalar nsci = r(N)
		* two lines above capture the skewness statistics and number of 
		* nonmissing observations
	scalar skewse= sqrt( ((6*nsci)*(nsci-1)) / ((nsci-2)*(nsci+1)*(nsci+3)))
	display skewse
	display skewsci/skewse
	
	// User written command summskew can be installed via Github repository
	
	net install github, from("https://haghish.github.io/github/")
	github install SLWeinberg/Stata_Skewness
	summskew achsci08
	
	// Getting percentile values
	
	tabulate famsize
		* for discrete variable using cumulative frequency
	summ achrdg08, detail
		* detail option provides common percentiles
	tabstat achrdg08, stat(p25 p50 p75)
		* selected percentiles are stat options in tabstat
	egen achrdg08p10=pctile(achrdg08), p(10)
	summ achrdg08p10
		* here creating a new variable that contains the percentile of interest
	centile achrdg08, centile(20)
		* note this command uses a different rule than other methods to obtain
		* percentiles. Result may differ somewhat.
	tabstat achrdg08 achmat08 achsci08 achsls08, stat(min p25 p50 p75 max)
		* "Five number summary"
		
	// Cumulative distribution function (ogive) - requires creating a new
	// variable which contains the cumulative relative frequency
	
	cumul achmat08, gen(cumachmat08)
	replace cumachmat08 = cumachmat08*100
	sort cumachmat08
	twoway line cumachmat08 achmat08, ytitle("Cumulative Percent")
	graph export ogive.pdf, as(pdf) replace
	
	// User written command distplot
	
	ssc install distplot
	distplot achmat08
	graph export ogive2.pdf, as(pdf) replace
	
	// Measures of variability: inter-quartile range
	
	tabstat achrdg08 achmat08 achsci08 achsls08, stat(n p25 p75 iqr)
	
	// Boxplot (or box-and-whiskers plot)
	
	graph box achmat08, name(boxmath, replace) nodraw
	graph box expinc30, name(boxinc1, replace) nodraw
	graph box expinc30, name(boxinc2, replace) nodraw nooutsides
		* nooutsides option suppresses the outliers from the graph
	graph combine boxmath boxinc1 boxinc2, col(1) ysize(4) xsize(3)
	graph export boxplots.pdf, as(pdf)
	
	// Transforming variables (creating new/rescaled versions of variables)
	
	gen expinc30b = (expinc30 / 1000)
	label var expinc30b "expected income at age 30 (in thousands)"
	
	gen expinc30c = sqrt(expinc30)
	label var expinc30c "expected income at age 30 (square root)"
	
	gen expinc30d = ln(expinc30)
	label var expinc30c "expected income at age 30 (natural log)"
	
	// Z-score using egen or manual calculation using stored results
	
	egen zachmat08 = std(achmat08)
	summ achmat08
	gen zachmat08b = (achmat08 - r(mean)) / r(sd)
	summ zachmat08 zachmat08b
	
	// Close log and convert to PDF
	log close
	translate Lecture2_Examples.txt Lecture2_Examples.pdf, translator(txt2pdf) ///
		cmdnumber(off) logo(off) header(off) replace

	// Bonus! A hack for combining PDFs directly in Stata. Requires installation
	// of PDF toolkit below first. The last Stata command invokes the command line
	// in Windows (may or may not work this way for Mac).
	// https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/

	!pdftk Lecture2_Examples.pdf bargraphs.pdf piegraphs.pdf histograms.pdf ogive2.pdf boxplots.pdf cat output Lecture2_Examples_final.pdf

