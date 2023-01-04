## **Assignment 6 - Frequency-Domain Analysis of Heart Sounds**
#### **Assignment Description**
Learning outcomes After this assignment, student can • use spectrogram representation when doing frequency-domain analysis • perform segmentation of phonocardiograms (PCG) • produce an averaged Power Spectral Density (PSD) of segments of a PCG signal

Required reading Read chapter 6 from course book.

Assignment description You will study the power spectral density of heart sounds.

References [1] Zhang, W., Han, J., & Deng, S. (2017). Heart sound classification based on scaled spectrogram and partial least squares regression. Biomedical Signal Processing and Control, 32, 20-28. URL: [http://www.sciencedirect.com/science/article/pii/S1746809416301616](http://www.sciencedirect.com/science/article/pii/S1746809416301616)

This lab exercise is based on the material provided in [http://people.ucalgary.ca/~ranga/enel563/](http://people.ucalgary.ca/~ranga/enel563/). The material is used with the permission of Professor Rangaraj M. Rangayyan.

## [Spectrograms and Power Spectral Densities](https://grader.mathworks.com/courses/91023-521273s-biosignal-processing-i-online-labs-autumn-2022/assignments/244188-assignment-6-frequency-domain-analysis-of-heart-sounds/problems/869113-spectrograms-and-power-spectral-densities)
## Introduction

Phonocardiograms

A Phonocardiogram (PCG) is a recording of the heart sounds. Some of the important features of the PCG include: the frequency content of murmurs and heart sounds, the maximum intensities of the heart sounds, the intensity patterns of murmurs, and the timing sequence of the heart sounds and murmurs.

Heart sounds are caused by the acceleration or deceleration of blood in the heart’s chambers. There are two major heart sounds that occur during a cardiac cycle. The first heart sound (S1) is due to ventricular contraction, and occurs at the same time as the QRS complex in the ECG signal. (See Section 1.2.8 of the course book.) The frequency content of S1 is limited to a low-frequency band of about 10-120 Hz.

The closure of the semilunar (pulmonary and aortic) valves gives rise to the second heart sound (S2). S2 occurs at about the end of the T wave in the ECG. The frequency content of S2 is usually higher than that of S1, in the range of about 10-200 Hz.

The intervals between S1 and S2 of a cardiac cycle, and between S2 of a cycle and S1 of the next cycle (corresponding to ventricular systole and diastole, respectively) are normally silent (see Fig. 1). Murmurs, caused by certain cardiovascular defects and diseases, may occur in these intervals. Murmurs are high-frequency noise-like vibrations that arise when the velocity of blood becomes high due to an irregularity, orifice, or defect through which the blood flows.

“Many pathological conditions of the cardiovascular system are reflected in heart sound signals, which makes it possible to diagnose heart disease by analyzing heart sound signals.” [1] One way of analyzing heart sounds is to use a Spectrogram, which is a method to visually represent the spectrum of frequencies of signal, here PCG, as they vary within some interval of time.

![](https://lcms-files.mathworks.com/content/images/663a5f70-47a1-44fc-baac-a5e904eeaa09.png)

Figure 1. Simultaneously recorded ECG and PCG and the four states of the PCG recording; S1, Systole, S2 and Diastole. Systole is the part of the cardiac cycle when a heart chamber contracts.

![](https://lcms-files.mathworks.com/content/images/b192ffe6-315d-4c9d-8700-30c8a21853f7.png)

Figure 2.Spectrogram corresponding to the PCG signal in Fig. 1. Frequency is displayed on the vertical axis and time on the horizontal axis, and plot intensity as a heat map.

Power Spectral Density

The Power Spectral Density (PSD) of a signal is given by the squared magnitude of the Fourier transform (FT) of the signal. In the case of PCGs, the random nature of the vibrations and the associated signals causes variation in the frequency content from one heart beat (cardiac cycle) to another. Therefore, the PSD computed using one PCG cycle or segment will not provide an accurate representation of the PSD of the signal. In order to overcome this limitation, we could extract PCG segments from several cardiac cycles using the ECG as a reference (trigger) signal, compute the PSD of each segment, and average the PSD’s over several cardiac cycles. In such a procedure, each segment should correspond to the same phase or period of the cardiac cycle. The procedure may be applied to derive separate PSD’s for the different distinct parts of the PCG signal, such as S1, the systolic segment after S1, S2, and the diastolic segment after S2 (until the next S1). The averaged PSD’s may then be characterized in terms of quantitative features, such as moments. See Sections 6.4.5 and 6.6 of the course book.

Useful MATLAB commands:

load, subplot, title, xlabel, ylabel, spectrogram, resample, pwelch, mean, meanfreq, numel

## Data

The data is given in one file (‘data6.mat’) containing the phonocardiograms (PCG) and electrocardiograms (ECG) of all five patients. The sampling rate of the signals is 1000 Hz. Similarly to the previous assignment, the signals are available in a 1x5 struct (for the five patients), which has the following fields:

-   t: the time points for the signals
-   ECG: the ECG signal of the patient
-   PCG: the PCG signal of the patient
-   label: pathological information

The full data is in the above format struct called data, and two cycles are pre-extracted for you in the struct called cycles. You can reach the data with the following syntax: for example data(2).ECG is the ECG signal from the second patient, data(5).PCG is the PCG signal of the fifth patient, and so on.

The first and second signals belong to normal subjects. the third and fourth belong to two subjects with ventricular septal defect (a hole between the two ventricles, causing blood to leak from the left ventricle to the right ventricle during systole), causing systolic murmur in the PCG. The fifth signals are from a subject with aortic stenosis(stiffened leaflets of the aortic valve causing incomplete opening of the valve and constrained ejection of blood into the aorta during ventricular systole), causing systolic murmur in the PCG. You can listen to the PCG’s using the MATLAB sound function in case you are interested.

In addition, you are supplied with two functions - QRSDetection and detectPeaks - that are based on Assignment 4 solution. The function QRSDetection uses the detectPeak function, and you only need to directly call the aforementioned one. The calling syntax is [QRSOnsets, QRSOffsets] = QRSDetection(data) where data is the 200 Hz ECG, and the outputs are the QRS onset and offset times as in Assignment 4.

## Task

To start, please load the signals to MATLAB workspace.

Your first task is to work on the two pre-extracted beats in the struct cycles.

-   Compute the PCG spectrogram for each of the subjects using the MATLAB function [s,f,t,p] = spectrogram(x,window,noverlap,f,fs,...). Study the [function help file](https://se.mathworks.com/help/signal/ref/spectrogram.html) learning the meaning of input and output parameters. Use a Hamming window of length 50 samples, an overlap of 45 samples, leave the number of fft points unspecified, and include the sampling frequency. In addition, specify the ’MinThreshold’ of -30 dB, and the parameter ’yaxis’.
-   Plot and study the signals and spectrograms, and compare them to the information about the pathologies.

Move on to using all the data in the struct data.

-   Find the QRS complex onset times for each subject using QRSDetection. Remember the sampling rate requirements!
-   Extract the systolic PCG segments using those starting points as a reference.
-   Estimate the power spectral densities of the PCG segments using [pxx,f] = pwelch(x,window,noverlap,f,fs) and also calculate the average PSD over all of them. Leave window, noverlap, and f as unspecified.
-   Plot and study the signals and PSDs, and the averaged PSD, and compare them to the information about the pathologies.

Note: In all the tasks above, you are required to process the data for all the subjects.