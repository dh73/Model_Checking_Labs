// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ROM256X1.v,v 1.2 2007/05/02 17:18:07 vandanad Exp $

/*

FUNCTION	: ROM 256x1

*/

`celldefine
`timescale  100 ps / 10 ps

module ROM256X1 (O, A0, A1, A2, A3, A4, A5, A6, A7);

    parameter INIT = 256'h0000000000000000000000000000000000000000000000000000000000000000;

    output O;

    input  A0, A1, A2, A3, A4, A5, A6, A7;

    wire dout;
    wire [7:0] adr;

    reg mem [0:255];
    reg  [15:0] count;

    buf b0 (adr[7], A7);
    buf b1 (adr[6], A6);
    buf b2 (adr[5], A5);
    buf b3 (adr[4], A4);
    buf b4 (adr[3], A3);
    buf b5 (adr[2], A2);
    buf b6 (adr[1], A1);
    buf b7 (adr[0], A0);
    buf b8 (O, dout);

// synopsys translate_off
    initial begin
	for(count = 0; count < 256; count = count + 1)
	    mem[count] = INIT[count];
    end
// synopsys translate_on

    assign dout = INIT[adr];

endmodule
