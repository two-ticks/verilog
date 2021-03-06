# 8bit microprocessor verilog

  The parent folder contains the Assembly language compiler in the form of a python script as well as a folder `programs` which contains files which are essentially `16 byte` executable assembly codes. The compiler accepts the compilable text file as an argument in the compilation line and writes the binary sequence in a file named binary.txt. 

  Put all your programs to be assembled in `programs` folder.

  And the output folder contains the output obtained from the testing of the modules. 
  The modules folder contains all the verilog source codes to simulate the 8-bit computer and also the testbench file. The modules required for the computer are defined separately and then combined and interfaced in a common module named `CPU.v` . It also contains a testbench file named `CPU_tb.v` which is used to simulate the behaviour of the computer.
  
  ```bash
├── modules
│   ├── ALU.v
│   └── bcd2disp.v
│   └── CPU_tb.v
│   └── CPU.v
│   └── IC.v
│   └── PC.v
│   └── RAM_template.v
│   └── RAM.v
│   └── register4.v
│   └── register8.v
│   └── triBuff4.v
│   └── tristateBuff.v
│   └── RAM.v
│   └── register4.v

```

# To use the assembler, you may use one of below mentioned methods: 

  
  ## Method 1 (recommended) :

    Run `assembler.cmd` and write name of program with extension which you have put in the `programs` folder.
    And press Enter.

    Now the RAM.v module in the VerilogModules folder will be updated with the new set of instructions.

  ## Method 2 (terminal):

    `python Assembler_v1.py <input_filename_with_extension>`

    And press Enter.

    Copy the contents of the newly generated binary.txt file and use it to replace the similar looking block in RAM.v file (present in `modules` folder).
    Now you can synthesize the CPU_tb.v file and see the output. 

    

# System Requirements :

  Make sure you have python3 installed in your system.


  Make sure you have iverilog (abbreviation of Icarus Verilog) or Vivado synthesizer/simulator.


# GTK Wave :

  Install iverilog (an open source verilog code synthesizer) from here <https://bleyer.org/icarus/> and run below mentioned commands in terminal. MAke sure you are in the same directory as `CPU_tb.v`, otherwise use `cd modules` if you are in parent directory.
  
  
  ```bash
  iverilog -o output.vvp CPU_tb.v


  vvp output.vvp


  gtkwave output.vcd
  ```
  
  Now the gtkwave program (also an open source waveform viewer) will display the output of the 8bit Computer in a new window.


 -[x] what does the numbers at the end of program mean? -> 16 line code is neccessary for assembler to assemble the code improvement needed 

 -[x] how to build compiler using cmd or python script? 

 -[ ] understanding modules 
