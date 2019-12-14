# Cognitive Radio and Spectrum-Sensing
A Cognitive Radio (CR) is a programmable radio and network technology (intelligent transreceiver) which is adaptive and can automatically detect network traffic in wireless communication channel and adjust its transmission and reception accordingly for efficient use of available bandwidth.
Based on various inputs, CR is capable of allowing users to utilize the unused/vacant communication channels avoiding congestion in the wireless communication channels.
In this project we consider parameters such as Number of users, Signal to Noise Ratio (SNR), Total Error rate and Power level threshold (used for spectrum sensing to approximate network traffic in the wireless communication channel).

This repository holds generalized MATLAB/GNU Octave compatible codes that takes the aforementioned parameters into consideration and approximate the performance of CR by fine tuning the parameters to different values and perform calculations. 

The two major mathematical functions used in the code for computations are:
* Marcum Q-function
* (Upper Incomplete) Gamma-function 

## Marcum Q-function
This function is used to compute the probability of detection P<sub>d</sub> which is used for detection of the usage of available spectrum by setting a power threshold value. That is, the Q-function computes the probability density function `P(X ≥ x)`. So we configure a threshold value for the parameter `x` and apply Marcum-Q function for detection of signal power levels `X` greater than the applied threshold to approximate the usage of channel spectrum. The mathematical equation is as follows:

![CodeCogsEqn](https://user-images.githubusercontent.com/34755328/70851407-9b829c80-1eba-11ea-9253-d120eca0bc72.gif)

## (Upper Incomplete) Gamma-function
This function is used to compute the probability of false detection P<sub>f</sub> which is erroneous detection of power levels which results in a deviation in the spectrum sensing. The Gamma-functions are used to model gamma distribution which is a distribution based on maximum entropy to predict time between random events (such as natural calamities). That is, the gamma function is used to compute the probability of false alarm/detection that happens due to random errors (due to noise which is random in nature) in the equipment being used as it is schotastic and time dependent in nature. The mathematical equation is as follows:

![CodeCogsEqn (1)](https://user-images.githubusercontent.com/34755328/70851610-13ea5d00-1ebd-11ea-9b23-e8dd7c78ec70.gif)

For the range of values configured in the presented codes, the generated graphs are as follows:
## Total Error Rate vs Threshold (threshold set on power level for Spectrum sensing) for varying number of users N (number of users allowed to use the spectrum)
![TER_vs_Thres](https://user-images.githubusercontent.com/34755328/70850377-85231380-1eaf-11ea-8d9d-d52457eb43bb.png)

## Total number of users vs Threshold (threshold set on power level for Spectrum sensing) for different values of Signal-to-Noise ratio (SNR)
![N_vs_Thres](https://user-images.githubusercontent.com/34755328/70850480-c0721200-1eb0-11ea-8398-9caad99e79ed.png)

These graphs provide a visualization of a small set of calculations performed by a CR to adjust its parameters intelligently for efficient transmission and reception to use the available spectrum with more efficiency.
