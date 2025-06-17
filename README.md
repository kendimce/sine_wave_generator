###### Sine Wave Generation

> **1-** Generate LUT

	* Nyquist sampling (f) >= d/2  where d is highest frequency.
	* In my case D/A module can go up to 400KHz.
	* 400KHz/Fs = d and Fs>=2d
	
[LUT Creator](https://daycounter.com/Calculators/Sine-Generator-Calculator.phtml)

> **2-** Put LUT into BRAM

> **3-** Send it through DAC

![Sine Wave Generator](https://github.com/kendimce/fpga/blob/master/sine_wave_generator/files/modelsim.png "Simulator")
