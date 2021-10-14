# Lecture 10: Covariance and correlation

## Topics covered:

* Review how the *expected value* and *variance* are defined for discrete and continuous probability distributions.

* How is the population *covariance* (σ<sub>xy</sub>) defined? How is the sample covariance calculated? Know the basic properties of covariance.

* How is the population *correlation* (ρ) defined? How is the sample (Pearson) correlation coefficient calculated? Know the basic properties of correlation. How would you explain correlation, in words? What is the difference between *correlation* and *causation*?

* What does a *scatter diagram* show? Be able to comment on the correlation between two variables by looking at a scatterplot (i.e. the direction, shape, and strength of correlation), and know how to create a scatterplot and scatterplot matrix in Stata.

* What is meant by a *linear correlation*? A *nonlinear correlation* (or association)? Zero correlation?

* Be able to find/calculate the Pearson correlation in Stata, given relevant data (using `corr` or `pwcorr`). What is the difference between *listwise* and *pairwise* deletion? 

* Know how to *interpret* the correlation coefficient, from statistical output.

* For what types of variables is the Pearson correlation coefficient appropriate (i.e., what kinds of measures? What values can it take on?

* How will a linear transformation of one (or both) variables affect the Pearson correlation coefficient?

* Know how the *Spearman rank correlation coefficient* is calculated in Stata, and how to interpret it. For what kinds of variables is the Spearman correlation appropriate?

* How is the *point biserial correlation coefficient* calculated?  How is the computation of the point biserial easier than calculating the usual Pearson correlation coefficient?  For what kinds of variables is the point biserial correlation coefficient appropriate?  Be prepared to calculate the point biserial correlation coefficient, given relevant data.

* For what kinds of variables is the *Phi coefficient* appropriate? (Don’t worry about calculating this one, and bear in mind that Stata uses the same command regardless of whether you’re looking for the traditional Pearson correlation, the point biserial correlation, or Phi coefficient).

* Know how to conduct a hypothesis test about the correlation coefficient in Stata

## Stata commands:

Create a scatter diagram with values of *yvar* on the vertical axis and values of *xvar* on the horizontal axis:

`graph twoway scatter yvar xvar`

Same, using abbreviated command:

`scatter yvar xvar`

Calculate the Pearson correlation coefficients for all combinations of variables listed in *varlist*. E.g. `corr yvar xvar` will provide the correlation coefficient between *yvar* and *xvar*. Uses listwise deletion for missing values:

`correlate varlist`	

Calculate the Pearson correlation coefficients for all combinations of variables listed in *varlist*. Uses pairwise deletion for missing values. Add the option `obs` to also report the sample size used for each correlation:

`pwcorr varlist`

Calculate the Spearman rank correlation coefficients for all combinations of variables listed in *varlist*:

`spearman varlist`

## Other resources:

[Web app scatterplots and correlation](https://istats.shinyapps.io/Association_Quantitative/)

[Guess the correlation](https://istats.shinyapps.io/guesscorr/)

<!---
* x&#772; for x-bar
* &pi; for pi
* p&#770; for p-hat
* &mu; for mu
* &sigma; for sigma
* H<sub>0</sub> to use subscript
--->


