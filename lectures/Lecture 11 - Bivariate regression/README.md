# Lecture 11: Bivariate regression

## Topics covered:

* Know the terms *response/outcome (Y)* and *explanatory (X)* variables, sometimes referred to as *dependent* and *independent* variables; X is also sometimes called a *predictor*, or *regressor*. Be able to identify which variable is the "natural" response and which is the "natural" explanatory variable in a given case, if relevant in that application. (There is not always a natural response and explanatory variable).

* Know how to overlay a best fit line in Stata (using `lfit`). The equation (in "slope-intercept form") for the best fit line is sometimes called the *prediction equation*. Know how to obtain a predicted value from the prediction equation, given a value of *x*. 

* What is the *least squares* criterion (in words)? What is the *ordinary least squares (OLS)* regression line?

* What is a residual (u-hat)? What are the predicted values of a regression line (y-hat)?

* Given a prediction equation and a specific *(x, y)* data point, how does one calculate a predicted value and residual?

* Be able to calculate the least squares regression coefficients (the *intercept* and *slope* coefficient) using Stata, given relevant data. You will not have to calculate these by hand using raw data, but may be required to compute the slope coefficient using the alternative formula: b-hat=r(s<sub>y</sub>/s<sub>x</sub>).

* Be able to interpret, in words, the least squares intercept (constant term) and slope. Be able to read and interpret Stata regression results. How should one interpret the slope when the explanatory variable is dichotomous (a "dummy" variable?)

* How is the OLS slope coefficient related to the (Pearson) correlation coefficient?

* Be able to obtain predicted values and residuals in Stata, after estimating a regression line.

* In words, what is the *mean squared error (MSE)*?  The *root mean squared error (RMSE)*? 

* How should one interpret the R-squared as a measure of "goodness of fit"? Between what values will it fall?

* Why is the correlation between the predicted values of *y* and the actual *y*’s an informative statistic?  What is it telling you?

* How is the R-squared related to the correlation in a simple bivariate regression?

* Be able to explain (in words) the standard error of the slope in a bivariate regression analysis. How is it used? What assumption(s) lies behind the calculation of this standard error? What factors affect the size of the standard error? 

* Using Stata output, be able to interpret the confidence interval for a regression slope, as well as the *t* statistic and *p* value.

## Stata commands:

Calculate the least squares intercept and slope coefficient for response variable *yvar* and explanatory variable *xvar*:

`regress yvar xvar`

Calculate predicted values or residuals for *y* after a `regress` command. (The option `xb` tells Stata you want predicted values. Use the option `resid` if you want residuals):
  
`predict varname, xb`

Calculate Cook’s influence values following a regression:

`predict varname, cook`

Plot a best fit line for *yvar* using the explanatory variable *xvar*:

`graph twoway lfit yvar xvar`

Two graphs can be overlaid in Stata using `graph twoway`, and the overlaid graph commands in parentheses. E.g.:

`graph twoway (lfit yvar xvar) (scatter yvar xvar)`

## Other resources:

[Web app for exploring linear regression](https://istats.shinyapps.io/ExploreLinReg/)

[Web app illustrating linear regression](https://istats.shinyapps.io/LinearRegression/)


<!---
* x&#772; for x-bar
* &pi; for pi
* p&#770; for p-hat
* &mu; for mu
* &sigma; for sigma
* H<sub>0</sub> to use subscript
--->



