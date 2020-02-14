// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LDCE.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: D-LATCH with async clear and gate enable

*/

`celldefine
`timescale  100 ps / 10 ps

module LDCE (Q, CLR, D, G, GE);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  CLR, D, G, GE;

	always @( CLR or D or G or GE)
	    if (CLR)
		Q <= 0;
	    else if (G && GE)
		Q <= D;

endmodule
