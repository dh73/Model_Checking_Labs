// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OFDDRRSE.v,v 1.2 2007/05/02 17:19:39 vandanad Exp $

/*

FUNCTION	: Dual Data Rate output D-FLIP-FLOP with sync reset, sync set and clock enable

*/

`celldefine
`timescale  100 ps / 10 ps

module OFDDRRSE (Q, C0, C1, CE, D0, D1, R, S);

    output Q;

    input  C0, C1, CE, D0, D1, R, S;

    wire   q_out;

    pulldown r (R);
    pulldown s (S);
    pullup ce (CE);
    
    FDDRRSE F0 (.C0(C0),
	.C1(C1),
	.CE(CE),
	.R(R),
	.D0(D0),
	.D1(D1),
	.S(S),
	.Q(q_out));
//    defparam F0.INIT = 1'b0;

    OBUF O1 (.I(q_out),
	.O(Q));

endmodule
