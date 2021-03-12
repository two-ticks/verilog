`timescale 1ns/1ns
`include "starter.v"

module testbench; 

reg [7:0] ADDR;

// MOSI -> Master Out Slave In
// MISO -> Master In Slave Out
// SCLK -> Serial Clock 

wire MOSI;
wire MISO;
wire SCLK;

wire [3:0] W_MISO;

assign MISO = | W_MISO; //ORing

master_device UUTM0(.ADDR(ADDR), .TX(MOSI), .RX(MISO), .CLK(SCLK));

slave_device UUTS0(.TX(W_MISO[0]), .RX(MOSI), .CLK(SCLK));
slave_device UUTS1(.TX(W_MISO[1]), .RX(MOSI), .CLK(SCLK));
slave_device UUTS2(.TX(W_MISO[2]), .RX(MOSI), .CLK(SCLK));
slave_device UUTS3(.TX(W_MISO[3]), .RX(MOSI), .CLK(SCLK));

initial begin
    $dumpfile("i2c.vcd");
    $dumpvars(0, testbench);

    //set an address for UUT
        //UUT.ADDR = 8'b10110010; incorrect order
        UUTS0.ADDR = 8'h1A;
        //set an data for UUT
        UUTS0.DATA = 8'h5D;

        UUTS1.ADDR = 8'h1B;
        UUTS1.DATA = 8'h3F;

        UUTS2.ADDR = 8'h2A;
        UUTS2.DATA = 8'h41;

        UUTS3.ADDR = 8'h2B;
        UUTS3.DATA = 8'h6C;
        
        ADDR = UUTS0.ADDR; #500;
        ADDR = UUTS1.ADDR; #500;
        ADDR = UUTS2.ADDR; #500;
        ADDR = UUTS3.ADDR; #500;
        
end
    
endmodule