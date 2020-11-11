# d-flipflop.v
```verilog
module flipflop (D, CLK, Q);
    input D, CLK;
    output reg Q;

    always@(posedge CLK)
    begin
        Q = D;
    end
endmodule
```
# d-flipflop-tb.v

```verilog
`timescale 1ns/1ns
`include "d-flipflop.v"

module testbench;

reg D=0, CLK = 0; 
wire Q;

flipflop UUT(D, CLK, Q);

always 
 begin
    CLK=~CLK;
    #10;
 end
initial
 begin
    $dumpfile("d-flipflop.vcd");
    $dumpvars(0, testbench);
    D=0; #45;
    D=1; #45;
    D=0; #45;
    $finish;
 end    

endmodule
```
`iverilog -o 
