// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/NAND4B2.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: 4-INPUT NAND GATE

*/

`celldefine
`timescale  100 ps / 10 ps

module NAND4B2 (O, I0, I1, I2, I3);

    output O;

    input  I0, I1, I2, I3;

    not N1 (i1_inv, I1);
    not N0 (i0_inv, I0);
    nand A1 (O, i0_inv, i1_inv, I2, I3);

endmodule

