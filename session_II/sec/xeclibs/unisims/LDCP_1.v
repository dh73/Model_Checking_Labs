// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LDCP_1.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: D-LATCH with async clear, async preset

*/

`celldefine
`timescale  100 ps / 10 ps

module LDCP_1 (Q, CLR, D, G, PRE);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  CLR, D, G, PRE;

	always @( CLR or PRE or D or G)
	    if (CLR)
		Q <= 0;
	    else if (PRE)
		Q <= 1;
	    else if (!G)
		Q <= D;

endmodule
