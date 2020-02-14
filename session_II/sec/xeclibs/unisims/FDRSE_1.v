// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FDRSE_1.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: D-FLIP-FLOP with sync reset, sync set and clock enable

*/

`celldefine
`timescale  100 ps / 10 ps

module FDRSE_1 (Q, C, CE, D, R, S);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  C, CE, D, R, S;

	always @(negedge C)
	    if (R)
		Q <= 0;
	    else if (S)
		Q <= 1;
	    else if (CE)
		Q <= D;

endmodule
