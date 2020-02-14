// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FD_1.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: D-FLIP-FLOP

*/

`celldefine
`timescale  100 ps / 10 ps

module FD_1 (Q, C, D);

    parameter INIT = 1'b0;

    output Q;
    reg    Q;

    input  C, D;

	always @(negedge C)
	        Q <= D;

endmodule
