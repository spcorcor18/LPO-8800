
cd "C:\Users\corcorsp\Dropbox\_TEACHING\Statistics I - PhD\Lectures\Lecture 2 - Descriptive statistics I"
capture log close
log using PS1_Corcoran.txt, text replace

******************************************************************************
******************************************************************************
**
** Sample Problem Set
** Sean P. Corcoran
** Created:	 9/3/20
**
******************************************************************************
******************************************************************************

// 1. (100 points) For this problem, use the dataset called nels.dta on 
// Brightspace. This is a small 500-student extract from the National Education 
// Longitudinal Study of 1988.

// (a) Provide a frequency distribution for parent marital status (parmarl8)

use https://github.com/spcorcor18/LPO-8800/raw/main/data/nels.dta, clear
tabulate parmarl8

// (b) Use summarize, detail to obtain descriptive statistics for students' self
// concept score in 8th grade (slfcnc08). Based on a comparison of the mean and
// median, is the distribution of this variable roughly symmetric? Or is it
// positively or negatively skewed? Explain how you know.

summ slfcnc08, detail

// Based on a comparison of the mean and median, the distribution appears
// symmetric.

// (c) Generate a histogram for 8th grade math achievement.

histogram achmat08
graph export Q1c.pdf, as(pdf) replace

log close
translate PS1_Corcoran.txt PS1_Corcoran.pdf, translator(txt2pdf) ///
	cmdnumber(off) logo(off) header(off) replace

// Bonus! A hack for combining PDFs directly in Stata. Requires installation
// of PDF toolkit below first. The last Stata command invokes the command line
// in Windows (may or may not work this way for Mac).
// https://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/

!pdftk PS1_Corcoran.pdf Q1c.pdf cat output PS1_Corcoran_final.pdf

// Another bonus! User-written command graphlog will integrate graphs into
// the log file and save as a PDF. However, it does require a MiKTeX installation.

ssc install graphlog
graphlog using PS1_Corcoran.txt, replace
