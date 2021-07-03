`timescale 1ns / 1ps
module dual_port_ram_tb();
    parameter ADDR_WIDTH = 6;
    parameter DATA_WIDTH = 32;
    parameter DEPTH = 16;
    wire [DATA_WIDTH-1:0] data_a,data_b;
    reg [DATA_WIDTH-1:0] tb_data_a,tb_data_b;
    reg [ADDR_WIDTH-1:0] addr_a,addr_b;
    reg we_a,we_b;
    reg oe_a,oe_b;
    reg cs_a,cs_b;
    reg clk;
    wire [DATA_WIDTH-1:0] data_a_out,data_b_out;
    dual_port_ram #(.DATA_WIDTH(DATA_WIDTH),.ADDR_WIDTH(ADDR_WIDTH)) dual_port_ram(
        .data_a(data_a),
        .data_b(data_b),
        .cs_a(cs_a),
        .cs_b(cs_b),
        .oe_a(oe_a),
        .oe_b(oe_b),
        .addr_a(addr_a),
        .addr_b(addr_b),
        .we_a(we_a),
        .we_b(we_b),
        .clk(clk),
        .data_a_out(data_a_out),.data_b_out(data_b_out)
    );
    //create the clock
    always #10 clk = ~clk;
    assign data_a = !oe_a ? tb_data_a : 'hz;
    assign data_b = !oe_b ? tb_data_b : 'hz;

    initial begin
        {clk, tb_data_a, tb_data_b, we_a, we_b, addr_a, addr_b, oe_a, oe_b} = 0;
        //repeat (2) @ (posedge clk);
        for (integer i = 0; i < 2**ADDR_WIDTH; i= i+1) begin
            //repeat (1) @(posedge clk)
            addr_a = i; we_a = 1; cs_a = 1; oe_a = 0; tb_data_a  = $random;
            # 5;
        end
        for (integer i = 0; i < 2**ADDR_WIDTH; i= i+1) begin
            //repeat (1) @(posedge clk)
            addr_a = i; we_a = 0; cs_a=1; oe_a=1;
            #5;
        end
        #20 $finish;
    end
endmodule


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
