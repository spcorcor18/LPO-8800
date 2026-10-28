# Lecture 7: Statistical power and effect size

## What you should know and be able to do:

* What are *Type I Errors* and *Type II Errors*?  How are Type I Errors and α related?

* Explain in words what the "probability of a Type I error" (α) and "probability of a Type II error" (β) refer to.

* What (in words) is *statistical power* for a specific alternative hypothesis? What kinds of things affect power? Why is a specific alternative hypothesis necessary in order to compute power? What is the generally accepted level of "good" power?

* Be able to use an online power applet and Stata to calculate the probability of a Type II error and power for tests for a single mean and a single proportion. (You would be given the necessary information to do this, including a specific alternative).

* Be able to use Stata to find the minimum required sample size in order to detect a given effect size in a test for a single mean or proportion (i.e., a difference between the alternative and null hypotheses). Similarly, be able to use Stata to find the *minimum detectable effect size* (MDES) for a test.

* Be able to explain how *reliability* of a measure affects power. (Also, what is reliability?)

* What is the difference between *statistical significance* and *practical significance*? What is an "effect size," in words? How do you calculate the "Cohen’s d" measure of effect size?

* Explain how differences that are neither practically nor statistically significant can still provide valuable information (e.g., a "precise zero").

* There are lots of ways to communicate the results of inferential statistics: using test statistics and/or p-values, by indicating statistical significance, and by reporting confidence intervals. What are the pros/cons of each approach?

	Note: zero and the point estimate are often not the only values of interest. Having information about the *strength* of the evidence against the null can be useful, as well as the set of parameter values that the data are consistent with. 

* How should one benchmark effect sizes in order to determine whether they are practically significant or not? What are some of the benchmarks that are frequently used in education? Based on his review, what does Kraft consider to be a *large* effect in education?

* What is *publication bias* and *p-Screening*? How do these distort our understanding of the truth of "effects" and effect sizes?

* What is *p-Hacking*? What pattern of *p* values across studies suggest it is occurring?

* How is your Type I error rate affected when conducting *multiple* hypothesis tests in a single study? In what kinds of situations does this arise? What is a *family-wise error rate* (FWER)?

* What is the *Bonferroni correction* and what problem is it intended to solve? Why is it considered a "conservative" correction? Be able to apply a Bonferroni adjustment given relevant information.

* Another common procedure for addressing the multiple comparison problem is the *Benjamini-Hochberg* procedure. This approach is less conservative than Bonferroni and focuses on the *false discovery rate*. What is the false discovery rate (FDR) and how does this criteria differ from the one used in Bonferroni?

## Video resources:

[Tour of power and sample size features in Stata](https://www.youtube.com/watch?v=szNkh8Z7Op8)

[Conceptual introduction to power and sample size in Stata](https://www.youtube.com/watch?v=QBONLUp7i28)

## Other resources:

Agresti chapter 6

Glennerster, R. & Takavarasha, K. (2013). "Statistical Power" in *Running Randomized Evaluations: A Practical Guide*. Princeton University Press. Vanderbilt library link [here](https://www-degruyterbrill-com.proxy.library.vanderbilt.edu/document/doi/10.1515/9781400848447/html)

<ins>Power applets and calculators</ins>

Power applet 1: http://digitalfirst.bfwpub.com/stats_applet/stats_applet_9_power.html

Power applet 2 (nicer): https://istats.shinyapps.io/power/

Power applet 3 (another one): https://rpsychologist.com/d3/nhst/

GPower free power software for Mac and Windows: https://www.psychologie.hhu.de/arbeitsgruppen/allgemeine-psychologie-und-arbeitspsychologie/gpower

<ins>Benchmarking effect sizes</ins>

Kraft, M. A. (2020). "Interpreting Effect Sizes of Education Interventions." *Educational Researcher.* Available [here](https://journals.sagepub.com/doi/10.3102/0013189X20912798)

Hill, C. J., H. S. Bloom, A. R. Black & M.W. Lipsey (2008). "Empirical Benchmarks for Interpreting Effect Sizes in Research." *Child Development Perspectives* 2(3): 172—177. Available [here](https://srcd.onlinelibrary.wiley.com/doi/abs/10.1111/j.1750-8606.2008.00061.x)

Lortie-Forgues, H., Sio, U. N., & Inglis, M. (2021). How Should Educational Effects Be Communicated to Teachers? *Educational Researcher*, 50(6), 345-354. https://doi.org/10.3102/0013189X20987856

Matthay, E. C., Hagan, E., Gottlieb, L. M., Tan, M. L., Vlahov, D., Adler, N., & Glymour, M. M. (2021). Powering population health research: Considerations for plausible and actionable effect sizes. *SSM - Population Health*, 14, 100789. https://doi.org/10.1016/j.ssmph.2021.100789 

Rutledge, T., & Loh, C. (2004). Effect sizes and statistical testing in the determination of clinical significance in behavioral medicine research. *Annals of Behavioral Medicine*, 27(2), 138-145. https://doi.org/10.1207/s15324796abm2702_9 

von Hippel, P. (Forthcoming). Multiply by 37 (or Divide by 0.027): A Surprisingly Accurate Rule of Thumb for Converting Effect Sizes From Standard Deviations to Percentile Points. *Educational Evaluation and Policy Analysis*. Available [here](https://journals.sagepub.com/doi/abs/10.3102/01623737241239677)

Weiss, M., Somers, M.-A., & Hill, C. (2023). "Empirical Benchmarks for Planning and Interpreting Causal Effects of Community College Interventions." *Journal of Postsecondary Student Success*, 3(1): 14-59. Available [here](https://doi.org/10.33009/fsop_jpss132759)

Wilson, S. J., et al. (2026). "Empirical Benchmarks for Effect Size Interpretation and Study Planning with Social and Behavioral Outcomes." *Journal of Research on Educational Effectiveness* 19(1): 129-154. Available [here](https://doi.org/10.1080/19345747.2024.2427767)

Effect size contextualizer app: https://ebcontextualizer.shinyapps.io/EmpBench/ 

<!---
	x&#772; for x-bar
	&pi; for pi
	p&#770; for p-hat
	&mu; for mu
	&sigma; for sigma
	H<sub>0</sub> to use subscript
--->
