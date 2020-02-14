// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FDSE.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: D-FLIP-FLOP with sync set and clock enable

*/

`celldefine
`timescale  100 ps / 10 ps

module FDSE (Q, C, CE, D, S);

    parameter INIT = 1'b1;

    output Q;
    reg    Q;

    input  C, CE, D, S;

	always @(posedge C)
	    if (S)
		Q <= 1;
	    else if (CE)
		Q <= D;

endmodule
