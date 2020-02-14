// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IFDDRCPE.v,v 1.1 2005/05/10 01:20:05 wloo Exp $

/*

FUNCTION	: Dual Data Rate input D-FLIP-FLOP with async clear, async preset and clock enable

*/

`celldefine
`timescale  100 ps / 10 ps

module IFDDRCPE (Q0, Q1, C0, C1, CE, CLR, D, PRE);

    output Q0, Q1;

    input  C0, C1, CE, CLR, D, PRE;

    wire   d_in;

    IBUF I1 (.I(D),
	.O(d_in));

    FDCPE F0 (.C(C0),
	.CE(CE),
	.CLR(CLR),
	.D(d_in),
	.PRE(PRE),
	.Q(Q0));
//    defparam F0.INIT = 1'b0;

    FDCPE F1 (.C(C1),
	.CE(CE),
	.CLR(CLR),
	.D(d_in),
	.PRE(PRE),
	.Q(Q1));
//    defparam F1.INIT = 1'b0;

endmodule
