// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FDS_1.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: D-FLIP-FLOP with sync set

*/

`celldefine
`timescale  100 ps / 10 ps

module FDS_1 (Q, C, D, S);

    parameter INIT = 1'b1;

    output Q;
    reg    Q;

    input  C, D, S;

	always @(negedge C)
	    if (S)
		Q <= 1;
	    else
		Q <= D;

endmodule
