// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IBUF_SSTL2_II.v,v 1.1 2005/05/10 01:20:05 wloo Exp $

/*

FUNCTION	: INPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module IBUF_SSTL2_II (O, I);

    output O;

    input  I;

	buf B1 (O, I);

endmodule
