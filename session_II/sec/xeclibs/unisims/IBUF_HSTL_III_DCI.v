// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IBUF_HSTL_III_DCI.v,v 1.1 2005/05/10 01:20:04 wloo Exp $

/*

FUNCTION	: INPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module IBUF_HSTL_III_DCI (O, I);

    output O;

    input  I;

	buf B1 (O, I);

endmodule
