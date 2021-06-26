`timescale 1ns/1ns
`include "dual-port-RAM.v"

module testbench;

reg clk;
    reg wr_en;
    reg [7:0] data_in;
    reg [7:0] data_out;
    reg [3:0] addr_in_1;
    reg port_en_0;
    reg port_en_1;
wire out;

dual_ram UUT(clk, wr_enb, rd_enb, rst, data_in, data_out);

initial
 begin
    $dumpfile("dual-port-RAM.vcd");
    $dumpvars(0, testbench);
    in1=1'b0;in2=1'b0;select=1'b0; #45;
    in1=1'b1;                      #45;
    select=1'b1;                   #45;
    in2=1'b1;                      #45;
    $finish;
 end    

endmodule