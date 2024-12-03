
cd "C:\Users\corcorsp\Dropbox\_TEACHING\Statistics I - PhD\Lectures\Lecture 12 - Principal components\Graphics\"

// *************************************************************************
// Stata manual example
// *************************************************************************

use https://www.stata-press.com/data/r18/audiometric
correlate lft* rght*
summ lft* rght*, sep(4)
pca lft* rght*


// *************************************************************************
// Duflo, Dupas, and Kremer (2011) example
// see Hanson Econometrics chapter
// *************************************************************************

use https://github.com/spcorcor18/LPO-8800/raw/main/data/DDK2011.dta, clear

keep pupilid wordscore sentscore letterscore spellscore ///
	additions_score substractions_score multiplications_score mathscoreraw totalscore

corr wordscore sentscore letterscore spellscore additions_score ///
	substractions_score multiplications_score
	
pca wordscore sentscore letterscore spellscore additions_score ///
	substractions_score multiplications_score
	
// Notes:
// 1) eigenvalues associated with each component add up to the
//    sum of the variances of the variables in the analysis
//    (here = 7, the trace). These are the variances of the PCs.
// 2) eigenvectors are the weights that yield the principal
//    components. The sum of the squares of these weights is
//    constrained to be one.
// 3) more than 80% of the variance is accounted for by the
//    first three PCs
// 4) possible interpretation: 

scoreplot

loadingplot
graph export "DDK-loadingplot1.png", as(png) name("Graph") replace

loadingplot, comp(4) combined
graph export "DDK-loadingplot2.png", as(png) name("Graph") replace

screeplot, mean
graph export "DDK-screeplot.png", as(png) name("Graph") replace

pca wordscore sentscore letterscore spellscore additions_score ///
	substractions_score multiplications_score, vce(normal)
	
screeplot, ci

// get principal component scores
predict pc1
drop pc1

predict pc*, score

// these are mean zero and uncorrelated
// diminishing variance
summ pc1-pc7, sep(0)
tabstat pc1-pc7, stat(var) col(stat)
corr pc1-pc7

corr pc1 wordscore sentscore letterscore spellscore additions_score substractions_score multiplications_score


// *************************************************************************
// Two-variable example: bivariate normal
// *************************************************************************

clear
set seed 1234
matrix C = (4, 5 \ 5, 20)
drawnorm x1 x2, n(500) cov(C)
summ x1 x2
corr x1 x2, cov
corr x1 x2
twoway scatter x2 x1, xlabel(-7(2)7) ylabel(-14(2)14) xline(0) yline(0)  aspectratio(1,unit)
graph export "stataexample1.png", as(png) name("Graph") replace

pca x1 x2
pca x1 x2, cov
predict pc*, score
matrix list e(L)
scalar w1=e(L)[1,1]
scalar w2=e(L)[2,1]
display w1
display w2
local r=w2/w1

// graph of PC1
twoway (scatter x2 x1) (function y=`r'*x, range(-4 4)) , ///
	legend(off) xtitle(x1) ytitle(x2) xline(0) yline(0) xlabel(-7(2)7) ylabel(-14(2)14) aspectratio(1,unit)
	
graph export "stataexample1a.png", as(png) name("Graph") replace

// add regression line of best fit for comparison
twoway (scatter x2 x1) (function y=`r'*x, range(-4 4)) (lfit x2 x1), ///
	legend(off) xtitle(x1) ytitle(x2) xline(0) yline(0) xlabel(-7(2)7) ylabel(-14(2)14) aspectratio(1,unit)
	
graph export "stataexample1b.png", as(png) name("Graph") replace

// graph of PC1 and PC2
// NOTE: aspect ratio adj was required to appear properly perpendicular
// see: https://www.mathworks.com/matlabcentral/answers/2070216-plotting-perpendicular-lines-but-they-are-not-perpendicular

local r=w2/w1
twoway (scatter x2 x1) (function y=`r'*x, range(-4 4)) ///
	(function y=-(1/`r')*x, range(-6 6)), ///
	legend(off) xtitle(x1) ytitle(x2) xline(0) yline(0) xlabel(-7(2)7) ylabel(-14(2)14) aspectratio(1,unit)

graph export "stataexample1c.png", as(png) name("Graph") replace
