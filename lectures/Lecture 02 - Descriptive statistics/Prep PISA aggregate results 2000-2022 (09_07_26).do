
// Build a Stata file with aggregate PISA results 2000-2022
// Original data from PISA Data Explorer:
// https://pisadataexplorer.oecd.org/ide/idepisa/ (downloaded 9/7/26)

cd "C:\Users\corcorsp\Dropbox\_TEACHING\Statistics I - PhD\Lectures\Lecture resources\Lecture 2\"
clear all

// Math mean sd std errors

import excel "IDEExcelExport-Sep072026-0725PM.xls", ///
	sheet("Report 1- Table") cellrange(B12:G332) firstrow clear
	
	rename *, lower
	rename yearstudy year
	rename average m_avg
	rename standarderror m_stderr
	rename standarddeviation m_sd
	rename g m_sdsterr
	// notice I am using common prefix m_ for math that will be easier
	// to use later using find/replace, varible lists, loops, etc. I
	// will use r_ for reading and s_ for science

	replace year = year[_n-1] if year==""
	destring m_avg- m_sdsterr, force replace
	// numeric variables read as strings because of missing indicators.
	// Destring will convert non-numeric values to missing.
	save tmp-math, replace
	
// Reading mean sd std errors

import excel "IDEExcelExport-Sep072026-0725PM.xls", ///
	sheet("Report 2- Table") cellrange(B12:G332) firstrow clear
	
	rename *, lower
	rename yearstudy year
	rename average r_avg
	rename standarderror r_stderr
	rename standarddeviation r_sd
	rename g r_sdsterr
	replace year = year[_n-1] if year==""
	destring r_avg- r_sdsterr, force replace
	save tmp-read, replace
	
// Science mean sd std errors

import excel "IDEExcelExport-Sep072026-0725PM.xls", ///
	sheet("Report 3- Table") cellrange(B12:G332) firstrow clear
	
	rename *, lower
	rename yearstudy year
	rename average s_avg
	rename standarderror s_stderr
	rename standarddeviation s_sd
	rename g s_sdsterr
	replace year = year[_n-1] if year==""
	destring s_avg- s_sdsterr, force replace
	save tmp-science, replace
	
// Math percentiles

import excel "IDEExcelExport-Sep072026-0734PM.xls", ///
	sheet("Report 1- Table") cellrange(B12:Q332) firstrow clear
	
	rename *, lower
	rename yearstudy year
	rename thpercentile m_p5
	rename standarderror m_p5_sterr
	rename f m_p10
	rename g m_p10_stderr
	
	rename h m_p25
	rename i m_p25_stderr
	rename j m_p50
	rename k m_p50_stderr
	rename l m_p75
	rename m m_p75_stderr
	rename n m_p90
	rename o m_p90_stderr
	rename p m_p95
	rename q m_p95_stderr

	replace year = year[_n-1] if year==""
	destring m_p5- m_p95_stderr, force replace
	save tmp-math2, replace	
	
// Reading percentiles

import excel "IDEExcelExport-Sep072026-0734PM.xls", ///
	sheet("Report 2- Table") cellrange(B12:Q332) firstrow clear
	
	rename *, lower
	rename yearstudy year
	rename thpercentile r_p5
	rename standarderror r_p5_sterr
	rename f r_p10
	rename g r_p10_stderr
	
	rename h r_p25
	rename i r_p25_stderr
	rename j r_p50
	rename k r_p50_stderr
	rename l r_p75
	rename m r_p75_stderr
	rename n r_p90
	rename o r_p90_stderr
	rename p r_p95
	rename q r_p95_stderr

	replace year = year[_n-1] if year==""
	destring r_p5- r_p95_stderr, force replace
	save tmp-read2, replace		
	
// Science percentiles

import excel "IDEExcelExport-Sep072026-0734PM.xls", ///
	sheet("Report 3- Table") cellrange(B12:Q332) firstrow clear
	
	rename *, lower
	rename yearstudy year
	rename thpercentile s_p5
	rename standarderror s_p5_sterr
	rename f s_p10
	rename g s_p10_stderr
	
	rename h s_p25
	rename i s_p25_stderr
	rename j s_p50
	rename k s_p50_stderr
	rename l s_p75
	rename m s_p75_stderr
	rename n s_p90
	rename o s_p90_stderr
	rename p s_p95
	rename q s_p95_stderr

	replace year = year[_n-1] if year==""
	destring s_p5- s_p95_stderr, force replace
	save tmp-science2, replace			
	
// combine all of the above so that we have one observation per country per year	
use tmp-math, clear
merge 1:1 jurisdiction year using tmp-read, nogen
merge 1:1 jurisdiction year using tmp-science, nogen
merge 1:1 jurisdiction year using tmp-math2, nogen
merge 1:1 jurisdiction year using tmp-read2, nogen
merge 1:1 jurisdiction year using tmp-science2, nogen

// add subject name to variable labels (notice value of using prefixes m_ r_ s_)

foreach var of varlist m_* {
	local oldlabel: variable label `var'
	label var `var' "Math `oldlabel'"
}

foreach var of varlist r_* {
	local oldlabel: variable label `var'
	label var `var' "Reading `oldlabel'"
}

foreach var of varlist s_* {
	local oldlabel: variable label `var'
	label var `var' "Science `oldlabel'"
}
describe
destring year, force replace

gen byte aggobs = 1 if juris=="International Average (OECD)" | ///
	juris=="Selected countries and jurisdictions"
label var aggobs "=1 if a group average (omit from country level analysis)"	

save "PISA aggregate scores 2000-2022 (09_07_26)", replace


// graph 90/10 gaps for USA
gen rgap_9010 = r_p90 - r_p10
gen mgap_9010 = m_p90 - m_p10
gen sgap_9010 = s_p90 - s_p10

twoway (connected rgap_9010 year if jurisdiction=="United States") ///
	   (connected mgap_9010 year if jurisdiction=="United States") ///
	   (connected sgap_9010 year if jurisdiction=="United States"), ///
	   ylabel(200(20)300) xlabel(2000(2)2022) legend(order(1 "Reading" 2 "Math" 3 "Science"))
	   
// graph mean scores for USA
twoway (connected r_avg year if jurisdiction=="United States") ///
	   (connected m_avg year if jurisdiction=="United States") ///
	   (connected s_avg year if jurisdiction=="United States"), ///
	   xlabel(2000(2)2022) legend(order(1 "Reading" 2 "Math" 3 "Science"))	   
