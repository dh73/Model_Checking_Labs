// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OBUFT_LVCMOS15_S_12.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: TRI-STATE OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module OBUFT_LVCMOS15_S_12 (O, I, T);

    output O;

    input  I, T;

    or O1 (ts, 1'b0, T);
    bufif0 T1 (O, I, ts);

endmodule
