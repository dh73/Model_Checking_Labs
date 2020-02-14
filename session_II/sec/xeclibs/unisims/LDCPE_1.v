// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LDCPE_1.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: D-LATCH with async clear, async preset and gate enable

*/

`celldefine
`timescale  100 ps / 10 ps

module LDCPE_1 (Q, CLR, D, G, GE, PRE);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  CLR, D, G, GE, PRE;

	always @( CLR or PRE or D or G or GE)
	    if (CLR)
		Q <= 0;
	    else if (PRE)
		Q <= 1;
	    else if (!G && GE)
		Q <= D;

endmodule
