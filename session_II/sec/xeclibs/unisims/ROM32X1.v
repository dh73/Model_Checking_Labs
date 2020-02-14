// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ROM32X1.v,v 1.2 2007/05/02 17:18:07 vandanad Exp $

/*

FUNCTION	: ROM 32x1

*/

`celldefine
`timescale  100 ps / 10 ps

module ROM32X1 (O, A0, A1, A2, A3, A4);

    parameter INIT = 32'h00000000;

    output O;

    input  A0, A1, A2, A3, A4;

    wire dout;
    wire [4:0] adr;

    reg mem [0:31];
    reg  [5:0] count;

    buf b0 (adr[4], A4);
    buf b1 (adr[3], A3);
    buf b2 (adr[2], A2);
    buf b3 (adr[1], A1);
    buf b4 (adr[0], A0);
    buf b5 (O, dout);

// synopsys translate_off
    initial begin
	for(count = 0; count < 32; count = count + 1)
	    mem[count] = INIT[count];
    end
// synopsys translate_on

    assign dout = INIT[adr];

endmodule
