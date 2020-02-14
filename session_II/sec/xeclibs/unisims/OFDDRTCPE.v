// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OFDDRTCPE.v,v 1.2 2007/05/02 17:19:39 vandanad Exp $

/*

FUNCTION	: Dual Data Rate output D-FLIP-FLOP with async clear, async preset and clock enable

*/

`celldefine
`timescale  100 ps / 10 ps

module OFDDRTCPE (O, C0, C1, CE, CLR, D0, D1, PRE, T);

    output O;

    input  C0, C1, CE, CLR, D0, D1, PRE, T;

    wire   q_out;

    pulldown clr (CLR);
    pulldown pre (PRE);
    pulldown t (T);
    pullup ce (CE);
    
    FDDRCPE F0 (.C0(C0),
	.C1(C1),
	.CE(CE),
	.CLR(CLR),
	.D0(D0),
	.D1(D1),
	.PRE(PRE),
	.Q(q_out));
//    defparam F0.INIT = 1'b0;

    OBUFT O1 (.I(q_out),
	.T(T),
	.O(O));

endmodule
