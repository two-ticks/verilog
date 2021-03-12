`timescale 1ns/1ns
/**
* Inter-Integrated Circuits (I2C) Communication Protocol
*
* Note : This is a slightly modified I2C protocol. The SDA
* port has been replaced by TX and RX port
*
*/

// TX -> MOSI
// RX -> MISO 
// CLK -> SCLK
module master_device (
   ADDR, TX, RX, CLK
);
    input [7:0] ADDR;
    input RX;
    output reg TX;
    output reg CLK;

    reg [7:0] DATA;

    integer i=0;

    always @(ADDR) begin

        for (i = 0; i<8 ;i=i+1 ) begin
            CLK = 0; #10; //this will not work in actual FPGA it is just for verilog
            TX = ADDR[i];
            CLK = 1; #10; 
        end
        
        for (i = 0; i<8 ;i=i+1 ) begin
            CLK = 0; #10; 
            CLK = 1; #10;
            DATA[i] = RX;
             
        end
        
    end
endmodule

// TX -> MISO
// RX -> MOSI
// CLK -> SCLK

module slave_device (
    TX, RX, CLK
);
    input RX,CLK;
    output reg TX=0;
    //the address (set in the testbench)
    reg [7:0] ADDR;
    //the data (set in the testbench)
    reg [7:0] DATA;
    //store input from master to compare with ADDR
    reg [7:0] ADDR_COMPARE = 8'd0;
    //counter to keep track of the CLK pulses
    reg [3:0] counter =0;
    always @(posedge CLK) 
    begin
        if (counter < 8 )
        begin
            //load value at RX into ADDR
            ADDR_COMPARE[counter] = RX;
            
        end
        else
        begin
            if(ADDR_COMPARE == ADDR)
            begin
                TX = DATA[counter - 8];
            end    
        end
        //increament the counter
        counter = counter + 1;

    end
endmodule