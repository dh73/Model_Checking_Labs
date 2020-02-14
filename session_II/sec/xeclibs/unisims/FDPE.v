// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FDPE.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: D-FLIP-FLOP with async preset and clock enable

*/

// `celldefine
`timescale  100 ps / 10 ps

module FDPE (Q, C, CE, D, PRE);

    parameter INIT = 1'b1;

    output Q;
    reg    Q;

    input  C, CE, D, PRE;

	always @(posedge PRE or posedge C)
	    if (PRE)
		Q <= 1;
	    else if (CE)
		Q <= D;

endmodule
