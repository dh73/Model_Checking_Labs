// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LDE.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: D-LATCH with gate enable

*/

`celldefine
`timescale  100 ps / 10 ps

module LDE (Q, D, G, GE);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  D, G, GE;

	always @( D or G or GE)
	    if (G && GE)
		Q <= D;

endmodule
