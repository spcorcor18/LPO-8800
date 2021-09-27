# Lecture 6: Statistical inference--estimation

## Topics covered:

* What is the difference between a *point estimate* and an *interval estimate*? An *estimator* and an *estimate*? A *statistic* and a *parameter*?

* Know the sampling distribution of x-bar (e.g. its mean and standard error), and how to compute the probability that x-bar calculated from a random sample will fall above (or below) some value, or between two values. (This is review from Lecture 5)

* In words, what is meant by a "95% confidence interval?" What is a *confidence level* (1 – α) and what does the *error probability* α represent?

* What is the relationship between the *confidence level* and the width (precision) of a confidence interval? Does precision mean the same thing as "accuracy", or a low error rate?

* Given a sample mean x-bar (and its sample size), calculate a (1 – α)% confidence interval for the population mean μ, assuming σ is known. (E.g. 95%, 99%, 90% confidence interval)

* What must be true about your random variable *x* (or your sample size *n*) in order for the above confidence interval procedure to be appropriate? Explain.

* Given other required information, know how to find the minimum sample size n to obtain a (1 – α)% confidence interval for the population mean μ, assuming σ is known.

* Given relevant data, know how to find a (1 – α)% confidence interval for the population mean μ, in Stata.

* What is the sampling distribution of π-hat (the sample proportion)? What is its mean and standard error? (This is review from Lecture 5)

* Given a sample proportion π-hat (and its sample size), calculate a (1 – α)% confidence interval for the population proportion π. Note that the standard error used in the confidence interval requires the estimate of π.

* Given other required information, know how to find the minimum sample size n to obtain a confidence interval for the population proportion π.

* What is the *margin of error* for a sample proportion π-hat when used as an estimator of the population proportion π? (E.g., when α = 0.05)

* How does the confidence interval estimator change when σ is *not* known, and you have to estimate it using the sample standard deviation *s*? What is the *t* distribution and how is it different from (and similar to) the standard normal distribution? 

* Be able to calculate confidence intervals for the population mean μ whenever σ is unknown.

* Stata functions:
	* mean varname - calculate sample mean of *varname* along with its standard error and 95% confidence interval.
	* mean varname, level(#) - calculate sample mean of *varname* along with its standard error and #% confidence interval.
	* display ttail(df, t) - calculate the area under Student t's distribution, above t, when the degrees of freedom is *df*. (For a sample mean, *df=n-1*).
	* display invttail(df, p) - display the value *t* above which the area under the t distribution (with degrees of freedom *df*) is *p*

## Other resources:



