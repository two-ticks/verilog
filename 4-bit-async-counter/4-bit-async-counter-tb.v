`timescale 1ns/1ns
`include "4-bit-async-counter.v"

module testbench;

reg j=1, k=1,clock=0,reset=1,clk=0; 
wire q,qb;

counter UUT(j,k,clock,reset,q,qb);

always 
 begin
    clk=~clk;
    #10;
 end
initial
 begin
    $dumpfile("4-bit-async-counte.vcd");
    $dumpvars(0, testbench);
    clock=~clock; #10;
    clock=~clock; #10;
    clock=~clock; #10;
    clock=~clock; #10;

    $finish;
 end    

endmodule