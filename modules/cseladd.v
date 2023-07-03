module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire carry;
    wire[15:0] lout, uout1, uout2; 
    add16 la(a[15:0], b[15:0], 0, lout, carry); 
    add16 ua1(a[31:16], b[31:16], 0, uout1, 0);
    add16 ua2(a[31:16], b[31:16], 1, uout2, 0);
    
    always @(lout, uout1, uout2, carry) begin 
        case(carry)
            0: sum <= {uout1, lout};
            1: sum <= {uout2, lout};
        endcase
    end

endmodule
