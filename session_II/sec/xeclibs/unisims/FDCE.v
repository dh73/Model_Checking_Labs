// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FDCE.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: D-FLIP-FLOP with async clear and clock enable

*/

// `celldefine
`timescale  100 ps / 10 ps

module FDCE (Q, C, CE, CLR, D);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  C, CE, CLR, D;

	always @(posedge CLR or posedge C)
	    if (CLR)
		Q <= 0;
	    else if (CE)
		Q <= D;

endmodule
