// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/GND.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: GND cell

*/

`celldefine
`timescale  100 ps / 10 ps

module GND(G);

    output G;

	assign G = 1'b0;

endmodule
