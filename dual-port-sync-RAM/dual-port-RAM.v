module dual_ram #(
    parameter RAM_WIDTH = 8 ,
    parameter RAM_DEPTH = 256 ,
    parameter  ADDR_SIZE = 8)( clk, wr_enb, rd_enb, rst, data_in, data_out
);
    

    input clk, wr_enb, rd_enb, rst;
    input [RAM_WIDTH-1:0] data_in;
    input [ADDR_SIZE-1:0] rd_addr, wr_addr;
    output reg [RAM_WIDTH-1:0] data_out;

    reg [RAM_WIDTH-1:0]mem[RAM_DEPTH-1:0];
    integer i;
    always @(posedge clk) 
    begin
           if (rst) begin
               for (i=0 ;i<RAM_DEPTH ;i=i+1 ) begin
                   mem[i]<=0;
                   data_out <=0;
               end
           end
           else 
           begin
               if(wr_enb)
               mem[wr_addr] <= data_in;
               if(rd_enb)
               data_out <= mem[rd_addr];
           end
    end

endmodule