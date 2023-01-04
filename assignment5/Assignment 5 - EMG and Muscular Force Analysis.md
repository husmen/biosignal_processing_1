## **Assignment 5 - EMG and Muscular Force Analysis**
#### **Assignment Description**
Learning outcome After this assignment student can • characterize the level of activity in EMG signals, and • analyze the relationship between EMG signal properties and muscular force.

Required reading Read chapter 5 from the course book.

Assignment description In this lab assignment, you will explore several measures, features, properties, or in other words parameters derived from EMG signals, and study their relationship to the associated muscular force.

Note: This lab exercise is based on the material provided in [http://people.ucalgary.ca/~ranga/](http://people.ucalgary.ca/~ranga/). The material is used with the permission of Professor Rangaraj M. Rangayyan.

## [Linear modeling](https://grader.mathworks.com/courses/91023-521273s-biosignal-processing-i-online-labs-autumn-2022/assignments/244183-assignment-5-emg-and-muscular-force-analysis/problems/869108-linear-modeling)
## Introduction

EMG signal is the electrical signal associated with muscular contraction. Level of activity of the EMG signal increases with force; see Section 1.2.4 of the course book for details on the EMG signal.

In order to investigate the relationship between an independent variable and a dependent variable, it is common practice to fit a mathematical function or a curve to the data samples available, and then to examine the accuracy of the underlying model (goodness of fit). In the present lab assignment, you will investigate the appropriateness of linear fits (straight-line or linear models) to represent the variation of each of the parameters DR, MS, ZCR and TCR as a function of independent variable force.

A brief explanation of the parameters:

-   The dynamic range (DR) of a signal is the difference between its maximum and minimum values over a specified duration. This range of values is also referred to as the peak-to-peak swing or range.
-   The average power of a signal is provided by the mean-squared (MS) value over a specified duration of time; the average magnitude over the same duration is given by the root-mean-squared (RMS) value. With the mean of the EMG signal being zero, the RMS value is equal to the standard deviation of the signal.
-   An approximate indicator of the level of activity in a signal is given by the number of times the signal crosses the zero line (assuming a mean value of zero; if the mean is not zero, it should be subtracted from the signal). A zero crossing is said to occur when the sign of a sample of the signal is different from the sign of the preceding sample. The average number of zero crossings over a certain time period is known as the zero-crossing rate (ZCR). It is expected that increased presence of high-frequency components in a signal will lead to larger ZCR. See Section 5.6 on statistical analysis of EMG signals.
-   Turns count (TC) is the number of times the signal amplitude changes direction. In Willison method (used in this assignment) turns greater than 100 µV are counted, with the threshold selected to avoid counting insignificant fluctuations due to noise. TCR (Turns Count Rate) is the turns count divided by the time duration of the segment.

## Data

Muscle force and EMG data from the original experiment are shown in Figure 1. The sampling rate is 2000 Hz for all provided signals, and the EMG sample values are in mV. The data segments have been prepared for the assignment and are available in data.mat file. The segments were cropped at their 70% of maximal value within the segment. The data variable is a 1x5 struct (for the 5 segments), and has the following fields:

-   t: the time points for the segment
-   force: muscle force data readily prepared in percent of maximal voluntary contraction
-   EMG: the EMG data for the segment with its mean (DC) subtracted
-   length: the number of samples in the segment

You can reach the data with the following syntax: for example data(2).force is the force signal from the second segment, data(5).EMG is the EMG signal of the fifth segment, and so on.

![](https://lcms-files.mathworks.com/content/images/d62da64b-ce4b-4bef-b5d8-8e535e36661d.png)

Figure 1. Muscle force and EMG signals of the experiment with segment starting and ending points marked with red stars and black circles, respectively. %MVC: percent of maximal voluntary contraction

Useful MATLAB commands:

hold, max, min, diff, sign, abs, polyfit, polyval, find

## Task

Your task is to:

1.  Study the data by plotting it with respect to time. I.e. plot all the segments of the already normalized force (in %MVC) in a subplot(2,1,1), and the EMG signal (in mV) in a subplot(2,1,2) against their time corresponding time axes. Your plot will be like Figure 1 above, with the discarded signal parts (not belonging to any segment) missing from the plot. Hint: you can plot the 5 segments with separate plot signals (using hold on), and keep the segments in their default colors.
2.  Calculate the average force exerted within each segment of the force signal.
3.  Compute the DR for each segment of the EMG signal.
4.  For each segment of the EMG signal, compute MS. Ensure that the MS values are computed using the appropriate number of samples for each segment. The MS value of a signal x over its duration of N samples is the following: ![](data:image/png;base64,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).
5.  For each segment of the EMG signal, compute ZCR without using dsp.ZeroCrossingDetector. Ensure that you normalize ZCR to zero crossings per second by dividing the number of zero crossings by the time duration of the corresponding segment. Do not remove the mean but assume the signal is zero mean already.
6.  For each segment of the EMG signal, compute TCR with the algorithm* given below.
7.  Using the polyfit and polyval functions in MATLAB, obtain a straight-line (linear) fit to represent the variation of each EMG parameter as a function of independent variable force. Superimpose the obtained linear models (straight-line fits) on their corresponding subplots of the preceding step.
8.  Compute the correlation coefficients (r) for each parameter with corr function.

*) TCR algorithm

To find the TCR, proceed as follows:

1.  Compute the derivative of the EMG signal (diff)
2.  Detect the points of change in its sign (defined as the MATLAB sign function, taking values in {-1, 0, 1})
3.  A significant turn is found wherever the derivative signal changes sign, and the original signal differs by at least 100 μV between current and previous (significant or non-significant) turn points (not the previous samples).
4.  TCR is the amount of significant turns divided by the time duration of the corresponding segment

Note 1: A sign change between two of the derivative samples implies that there exists a zero crossing between them (as the derivative is considered also to be a continuous signal). This vanishing of the derivative happens at an extrema point (min/max) of the original signal.

Note 2: If utilizing the MATLAB sign command, please also consider that it evaluates to 0 at 0.