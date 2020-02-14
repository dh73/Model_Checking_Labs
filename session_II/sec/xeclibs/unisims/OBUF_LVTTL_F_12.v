// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OBUF_LVTTL_F_12.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module OBUF_LVTTL_F_12 (O, I);

    output O;

    input  I;

    bufif0 B1 (O, I, 1'b0);

endmodule
