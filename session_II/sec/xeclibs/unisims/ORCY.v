// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ORCY.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: OR for carry logic

*/

`celldefine
`timescale  100 ps / 10 ps

module ORCY (O, CI, I);

    output O;

    input  CI, I;

	or X1 (O, CI, I);

endmodule
