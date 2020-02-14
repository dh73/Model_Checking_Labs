// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LDPE_1.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: D-LATCH with async preset and gate enable

*/

`celldefine
`timescale  100 ps / 10 ps

module LDPE_1 (Q, D, G, GE, PRE);

    parameter INIT = 1'b1;

    output Q;
    reg    Q;

    input  D, G, GE, PRE;

	always @( PRE or D or G or GE)
	    if (PRE)
		Q <= 1;
	    else if (!G && GE)
		Q <= D;

endmodule
