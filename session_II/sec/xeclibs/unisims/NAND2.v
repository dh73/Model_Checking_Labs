// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/NAND2.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: 2-INPUT NAND GATE

*/

`celldefine
`timescale  100 ps / 10 ps

module NAND2 (O, I0, I1);

    output O;

    input  I0, I1;

    nand A1 (O, I0, I1);

endmodule
