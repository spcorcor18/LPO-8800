# Lecture 9: Hypothesis testing--two groups

## Topics covered:

* Why does it make sense to call a hypothesis test for the difference in two population means a *bivariate* analysis?

* If using two sample means in a hypothesis test comparing two population means, why is it important to know how the samples were drawn (that is, whether *independent* or *dependent* samples)? What is the difference between these two types of samples? Given some examples, be able to classify samples as independent or dependent.

* How are the null and alternative hypotheses in a test comparing two population means typically written down? For the independent samples t-test comparing two population means, what is the usual null hypothesis (H<sub>0</sub>)?

* Assuming independent samples, what is the *standard error* for a *difference in means*?

* What is the *t statistic* for an independent samples test for the difference in two population means? What assumptions must hold for this statistic to follow a "*t*" distribution? What are its degrees of freedom, assuming equal population variances? What degrees of freedom is used if we cannot assume equal variances?

* Given two sample means and sample standard deviations from independently drawn random samples (and the sample sizes), be able to construct a (1 – α)% confidence interval for the true difference in population means.

* How is the *t* statistic calculated for an independent samples test for the difference in two population *proportions*? How is the standard error calculated (the denominator in the t-statistic)?

* Given appropriate data, know how to use Stata to conduct an independent samples t-test and construct a confidence interval for the difference in means. Be able to do the same for a test for difference in proportions.

* What is the *t* statistic used in a test for a difference in two means, drawn from *paired* samples? Given appropriate data, know how to use Stata to conduct a paired samples t-test.

* Know how to use Stata to compute the *power* of a independent samples test for the difference in means.

## Stata commands for *t*-tests:

**t-test for a single population mean (or proportion):**

`ttest varname==c`

*varname* is the response variable and c is the mean of *varname* under the null hypothesis.

**Independent samples t-test for a difference in means (or proportions):**

`ttest varname, by(groupvar)`

*varname* is the response variable and *groupvar* is the group identifying variable. Adding the unequal option tells Stata not to assume equal variances in the population.

**Paired sample t-test for a difference in means (or proportions):**

`ttest var1==var2`

*var1* is the first response variable and *var2* is the second. This command assumes that *var1* and *var2* are reported for each observation. That is, each observation represents a "pair" of outcomes (e.g. before and after).


## Other resources:

[Web app example of two-sample comparison of means](https://istats.shinyapps.io/2sample_mean/)

[Web app example of two-sample comparison of proportions](https://istats.shinyapps.io/2sample_prop/)

<!---
	x&#772; for x-bar
	&pi; for pi
	p&#770; for p-hat
	&mu; for mu
	&sigma; for sigma
	H<sub>0</sub> to use subscript
--->

