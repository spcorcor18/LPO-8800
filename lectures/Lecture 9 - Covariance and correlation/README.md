# Lecture 9: Covariance and correlation

## Topics covered:

* Review how the *expected value* and *variance* are defined for discrete and continuous probability distributions.

* How is the population *covariance* (σ<sub>xy</sub>) defined? How is the sample covariance calculated? Know the basic properties of covariance.

* How is the population *correlation* (ρ) defined? How is the sample (Pearson) correlation coefficient calculated? Know the basic properties of correlation. How would you explain correlation, in words? What is the difference between *correlation* and *causation*?

* What does a *scatter diagram* show? Be able to comment on the correlation between two variables by looking at a scatterplot (i.e. the direction, shape, and strength of correlation), and know how to create a scatterplot and scatterplot matrix in Stata. Know how to use *binscatter* for binned scatterplots.

* What is meant by a *linear correlation*? A *nonlinear correlation* (or association)? Zero correlation?

* Be able to find/calculate the Pearson correlation and covariance in Stata, given relevant data (using `corr` or `pwcorr`). What is the difference between *listwise* and *pairwise* deletion? 

* Know how to *interpret* the correlation coefficient, from statistical output.

* For what types of variables is the Pearson correlation coefficient appropriate (i.e., what kinds of measures? What values can it take on?

* How will a linear transformation of one (or both) variables affect the Pearson correlation coefficient? The covariance?

* Know how the *Spearman rank correlation coefficient* is calculated in Stata, and how to interpret it. For what kinds of variables is the Spearman correlation appropriate?

* How is the *point biserial correlation coefficient* calculated?  How is the computation of the point biserial easier than calculating the usual Pearson correlation coefficient?  For what kinds of variables is the point biserial correlation coefficient appropriate? Be prepared to calculate the point biserial correlation coefficient, given relevant data.

* For what kinds of variables is the *Phi coefficient* appropriate? (Don’t worry about calculating this one, and bear in mind that Stata uses the same command regardless of whether you’re looking for the traditional Pearson correlation, the point biserial correlation, or Phi coefficient).

* Know how to conduct a hypothesis test about the correlation coefficient in Stata. What is the test statistic and what is its sampling distribution?

## Stata commands:

Create a scatter diagram with values of *yvar* on the vertical axis and values of *xvar* on the horizontal axis:

`graph twoway scatter yvar xvar`

Same, using abbreviated command:

`scatter yvar xvar`

Create a matrix of scatterplots:

`graph matrix var1 var2 var3`

Binscatter (must ssc install first):

`binscatter yvar xvar`

Calculate the Pearson correlation coefficients for all combinations of variables listed in *varlist*. E.g. `corr yvar xvar` will provide the correlation coefficient between *yvar* and *xvar*. Uses listwise deletion for missing values:

`correlate varlist`	

Calculate the Pearson correlation coefficients for all combinations of variables listed in *varlist*. Uses pairwise deletion for missing values. Add the option `obs` to also report the sample size used for each correlation:

`pwcorr varlist`

For `corr` and `pwcorr`, add the option `sig` to get a *p*-value for a test of significance. Can add `bonferroni` option for Bonferroni-adjusted *p*-values.

Calculate the Spearman rank correlation coefficients for all combinations of variables listed in *varlist*:

`spearman varlist`

Draw a clustered bar graph:

`graph bar, over(var1) over(var2) asyvars percentages blabel(bar)`

Simulate draws from a bivariate normal distribution. Here the means of *y* and *x* are both 0 and their standard deviations are 1. The bivariate correlation betweeen *y* and *x* is 1, defined in the matrix *C*:

`matrix C = (1 0.5 \ 0.5 1)`

`drawnorm x y, n(100) corr(C)`

## Other resources:

[Web app scatterplots and correlation](https://istats.shinyapps.io/Association_Quantitative/)

[Guess the correlation](https://istats.shinyapps.io/guesscorr/)

[Cox (2008)](https://journals.sagepub.com/doi/10.1177/1536867X0800800307)

<!---
* x&#772; for x-bar
* &pi; for pi
* p&#770; for p-hat
* &mu; for mu
* &sigma; for sigma
* H<sub>0</sub> to use subscript
--->


