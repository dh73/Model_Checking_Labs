// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/NOR5B1.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: 5-INPUT NOR GATE

*/

`celldefine
`timescale  100 ps / 10 ps

module NOR5B1 (O, I0, I1, I2, I3, I4);

    output O;

    input  I0, I1, I2, I3, I4;

    not N0 (i0_inv, I0);
    nor O1 (O, i0_inv, I1, I2, I3, I4);

endmodule
