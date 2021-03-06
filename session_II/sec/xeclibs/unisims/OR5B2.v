// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OR5B2.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 5-INPUT OR GATE

*/

`celldefine
`timescale  100 ps / 10 ps

module OR5B2 (O, I0, I1, I2, I3, I4);

    output O;

    input  I0, I1, I2, I3, I4;

    not N1 (i1_inv, I1);
    not N0 (i0_inv, I0);
    or O1 (O, i0_inv, i1_inv, I2, I3, I4);

endmodule
