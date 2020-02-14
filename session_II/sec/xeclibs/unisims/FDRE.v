// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FDRE.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: D-FLIP-FLOP with sync reset and clock enable

*/

`celldefine
`timescale  100 ps / 10 ps

module FDRE (Q, C, CE, D, R);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  C, CE, D, R;

	always @(posedge C)
	    if (R)
		Q <= 0;
	    else if (CE)
		Q <= D;

endmodule
