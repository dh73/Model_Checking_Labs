// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/XOR3.v,v 1.1 2005/05/10 01:20:09 wloo Exp $

/*

FUNCTION	: 3-INPUT XOR GATE

*/

`celldefine
`timescale  100 ps / 10 ps

module XOR3 (O, I0, I1, I2);

    output O;

    input  I0, I1, I2;

	xor X1 (O, I0, I1, I2);

endmodule
