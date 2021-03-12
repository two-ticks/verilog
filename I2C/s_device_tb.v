`timescale 1ns/1ns
`include "starter.v"

module s_device_tb;

reg RX =0;
reg CLK =0;
wire TX0, TX1, TX2, TX3;

slave_device UUT0(.TX(TX0),.RX(RX),.CLK(CLK));
slave_device UUT1(.TX(TX1),.RX(RX),.CLK(CLK));
slave_device UUT2(.TX(TX2),.RX(RX),.CLK(CLK));
slave_device UUT3(.TX(TX3),.RX(RX),.CLK(CLK));

reg [7:0] DEVICE_SELECT = 8'b0;
integer i=0;
    initial begin
        $dumpfile("s_device.vcd");
        $dumpvars(0,s_device_tb);

        //set an address for UUT
        //UUT.ADDR = 8'b10110010; incorrect order
        UUT0.ADDR = 8'h1A;
        //set an data for UUT
        UUT0.DATA = 8'h5D;

        UUT1.ADDR = 8'h1B;
        UUT1.DATA = 8'h3F;

        UUT2.ADDR = 8'h2A;
        UUT2.DATA = 8'h41;

        UUT3.ADDR = 8'h2B;
        UUT3.DATA = 8'h6C;

        DEVICE_SELECT = UUT0.ADDR;
        for (i = 0; i<8; i=i+1 ) begin
            RX = DEVICE_SELECT[i]; #10; CLK = 0; #10 ; CLK = 1; #10;
        end
        for (i = 0; i<8; i=i+1 ) begin
            CLK = 0; #10 ; CLK = 1; #10;
        end

        DEVICE_SELECT = UUT1.ADDR;
        for (i = 0; i<8; i=i+1 ) begin
            RX = DEVICE_SELECT[i]; #10; CLK = 0; #10 ; CLK = 1; #10;
        end
        for (i = 0; i<8; i=i+1 ) begin
            CLK = 0; #10 ; CLK = 1; #10;
        end

        DEVICE_SELECT = UUT2.ADDR;
        for (i = 0; i<8; i=i+1 ) begin
            RX = DEVICE_SELECT[i]; #10; CLK = 0; #10 ; CLK = 1; #10;
        end
        for (i = 0; i<8; i=i+1 ) begin
            CLK = 0; #10 ; CLK = 1; #10;
        end

        DEVICE_SELECT = UUT3.ADDR;
        for (i = 0; i<8; i=i+1 ) begin
            RX = DEVICE_SELECT[i]; #10; CLK = 0; #10 ; CLK = 1; #10;
        end
        for (i = 0; i<8; i=i+1 ) begin
            CLK = 0; #10 ; CLK = 1; #10;
        end

        // RX = 1; #10; CLK = 0; #10 ; CLK = 1; #10; 
        // RX = 0; #10; CLK = 0; #10 ; CLK = 1; #10; 
        // RX = 1; #10; CLK = 0; #10 ; CLK = 1; #10; 
        // RX = 1; #10; CLK = 0; #10 ; CLK = 1; #10; 
        // RX = 0; #10; CLK = 0; #10 ; CLK = 1; #10; 
        // RX = 0; #10; CLK = 0; #10 ; CLK = 1; #10; 
        // RX = 1; #10; CLK = 0; #10 ; CLK = 1; #10; 
        // RX = 0; #10; CLK = 0; #10 ; CLK = 1; #10; 
        // CLK = 0; #10 ; CLK = 1; #10; 
        // CLK = 0; #10 ; CLK = 1; #10;
        // CLK = 0; #10 ; CLK = 1; #10; 
        // CLK = 0; #10 ; CLK = 1; #10;
        // CLK = 0; #10 ; CLK = 1; #10; 
        // CLK = 0; #10 ; CLK = 1; #10;
        // CLK = 0; #10 ; CLK = 1; #10; 
        // CLK = 0; #10 ; CLK = 1; #10;
    end

    
endmodule