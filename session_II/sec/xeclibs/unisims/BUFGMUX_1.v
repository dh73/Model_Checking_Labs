
/*

FUNCTION	: Global Clock Mux Buffer

*/

`timescale  100 ps / 10 ps

module BUFGMUX_1 (O, I0, I1, S);

    output O;

    input  I0, I1, S;

    reg    O;
    

        always @(I0 or I1 or S) begin

            if (S)
                O <= I1;

            else
                O <= I0;

        end

endmodule
