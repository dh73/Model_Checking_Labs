// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LDP.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: D-LATCH with async preset

*/

`celldefine
`timescale  100 ps / 10 ps

module LDP (Q, D, G, PRE);

    parameter INIT = 1'b1;

    output Q;
    reg    Q;

    input  D, G, PRE;

	always @( PRE or D or G)
	    if (PRE)
		Q <= 1;
	    else if (G)
		Q <= D;

endmodule
