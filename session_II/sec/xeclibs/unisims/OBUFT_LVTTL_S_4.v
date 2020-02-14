// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OBUFT_LVTTL_S_4.v,v 1.1 2005/05/10 01:20:07 wloo Exp $

/*

FUNCTION	: TRI-STATE OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module OBUFT_LVTTL_S_4 (O, I, T);

    output O;

    input  I, T;

    or O1 (ts, 1'b0, T);
    bufif0 T1 (O, I, ts);

endmodule
