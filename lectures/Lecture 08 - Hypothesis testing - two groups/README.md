# Lecture 8: Hypothesis testing--two groups

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

**Test for a single population mean:**

`ttest varname==c`

*varname* is the response variable and *c* is the mean of *varname* under the null hypothesis.

**Test for a single population proportion:**

`prtest varname==p`

*varname* is the response variable and p is the proportion equal to 1 under the null hypothesis.

**Immediate version of test for a single population mean (no data required):**

`ttesti n1 m1 s1 c`

*n1* is the sample size, *m1* is the sample mean, *s1* is the sample standard deviation, and *c* is the mean of *varname* under the null hypothesis. 

**Immediate version of test for a single population proportion (no data required):**

`prtesti n1 p1 p`

*n1* is the sample size, *p1* is the sample proportion, and *p* is the proportion equal to 1 under the null hypothesis. 

**Independent samples test for a difference in means:**

`ttest varname, by(groupvar)`

*varname* is the response variable and *groupvar* is the group identifying variable. The default assumes equal variances in the population. Adding the *unequal* option tells Stata not to assume equal variances and use the Satterthwaite approximation.

**Independent samples test for a difference in proportions:**

`prtest varname, by(groupvar)`

*varname* is the response variable and *groupvar* is the group identifying variable. Under the null hypothesis, the population proportions are equal, implying equal variances. 

**Immediate version of independent samples test for a difference in means (no data required):**

`ttesti n1 m1 s1 n2 m2 s2`

*n1* and *n2* are the two sample sizes, *m1* and *m2* are the two sample means, and *s1* and *s2* are the two sample proportions. Adding the unequal option tells Stata not to assume equal variances in the population and use the Satterthwaite approximation.

**Immediate version of independent samples test for a difference in proportions (no data required):**

`prtesti n1 p1 n2 p2`

*n1* and *n2* are the two sample sizes, and *p1* and *p2* are the two sample proportions. 

**Paired sample test for a difference in means:**

`ttest var1==var2`

*var1* is the first response variable and *var2* is the second. This command assumes that *var1* and *var2* are reported for each observation. That is, each observation represents a "pair" of outcomes (e.g. before and after).

**Paired sample test for a difference in proportions:**

`prtest var1==var2`

*var1* is the first proportion variable and *var2* is the second. This command assumes that *var1* and *var2* are reported for each observation. That is, each observation represents a "pair" of outcomes (e.g. before and after).

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

