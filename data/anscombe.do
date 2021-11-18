

use "C:\Users\spcor\Dropbox\_DATA\Stats courses\Weinberg_Abramowitz_2e\anscombe.dta"

twoway (scatter y1 x1) (lfit y1 x1), name(an1, replace) legend(off)
twoway (scatter y2 x2) (lfit y2 x2), name(an2, replace) legend(off)
twoway (scatter y3 x3) (lfit y3 x3), name(an3, replace) legend(off)
twoway (scatter y4 x4) (lfit y4 x4), name(an4, replace) legend(off)

graph combine an1 an2 an3 an4, ycommon xcommon rows(2)
graph export "C:\Users\spcor\Dropbox\_TEACHING\Statistics I - PhD\Lectures\Lecture 11 - Regression\Graphics\anscombe.png", as(png) replace

reg y1 x1
predict uhat1, resid
reg y2 x2
predict uhat2, resid
reg y3 x3 
predict uhat3, resid
reg y4 x4
predict uhat4, resid

twoway (scatter uhat1 x1), name(anb1, replace) legend(off) yline(0)
twoway (scatter uhat2 x2), name(anb2, replace) legend(off) yline(0)
twoway (scatter uhat3 x3), name(anb3, replace) legend(off) yline(0)
twoway (scatter uhat4 x4), name(anb4, replace) legend(off) yline(0)

graph combine anb1 anb2 anb3 anb4, ycommon xcommon rows(2)
graph export "C:\Users\spcor\Dropbox\_TEACHING\Statistics I - PhD\Lectures\Lecture 11 - Regression\Graphics\anscombe2.png", as(png) replace
drop uhat*
