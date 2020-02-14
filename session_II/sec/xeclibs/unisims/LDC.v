// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LDC.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: D-LATCH with async clear

*/

`celldefine
`timescale  100 ps / 10 ps

module LDC (Q, CLR, D, G);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  CLR, D, G;

	always @( CLR or D or G)
	    if (CLR)
		Q <= 0;
	    else if (G)
		Q <= D;

endmodule
