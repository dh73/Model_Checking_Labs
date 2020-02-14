// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/INV.v,v 1.1 2005/05/10 01:20:05 wloo Exp $

/*

FUNCTION	: INVERTER

*/

`celldefine
`timescale  100 ps / 10 ps

module INV (O, I);

    output O;

    input  I;

	not N1 (O, I);

endmodule
