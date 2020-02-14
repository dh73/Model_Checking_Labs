// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FDE_1.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: D-FLIP-FLOP with clock enable

*/

`celldefine
`timescale  100 ps / 10 ps

module FDE_1 (Q, C, CE, D);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  C, CE, D;

	always @(negedge C)
	    if (CE)
		Q <= D;

endmodule
