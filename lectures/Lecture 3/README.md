# Lecture 3: Describing Univariate Distributions (II)

## Topics covered:

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

* What is a <em>z-score</em>?  How do you interpret a z-score, in words? Be able to calculate z-scores given relevant data, and using Stata.

* Be able to convert a z-score to its original scale given relevant data.

## Other resources:

* The short article by Osborne (2002) is a useful piece on data transformations.