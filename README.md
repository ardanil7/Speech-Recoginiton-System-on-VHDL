# Speech-Recoginiton-System-on-VHDL

This is a comprehensive  project that implements a real time speech recognition on VHDL. And each submodules have different features that contributes speeach recognition system extensively.

At first to implement this project, a Microphone amplifier has been designed with fourth order sallen key filters and the default mean of PCB is about 1.65 volt and max peak to peak voltage of PCB is about 3.3 v volt to fit this voltage for the ADC used in this project.

As an another external device, ADC121s101 has been selected, and the voltage range of this adc has been selected as 0 to 3.3 volt.

For the first part of the code, at first all data comes from PCB conveyed to A dual port ram created on ADC submodule with period of 64000 ns. By the way the default frequency of ADC is 12.5 MHz so for 64000 ns decimation method has been used.
SNR ratio has been calculated as 65. 
Then 16384 data has been divided into 63 frame each has 512 sample with 50% overlap. 
Each frame has been hanned and hanning coefficient's been sent to FFT ip of VHLD to take DFT of the signal.  Signal was converted into signed numbers already.
For the next part  after the signal has been acquired in frequency domain, these signal has been prepared to be processed in Mel submodule. 
In that submodule 13 mel filter banks has been created in 0 to 4 KHz and coefficient of Mel filter banks has been created on MATLAB. 
After calculating band energies for each banks, discrete cosine transform of the signal been taken to take account of the magnitude of the signal given from PCB.
"ıfany PCB with  gain control mechanism would had been used, DCT part would become useless"


After discrete cosine transform has been calculated, in the last part recorded numbers and spoken numbers has been compared with Absolute squared error  method. 
As an FPGA basys 3 has been used and constraints forthat FPGA also included in this project.


All rights Reserved.

