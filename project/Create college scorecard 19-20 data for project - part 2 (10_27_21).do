
// ***********************************************************************
// LPO.8800 Project - Create College Scorecard Data Part 2
// Last updated: October 27, 2021
// ***********************************************************************

clear all
set more off
capture log close
set linesize 80

use "C:\Users\corcorsp\Dropbox\_DATA\College Scorecard\College scorecard 19-20 (10_25_21).dta"

// institutions that offer a BA or higher
keep if highdeg==3 | highdeg==4

// predominately award BA and not exlusively grad (preddeg==4)
keep if preddeg==3

// currently operating
keep if curroper==1

// drop flags for degree types by cip code
drop cip0* cip1* cip2* cip3* cip4* cip5* pcip*

// vars to keep
keep unitid instnm city stabbr main numbranch preddeg highdeg control region locale ///
	hbcu pbi hsi adm_rate adm_rate_all satvrmid satmtmid actcmmid actenmid ///
	actmtmid sat_avg sat_avg_all ugds* pptug_ef npt4* costt4_a inexpfte avgfacsal ///
	pftfac pctpell pctfloan c150_4* pftftug1_ef cdr3 d_pctpell_pctfloan openadm ///
	tuitfte ugnonds grads endow* booksupply-otherexpense_fam costt4_a

destring main-endowend, force replace

// enrollment--all
foreach j in ugds ugnonds grads {
   replace `j'=0 if `j'==.
   }
gen enrollall = ugds + ugnonds + grads
label var enrollall "total enrollment (ug degree + ug nondegree + grads)"

order unitid-hsi enrollall ugds ugnonds grads
drop npt4_048_pub- npt4_75up_priv

// drop Penn State branches that are rolled up in main campus
drop if enrollall==0

// consolidate avg net price
gen npt4 = npt4_pub
replace npt4 = npt4_priv if npt4==. & npt4_priv~=.
label var npt4 "average net price for title iv institutions"

order unitid-pptug_ef npt4 

compress
save "C:\Users\corcorsp\Dropbox\_TEACHING\Statistics I - PhD\Project\College scorecard\College scorecard extract 2019-20 (10_26_21).dta"
