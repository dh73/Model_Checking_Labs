// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/XORCY.v,v 1.1 2005/05/10 01:20:09 wloo Exp $

/*

FUNCTION	: XOR for carry logic

*/

`celldefine
`timescale  100 ps / 10 ps

module XORCY (O, CI, LI);

    output O;

    input  CI, LI;

	xor X1 (O, CI, LI);

endmodule
