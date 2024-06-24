
// Graphs for lecture 4

cd "C:\Users\corcorsp\Dropbox\_TEACHING\Statistics I - PhD\Lectures\Lecture 4 - Sampling distributions"

*** Application 2a

global m 15
global s =3/sqrt(16)
global lb = $m - 3*$s
global ub = $m + 3*$s
global pr = round(normal((13-15)/$s),0.001)

global p1 $lb
global p2 13
local overline = uchar(773)

# delimit ;

twoway function y=normalden(x,$m,$s), range($lb $ub) color(edkblue) droplines($m)  || 
	   function y=normalden(x,$m,$s), range($p1 $p2) recast(area) color(eltgreen%40) 
	   xtitle("{it: x`overline'}") ytitle("Density") 
	   title("") graphregion(fcolor(white)) name(gr1, replace)
	   subtitle("P({it: x`overline'}<13)=$pr") legend(off) xlabel( $m $p2) xline($m, lpattern(dash)) ;
# delimit cr
graph export gr1.png, as(png) replace


*** Application 2b

global m 15
global s =3/sqrt(16)
global lb = $m - 3*$s
global ub = $m + 3*$s
global pr = round(normal((14-15)/$s),0.001)

global p1 $lb
global p2 14
local overline = uchar(773)

# delimit ;

twoway function y=normalden(x,$m,$s), range($lb $ub) color(edkblue) droplines($m)  || 
	   function y=normalden(x,$m,$s), range($p1 $p2) recast(area) color(eltgreen%40) 
	   xtitle("{it: x`overline'}") ytitle("Density") 
	   title("") graphregion(fcolor(white)) name(gr2, replace)
	   subtitle("P({it: x`overline'}<14)=$pr") legend(off) xlabel( $m $p2) xline($m, lpattern(dash)) ;
# delimit cr
graph export gr2.png, as(png) replace


*** Application 2c

global m 15
global s =3/sqrt(16)
global lb = $m - 3*$s
global ub = $m + 3*$s
global pr = round((normal((16.5-15)/$s) - normal((13.5-15)/$s)),0.001)

global p1 13.5
global p2 16.5
local overline = uchar(773)

# delimit ;

twoway function y=normalden(x,$m,$s), range($lb $ub) color(edkblue) droplines($m)  || 
	   function y=normalden(x,$m,$s), range($p1 $p2) recast(area) color(eltgreen%40) 
	   xtitle("{it: x`overline'}") ytitle("Density") 
	   title("") graphregion(fcolor(white)) name(gr3, replace)
	   subtitle("P(13.5<{it: x`overline'}<16.5)=$pr") legend(off) xlabel($p1 $m $p2) xline($m, lpattern(dash)) ;
# delimit cr
graph export gr3.png, as(png) replace



*** Application 3

global m 32
global s =17/sqrt(69.4)
global lb = $m - 3*$s
global ub = $m + 3*$s
global pr = 0.95

global p1 28
global p2 36
local overline = uchar(773)

# delimit ;

twoway function y=normalden(x,$m,$s), range($lb $ub) color(edkblue) droplines($m)  || 
	   function y=normalden(x,$m,$s), range($p1 $p2) recast(area) color(eltgreen%40) 
	   xtitle("{it: x`overline'}") ytitle("Density") 
	   title("") graphregion(fcolor(white)) name(gr4, replace)
	   subtitle("P((28-32)/(17/sqrt(69.5)<{it: x`overline'}<((36-32)/(17/sqrt(69.5)))=$pr") legend(off) xlabel($p1 $m $p2) xline($m, lpattern(dash)) ;
# delimit cr
graph export gr4.png, as(png) replace


*** Application -- Bernoulli

global m 0.46
global s =0.04980
global lb = $m - 3*$s
global ub = $m + 3*$s
global pr = round(1-normal((0.5-0.46)/$s),0.001)

global p1 0.50
global p2 $ub
local overhat = uchar(302)

# delimit ;

twoway function y=normalden(x,$m,$s), range($lb $ub) color(edkblue) droplines($m)  || 
	   function y=normalden(x,$m,$s), range($p1 $p2) recast(area) color(eltgreen%40) 
	   xtitle("{&pi}-hat") ytitle("Density") 
	   title("") graphregion(fcolor(white)) name(gr5, replace)
	   subtitle("P({&pi}-hat>0.50)=$pr") legend(off) xlabel($p1 $m) xline($m, lpattern(dash)) ;
# delimit cr
graph export gr5.png, as(png) replace
