

// Demonstrating different quantile calculations

sysuse auto, clear
summ price

// There are 74 observations in the data
// The 5th percentile would be the 74*(5/100) = 3.7th obs (round to 4)
// The 10th percentile would be the 74*(10/100) = 7.4th obs (round to 8)
// The 25th percentile would be the 74*(25/100) = 18.5th obs (round to 19)
// The median would be the 74*(50/100) = 37th obs (take avg of 37th and 38th)

// Confirming this:
sort price
list price if _n==4
list price if _n==8
list price if _n==19
list price if _n==37 | _n==38
summ price, detail

// egen will also obtain the same percentile values (saving them as variables):
egen p5=pctile(price), p(5)
egen p50=pctile(price), p(50)
summ p5 p50

// tabstat gives you the same values:
tabstat price, stat(n p5 p10 p25 p50)

tabulate price

// centile will calculate (n+1)*p/100 = 75*(5/100) = 3.75

// centile uses a linear interpolation of the 3rd and 4th observation:
// 3667 + (0.75*(3748-3667)) = 3727.75

centile price, centile(1 5 10 25 50 75 90 95 99)

/*                                                     -- Binom. Interp. --
    Variable |       Obs  Percentile    Centile        [95% Conf. Interval]
-------------+-------------------------------------------------------------
       price |        74          1        3291            3291    3701.074*
             |                    5     3727.75        3291.232    3914.159
             |                   10        3862        3683.619    4067.944
             |                   25        4193        4009.467    4501.838
             |                   50      5006.5        4593.566    5717.898
             |                   75        6378        5798.432      9691.6
             |                   90       11441        8566.638    13567.74
             |                   95       13498        11061.53     15865.3
             |                   99       15906        13540.15       15906*/
			 
egen price5=pctile(price), p(5)
sum price5

/*  Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
      price5 |         74        3748           0       3748       3748*/


tabulate price

/*      Price |      Freq.     Percent        Cum.
------------+-----------------------------------
      3,291 |          1        1.35        1.35
      3,299 |          1        1.35        2.70
      3,667 |          1        1.35        4.05
      3,748 |          1        1.35        5.41
      3,798 |          1        1.35        6.76
      3,799 |          1        1.35        8.11
      3,829 |          1        1.35        9.46
      3,895 |          1        1.35       10.81
      3,955 |          1        1.35       12.16
      3,984 |          1        1.35       13.51
      3,995 |          1        1.35       14.86
      4,010 |          1        1.35       16.22
      4,060 |          1        1.35       17.57
      4,082 |          1        1.35       18.92
      4,099 |          1        1.35       20.27
      4,172 |          1        1.35       21.62
      4,181 |          1        1.35       22.97
      4,187 |          1        1.35       24.32
      4,195 |          1        1.35       25.68
      4,296 |          1        1.35       27.03
      4,389 |          1        1.35       28.38
      4,424 |          1        1.35       29.73
      4,425 |          1        1.35       31.08
      4,453 |          1        1.35       32.43
      4,482 |          1        1.35       33.78
      4,499 |          1        1.35       35.14
      4,504 |          1        1.35       36.49
      4,516 |          1        1.35       37.84
      4,589 |          1        1.35       39.19
      4,647 |          1        1.35       40.54
      4,697 |          1        1.35       41.89
      4,723 |          1        1.35       43.24
      4,733 |          1        1.35       44.59
      4,749 |          1        1.35       45.95
      4,816 |          1        1.35       47.30
      4,890 |          1        1.35       48.65
      4,934 |          1        1.35       50.00
      5,079 |          1        1.35       51.35
      5,104 |          1        1.35       52.70
      5,172 |          1        1.35       54.05
      5,189 |          1        1.35       55.41
      5,222 |          1        1.35       56.76
      5,379 |          1        1.35       58.11
      5,397 |          1        1.35       59.46
      5,705 |          1        1.35       60.81
      5,719 |          1        1.35       62.16
      5,788 |          1        1.35       63.51
      5,798 |          1        1.35       64.86
      5,799 |          1        1.35       66.22
      5,886 |          1        1.35       67.57
      5,899 |          1        1.35       68.92
      6,165 |          1        1.35       70.27
      6,229 |          1        1.35       71.62
      6,295 |          1        1.35       72.97
      6,303 |          1        1.35       74.32
      6,342 |          1        1.35       75.68
      6,486 |          1        1.35       77.03
      6,850 |          1        1.35       78.38
      7,140 |          1        1.35       79.73
      7,827 |          1        1.35       81.08
      8,129 |          1        1.35       82.43
      8,814 |          1        1.35       83.78
      9,690 |          1        1.35       85.14
      9,735 |          1        1.35       86.49
     10,371 |          1        1.35       87.84
     10,372 |          1        1.35       89.19
     11,385 |          1        1.35       90.54
     11,497 |          1        1.35       91.89
     11,995 |          1        1.35       93.24
     12,990 |          1        1.35       94.59
     13,466 |          1        1.35       95.95
     13,594 |          1        1.35       97.30
     14,500 |          1        1.35       98.65
     15,906 |          1        1.35      100.00
------------+-----------------------------------
      Total |         74      100.00*/

tabulate mpg
summ mpg, detail
centile mpg, centile(5 50)


// another example with generated data
clear
set obs 55
gen x = rnormal(100, 20)
sort x

clear
set obs 50
gen x=rnormal(100,20)
centile x,centile(20)
sort x
egen x20=pctile(x),p(20)
sum x20
