// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/NAND4.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: 4-INPUT NAND GATE

*/

`celldefine
`timescale  100 ps / 10 ps

module NAND4 (O, I0, I1, I2, I3);

    output O;

    input  I0, I1, I2, I3;

    nand A1 (O, I0, I1, I2, I3);

endmodule
