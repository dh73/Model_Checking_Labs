// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BUFGP.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module BUFGP (O, I);

    output O;

    input  I;

	buf B1 (O, I);

endmodule
