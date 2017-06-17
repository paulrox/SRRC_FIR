# Square Root Raised Cosine FIR filter in VHDL

This is a VHDL description of a SRRC FIR filter of order 22. The filter has been designed in symmetrical form and it uses a set of given coefficients.

## VHDL Description

The filter has been designed using [Aldec Active-HDL](https://www.aldec.com/en/products/fpga_simulation/active_hdl_student) and the `VHDL/` folder contains the description of all the filter components.

In particular, other then the description of the filter itself, there are: the description of a Flip-Flop D-Edge Triggered, the testbench for the filter testing ad a co-simulation file needed for the testing phase.

## MATLAB Files

The `MATLAB/` folder contains some MATLAB scripts using during the development.

* `SRRC_coeff.m` - Used for the filters parameters quantization;
* `srrc_manual.m` - MATLAB code implementation of the filter;
* `srrc_fir_sfun.m` - S-Function used to test the filter implementation.

## Filter Testing

The filter has been tested against an identical filter implemented in MATLAB. In particular, two different implementations have been used: manual implementation as a S-Function and using `fdatool`.

Using the Simulink plug-in of Active-HDL it is possible to simulate a VHDL component directly in Simulink (it provides a special VHDL description file and a dedicated block to be used in Simulink).

The `SRRC_Cosimulation.slx` file contains the Simulink used to check the correctness of the VHDL description.

## Author

* **Paolo Sassi** - [paulrox](https://github.com/paulrox)
