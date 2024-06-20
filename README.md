# Simple Digital Communication System with DSP Algorithms

This project demonstrates the design and implementation of simple Digital Signal Processing (DSP) algorithms using Discrete Fourier Transform (DFT) for digital communication signals.
The project is divided into two main parts: detection and frequency synchronization. 

## Part 1: Detection

In the first part, we design a detector for a digital communication system where a message (a string of characters) is mapped to a unique waveform and transmitted over a noisy communication channel.
The detector receives a noisy version of the transmitted sequence and attempts to reconstruct the original message using Short Time Fourier Transform. This part is implemented in the file q2p1.m using MATLAB.

## Part 2: Frequency synchronization

In practical scenarios, carrier frequency offsets (CFO) occur due to mismatched transmitter and receiver frequencies.
This part of the project deals with estimating and compensating for the CFO to ensure accurate message detection, and is implemented in the file q2p2.m using MATLAB.

## Usage:

1. Clone the repository:
- git clone https://github.com/anupama1412/dsp_project.git
- cd digital_communication_project

2. MATLAB Files:
- q2p1.m: Contains the implementation for Part 1.
- q2p2.m: Contains the implementation for Part 2.

3. To run part 1 on the example matlab data file provided (prob2.mat)
- load('prob2.mat');
- detected_message = q2p1(y);
- disp(detected_message);

