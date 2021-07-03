`timescale 1ns / 1ps

module dual_port_ram # (
    parameter ADDR_WIDTH = 6,
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 1 << ADDR_WIDTH)(
    //it has two set of address and data bus,
    input clk,
    inout [DATA_WIDTH-1:0] data_a,data_b, //data bus and bus b;
    input [ADDR_WIDTH-1:0] addr_a,addr_b, //address bus a and bus b;
    input we_a,we_b, //Separated write and read signal;
    input oe_a ,oe_b,
    input cs_a, cs_b,

    //reg[DATA_WIDTH-1:0] q_a,q_b, //two sets of output data bus ;
    output reg [DATA_WIDTH-1:0] data_a_out,data_b_out
);
    //define the ram 
    reg [DATA_WIDTH-1:0] ram [DEPTH-1:0]; //DATA_WIDTH*DEPTH bit;

    //Memory Write Block 
    always @ (posedge clk)
    begin : MEMORY_WRITE
        if (cs_a && we_a) //high level is write;
            begin
                ram[addr_a] <= data_a;
            end
        else if (cs_b && we_b)
        begin
            ram[addr_b] <= data_b;

        end
    end

    //First Port of RAM

    //Tri-State Buffer control 
    assign data_a = (cs_a && oe_a && !we_a) ? data_a_out : 8'bz;


    //Memory Read Block 
    always @ (posedge clk)
    begin : MEMORY_READ_A
        if (cs_a && !we_a && oe_a) //high level is write;
            begin
                data_a_out <= ram[addr_a]; //read data out;
            end
        else
            begin
                data_a_out <= 0;
            end
    end


    //Second Port of RAM

    // Tri-State Buffer control 
    assign data_b = (cs_b && oe_b && !we_b) ? data_b_out : 8'bz;

    // Memory Read Block 
    always @ (posedge clk)
    begin : MEMORY_READ_B
        if (cs_b && !we_b && oe_b) begin
            data_b_out <= ram[addr_b];
        end else begin
            data_b_out <= 0;
        end
    end

endmodule
