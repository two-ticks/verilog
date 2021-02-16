`timescale 1ns/1ns
`include "mux.v"

module testbench;

reg in1, in2, select;
wire out;

mux2_1 UUT(in1, in2, select, out);

initial
 begin
    $dumpfile("mux.vcd");
    $dumpvars(0, testbench);
    in1=1'b0;in2=1'b0;select=1'b0; #45;
    in1=1'b1;                      #45;
    select=1'b1;                   #45;
    in2=1'b1;                      #45;
    $finish;
 end    

endmodule