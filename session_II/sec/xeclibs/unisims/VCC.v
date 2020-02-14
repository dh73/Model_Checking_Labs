// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/VCC.v,v 1.1 2005/05/10 01:20:09 wloo Exp $

/*

FUNCTION	: VCC cell

*/

`celldefine
`timescale  100 ps / 10 ps

module VCC(P);

    output P;

	assign P = 1'b1;

endmodule
