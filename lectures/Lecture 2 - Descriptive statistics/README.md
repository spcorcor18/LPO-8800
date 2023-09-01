# Lecture 2: Describing Univariate Distributions

## Topics covered:

* Basic commands in Stata: refer to the "Stata Basics" handout on Github, and watch the Crash Course in Stata video

* Describing categorical data:
	* Know what *frequency* and *relative frequency* (percent) distributions tell you about the distribution of a variable; know to produce and read these in Stata.
	* For what kinds of measures would you most likely produce a frequency (or relative frequency) distribution?
	* How can one use the *cumulative percent* column in a Stata table? For what kinds of measures is it useful/appropriate?
	* How can one determine in Stata how many observations have *missing values* of a particular variable?
	* Know how to read a *bar graph* (frequency or percent), and how to produce one in Stata. For what kind of measure is a bar graph appropriate?
	* Know how to read a *pie graph*, and how to produce one. For what kind of measure is a pie graph appropriate?
	* What do the terms *mutually exclusive* and *collectively exhaustive* mean?

* Describing quantitative data:
	* Know how to read a *histogram*, and how to produce one in Stata. For what kind of measure is a histogram appropriate? For what kind of variable is a histogram not appropriate?
	* Know how to read a *stem-and-leaf* display, and how to produce one in Stata.
	* What is a *symmetric distribution*? What does it mean for a distribution to be *right skewed* or *left skewed*? Be able to recognize symmetry/skewness from a histogram (and later, from a boxplot).

* Central tendency:
	* Know how the following measures are defined, and be prepared to calculate them, given relevant data: *mean, median, mode*. Also know how to find these using Stata.
	* Know when the use of each central tendency measure is appropriate to use.
	* How does one take a weighted average of group means to find the overall mean? 
	* What does the mean of a *dichotomous* (0-1) variable tell you?
	* When will the median of a distribution be smaller than its mean? Larger than its mean? Be able to identify such cases in a histogram, boxplot, or other distributional graph.

* Basic properties of the summation operator; carrying out a double summation

* Variation/dispersion:

	* Know how the following measures are defined, and be prepared to calculate them, given relevant data: <em>range, interquartile range, variance, standard deviation, coefficient of variation</em> (you will not have to calculate the variance or standard deviation manually from raw data on an exam). Know how to find these using Stata.

	* Know when the use of each measure of variability above is an appropriate measure to use. 

* What is an <em>outlier</em>? In practice, how should one deal with outliers? What are the considerations?

* What is a <em>quantile</em>? A <em>percentile</em>? A <em>quartile</em>? How are these found using a given dataset? How are they found using Stata? Be aware of the different rules Stata uses in `summarize` and `centile` to find quantiles.

* What is the <em>interquartile range</em> (IQR)? Be able to use Stata output to find the IQR. 

* Know how to read a <em>boxplot</em>, and how to produce one. What do the ends of the boxes signify? What determines how long the whiskers are? What determines whether a value is an outlier?

* What is the <em>skewness statistic</em>?  Know how to comment appropriately on the skewness of a distribution using Stata output and/or graphical depictions of a distribution.

* Data transformations:

	* What is meant by a <em>linear transformation</em> of a variable? What is a <em>nonlinear transformation</em>? How does one create a new or transformed variable in Stata?

	* How will a linear transformation affect the mean, median, mode, interquartile range, range, variance, and standard deviation of a random variable?  How will it affect the shape or skewness of the distribution?

	* What kind of a transformation is a <em>translation</em>? A <em>reflection</em>? What do these two types of transformations do to the variance of the variable’s distribution?

	* What is a <em>standardized score</em>? How is one potentially more useful than using raw scores? What are some examples of standardized scores?

	* How are the square root and logarithm transformations useful?

	* For what values is the square root transformation valid? For what values is the logarithmic transformation valid? If your data does not meet these requirements, what can you do?
	
	* How do log transformations typically affect the skewness of a distribution?

	* What are the differential effects of a log base 2 transformation, base e transformation (natural log), base 10 transformation, etc.?
	* Why would one use an inverse hyperbolic sine transformation?

* What is a <em>z-score</em>?  How do you interpret a z-score, in words? Be able to calculate z-scores given relevant data, and using Stata.

* Be able to convert a z-score to its original scale given relevant data.

## Other resources:

* The short article in this folder by Osborne (2002) is a useful piece on data transformations.

* Soure of the summskew ado file: https://github.com/SLWeinberg/Stata_Skewness

* [Why divide by (n-1)?](https://towardsdatascience.com/why-sample-variance-is-divided-by-n-1-89821b83ef6d)

* Bellemare, M. F., & Wichman, C. J. (2020). Elasticities and the Inverse Hyperbolic Sine Transformation. *Oxford Bulletin of Economics and Statistics*, 82(1), 50-61. https://doi.org/10.1111/obes.12325

* Kling, J. R., Liebman, J. B., & Katz, L. F. (2007). Experimental Analysis of Neighborhood Effects. *Econometrica*, 75(1), 83-119. https://doi.org/10.1111/j.1468-0262.2007.00733.x
