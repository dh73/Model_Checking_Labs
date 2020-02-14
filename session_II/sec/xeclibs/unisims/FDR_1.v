// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FDR_1.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: D-FLIP-FLOP with sync reset

*/

`celldefine
`timescale  100 ps / 10 ps

module FDR_1 (Q, C, D, R);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  C, D, R;

	always @(negedge C)
	    if (R)
		Q <= 0;
	    else
		Q <= D;

endmodule
