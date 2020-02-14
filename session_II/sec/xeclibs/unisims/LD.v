// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LD.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: D-LATCH

*/

`celldefine
`timescale  100 ps / 10 ps

module LD (Q, D, G);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  D, G;

	always @( D or G)
	    if (G)
		Q <= D;

endmodule
