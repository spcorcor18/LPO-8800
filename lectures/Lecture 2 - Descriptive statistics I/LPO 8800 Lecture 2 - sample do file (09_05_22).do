
cd "C:\Users\corcorsp\Dropbox\_TEACHING\Statistics I - PhD\Lectures\Lecture 2 - Descriptive statistics I"
capture log close
log using Lecture2_Corcoran.txt, text replace

******************************************************************************
******************************************************************************
**
** Sample do file - Lecture 2
**   (shows examples used in Lecture 2)
** Sean P. Corcoran
** Created:	 9/5/22
**
******************************************************************************
******************************************************************************

// Read NELS data from Github
use https://github.com/spcorcor18/LPO-8800/raw/main/data/nels.dta, clear

// Frequency distribution examples
tabulate region
tabulate parmarl8, missing
fre parmarl8
table parmarl8

// Bar graph examples - with combine and graph export to PDF
graph bar (count), over(region) name(region1, replace) nodraw
graph bar (percent), over(region) name(region2, replace) nodraw
graph bar (count), over(parmarl8) name(parmarl8, replace) nodraw
histogram region, discrete percent gap(2) xlabel(,valuelabel) name(region3, replace) nodraw

graph combine region1 region2 region3 parmarl8, ysize(6) xsize(3) col(1)
graph export bargraphs.pdf, as(pdf) replace

// Pie graph
graph pie , over(region) name(regionpie, replace) nodraw
graph pie , over(parmarl8) name(parmarl8pie, replace) nodraw

graph combine regionpie parmarl8pie, ysize(4) xsize(3) col(1)
graph export piegraphs.pdf, as(pdf) replace

// Histogram
histogram achmat08, percent name(mathhist1, replace) nodraw
histogram achmat08, percent bin(10) name(mathhist2, replace) nodraw

graph combine mathhist1 mathhist2, ysize(4) xsize(3) col(1)
graph export histograms.pdf, as(pdf) replace

// Stem and leaf
stem achmat08

// Mean, median, mode
summ achmat08
summ expinc
summ advamath8

// use detail to get median and other percentiles, stats
summ achmat08, detail

// there is no command for mode
tabulate famsize, sort

// egen ("extended generate") creates a new variable that in this case is the mode of famsize
egen mode=mode(famsize)
table mode

// Using tabstat
tabstat achrdg*, stat(mean p50 n)
tabstat achrdg*, stat(mean p50 n) col(stat)

// Close log and convert to PDF
log close
translate Lecture2_Corcoran.txt Lecture2_Corcoran.pdf, translator(txt2pdf) ///
	cmdnumber(off) logo(off) header(off) replace

// Bonus! A hack for combining PDFs directly in Stata. Requires installation
// of PDF toolkit below first. The last Stata command invokes the command line
// in Windows (may or may not work this way for Mac).
// https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/

!pdftk Lecture2_Corcoran.pdf bargraphs.pdf piegraphs.pdf histograms.pdf cat output Lecture2_Corcoran_final.pdf

