# Lecture 4: Probability and probability distributions

## Topics covered:

* What is meant by a *random process* or *random experiment*?

* Connect the definition of probability to relative frequency in the population (the "frequentist" interpretation of probability).

* Know and apply these concepts from probability: *sample space, discrete vs. continuous outcomes, event, probability* (of an event), *complement* (of an event), *union* (of events), *intersection* (of events), *mutually exclusive events, independent events*, probability of *equally likely* outcomes

* Know and apply the probability rules given in class, e.g. the *additive rule of probability* for events that are mutually exclusive and not mutually exclusive, and the *multiplicative rule* for independent events.

* Compute conditional probabilities from relevant information, including 2x2 tables of frequencies or probabilities.

* What is *Bayes' Rule* and how is it used? What are the *prior* and *posterior* probabilities in Bayes' Rule?

* What does it mean for two events to be *independent*?

* Discrete probability distributions:
	* How should one read a discrete probability distribution? What does it tell you?
	* Know how to calculate the mean (*expected value*) of a discrete probability distribution, given the outcomes and associated probabilities.
	* *Bernoulli distribution* (0-1 outcomes): what is the probability distribution function (PDF)? Expected value? Variance?
	* *Binomial distribution* (independent Bernoulli trials): what is the PDF? Expected value? Variance?

* Continuous probability distributions:
	* How should one read a (graphical) continuous probability distribution? What does it tell you? What does the area underneath a continuous probability distribution represent? What is the total area underneath a continuous probability distribution?
	* *Uniform (rectangular) distribution*: what is the PDF? Expected value? Variance? What is the probability of drawing a random value between two values a and b on the uniform distribution?
	* *Normal distribution*: What two parameters define the normal distribution? Be sure to know the key properties of a normal distribution (its symmetry, the “Empirical Rule,” etc.)
	* *Standard normal*: What is a standard normal distribution? Use the standard normal to calculate the probability that a normally distributed variable (with mean μ and standard deviation σ) falls below or above given values, or between two values. Known how to do this using: (1) the standard normal table from the textbook; (2) the display function in Stata; and (3) an online calculator.

* Simulating draws from probability distributions in Stata: know how to create a dataset (or a variable within a dataset) that contains random draws from common distributions such as uniform, binomial, and normal. See the handout “Useful Stata Commands for Simulation” for a full description of related Stata commands.


## Other resources:

[Gary King (Harvard Kennedy School) lecture on probability](https://www.youtube.com/watch?v=6C7yRBfh2ok)

[Tiktok video on conditional probabilities (via Twitter)](https://twitter.com/howie_hua/status/1421502809862664197) - example of P(vaccinated|infected) versus P(infected|vaccinated)

[Normal distribution shading tool](https://www.stat.berkeley.edu/~stark/Java/Html/NormHiLite.htm) - a nice tool for showing the area between two points on a standard normal distribution. You can screen clip them and use them in problem sets, for example.

[Normal distribution shading tool](https://homepage.divms.uiowa.edu/~mbognar/applets/normal.html) - another nice applet for showing the area under a normal distribution.

[Stat Trek normal distribution calculator](https://stattrek.com/online-calculator/normal.aspx) - tried and true tool for calculating probabilities from the normal distribution.

[Art of Stats - binomial distribution visual](https://istats.shinyapps.io/BinomialDist/) - get PDF, mean, and standard deviation given *n* and *p*

[Art of Stats - normal distribution visual](https://istats.shinyapps.io/NormalDist/) - produces a graphical PDF and calculates probabilities from the normal distribution.


