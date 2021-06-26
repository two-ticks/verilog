module priority_encoder (
    input [3:0] encoder_in,input enable
    output [1:0] binary_out
);
    wire [3:0] binary_out;

    assign binary_out = (!enable) ? 0: (
    (encoder_in[3]) ? 3 :
    (encoder_in[2]) ? 2 :
    (encoder_in[1]) ? 1 :
    (encoder_in[0]) ? 0 : 0);
   
endmodule