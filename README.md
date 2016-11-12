# QRScomplex-detection-matlab
Detecting QRS complex from a jammed signal on MATLAB.
In this case, we take a specific ECG signal purposely polluted with noise on higher frequencies. The code filters the ECG using an unitary step filter and then detects the QRS segment using FFT.

#Running

Open file Lab4.m in MATLAB 2013 or above.
If you would like the ECG signal on an arduino UNO, uncomment the serial code that sends the trigger.
