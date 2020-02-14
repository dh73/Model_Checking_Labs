// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/AND3B3.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: 3-INPUT AND GATE

*/

`celldefine
`timescale  100 ps / 10 ps

module AND3B3 (O, I0, I1, I2);

    output O;

    input  I0, I1, I2;

    not N2 (i2_inv, I2);
    not N1 (i1_inv, I1);
    not N0 (i0_inv, I0);
    and A1 (O, i0_inv, i1_inv, i2_inv);

endmodule
