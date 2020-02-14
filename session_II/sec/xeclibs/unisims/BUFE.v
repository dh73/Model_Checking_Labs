// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BUFE.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: TRI-STATE BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module BUFE (O, E, I);

    output O;

    input  E, I;

	bufif1 B1 (O, I, E);

endmodule
