// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FDP_1.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: D-FLIP-FLOP with async preset

*/

// `celldefine
`timescale  100 ps / 10 ps

module FDP_1 (Q, C, D, PRE);

    parameter INIT = 1'b1;

    output Q;
    reg    Q;

    input  C, D, PRE;

	always @(posedge PRE or negedge C)
	    if (PRE)
		Q <= 1;
	    else
	        Q <= D;

endmodule
