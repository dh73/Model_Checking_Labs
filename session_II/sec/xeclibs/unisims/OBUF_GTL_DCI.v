// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OBUF_GTL_DCI.v,v 1.1 2005/05/10 01:20:07 wloo Exp $

/*

FUNCTION	: OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module OBUF_GTL_DCI (O, I);

    output O;

    input  I;

    bufif0 B1 (O, I, 1'b0);

endmodule
