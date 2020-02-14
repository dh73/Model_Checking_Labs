// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IOBUF_LVDCI_15.v,v 1.1 2005/05/10 01:20:05 wloo Exp $

/*

FUNCTION	: INPUT TRI-STATE OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module IOBUF_LVDCI_15 (O, IO, I, T);

    output O;

    inout  IO;

    input  I, T;

    or O1 (ts, 1'b0, T);
    bufif0 T1 (IO, I, ts);

    buf B1 (O, IO);

endmodule
