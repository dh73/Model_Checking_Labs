// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IFDDRRSE.v,v 1.1 2005/05/10 01:20:05 wloo Exp $

/*

FUNCTION	: Dual Data Rate input D-FLIP-FLOP with sync reset, sync set and clock enable

*/

`celldefine
`timescale  100 ps / 10 ps

module IFDDRRSE (Q0, Q1, C0, C1, CE, D, R, S);

    output Q0, Q1;

    input  C0, C1, CE, D, R, S;

    wire   d_in;

    IBUF I1 (.I(D),
	.O(d_in));

    FDRSE F0 (.C(C0),
	.CE(CE),
	.R(R),
	.D(d_in),
	.S(S),
	.Q(Q0));
//    defparam F0.INIT = 1'b0;

    FDRSE F1 (.C(C1),
	.CE(CE),
	.R(R),
	.D(d_in),
	.S(S),
	.Q(Q1));
//    defparam F1.INIT = "0";

endmodule
