# Thesis
All codes related to my thesis project has been uploaded here.

In my thesis titled 'COMPARATIVE STUDY OF TECHNIQUES THAT QUANTIFY MOVEMENT SYNCHRONY IN DYADS', I have conducted a comparative simulation study to understand the influence of data properties on the quantified synchrony measure using 6 different quantification techniques:

1) Windowed Cross Lagged Correlation - strength (WCLC_S)
2) Windowed Cross Lagged Correlation - frequency (WCLC_F)
3) Windowed Cross Lagged Regression (WCLR)
4) Average Mutual Information (AMI)
5) Cross Sample Entropy (CSE)
6) Cross Reurrence Quantification Analysis (CRQA)

The data properties included in the study were:

1) Amount of synchrony (0.3, 0.6, 0.9)
2) Length of the data (10^3, 10^4, 10^5)
3) Amount of noise (0.1, 0.2, 0.3)

Synchrony data was simulated using the Kuramoto model. Each of the three data properties were simulated at three different levels (as indicated above). 

RESULTS:

- WCLC_S was most effectively able to capture the synchrony in the data
- The length of the data has no influence on the quantified synchrony for all techniques except AMI
- WCLR showed most resilience in terms of dealing with noise
- CSE and CRQA were dormant in their reaction to the changing data properties
- AMI was the most time efficient technique, and WCLC_F was the most efficient among the linear techniques
