// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/NOR2B2.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: 2-INPUT NOR GATE

*/

`celldefine
`timescale  100 ps / 10 ps

module NOR2B2 (O, I0, I1);

    output O;

    input  I0, I1;

    not N1 (i1_inv, I1);
    not N0 (i0_inv, I0);
    nor O1 (O, i0_inv, i1_inv);

endmodule
