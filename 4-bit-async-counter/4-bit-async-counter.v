module jkff(j,k,clock,reset,q,qb);
    input j,k,clock,reset;
    output reg q,qb;
    always@(negedge clock)
    begin
    case({reset,j,k})
    3'b100 :q=q;
    3'b101 :q=0;
    3'b110 :q=1;
    3'b111 :q=~q;
    default :q=0;
    endcase
    qb<=~q;
    end
endmodule

module counter(j,k,clock,reset,q,qb);
    input j,k,clock,reset;
    output wire [3:0]q,qb;

    jkff JK1(j,k,clock,reset,q[0],qb[0]);
    jkff JK2(j,k,q[0],reset,q[1],qb[1]);
    jkff JK3(j,k,q[1],reset,q[2],qb[2]);
    jkff JK4(j,k,q[2],reset,q[3],qb[3]);

endmodule