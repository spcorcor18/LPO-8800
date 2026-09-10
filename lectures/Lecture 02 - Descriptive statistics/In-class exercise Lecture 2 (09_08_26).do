

// ==============================================
// In-class exercise - Lecture 2
// ==============================================

cd "C:\Users\corcorsp\Dropbox\_TEACHING\Statistics I - PhD\Lectures\Lecture resources\Lecture 2"

use https://github.com/spcorcor18/LPO-8800/raw/main/data/PISA-2000-2022.dta, clear

// drop all aggregate observations
table year aggobs
drop if aggobs==1

// countries remaining in dataset
tabulate jurisdiction

// frequency distribution of years with non-missing data
tabulate year if m_avg~=.
tabulate year if r_avg~=.
tabulate year if s_avg~=.

// mean, median, and standard deviation of country average scores
tabstat m_avg r_avg s_avg if year==2022, stat(n mean p50 sd)
// or
summarize m_avg r_avg s_avg if year==2022, detail

// histograms of scores
// note the name() option assigns the graph a name so it cam be used later
histogram m_avg if year==2022, name(math, replace)
histogram r_avg if year==2022, name(read, replace)
histogram s_avg if year==2022, name(sci, replace)

// combine the histograms above into one graph (uses assigned names)
graph combine math read sci, row(2) ysize(4) xsize(8) ///
	title("Histogram for PISA scores: OECD countries (2022)")

// skewness
summ m_avg r_avg s_avg if year==2022, detail
// or
tabstat m_avg r_avg s_avg if year==2022, stat(n skew)

// 'significantly' skewed? Divide skewness by result below
count if year==2022 & m_avg~=.
display sqrt((6*r(N)*(r(N)-1))/((r(N)-2)*(r(N)+1)*(r(N)+3)))

// which countries had highest within-country SD in reading scores?
// can sort by year and then (descending) reading SD
gsort year -r_sd
list year jurisdiction r_sd r_avg if year==2022

// "five number summary"
tabstat m_avg r_avg s_avg if year==2022, stat(min p25 p50 p75 max iqr)

// box plot for math by year
graph box m_avg, over(year)

// PART 2
// use your file location
use "C:\Users\corcorsp\Box\Public\PISA-2015-seven-countries.dta", clear

// keep only USA
tabulate cnt
keep if cnt=="USA"

// find the cell phone variable
lookfor cell

// frequency distribution: how many cell phones in household
tabulate st012q05na 
fre st012q05na 
// install fre using "ssc install fre" if not already installed

graph bar (percent), over(st012q05na)

// histogram for escs
histogram escs

// place students in quartiles
xtile escsq = escs, nq(4)
tabulate escsq
