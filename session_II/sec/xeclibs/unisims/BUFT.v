// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BUFT.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: TRI-STATE BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module BUFT (O, I, T);

    output O;

    input  I, T;

	bufif0 T1 (O, I, T);

endmodule
