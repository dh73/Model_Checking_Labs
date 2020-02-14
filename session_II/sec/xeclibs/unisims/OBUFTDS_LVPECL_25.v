// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OBUFTDS_LVPECL_25.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: TRI-STATE OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module OBUFTDS_LVPECL_25 (O, OB, I, T);

    output O, OB;

    input  I, T;

    or O1 (ts, 1'b0, T);
    bufif0 B1 (O, I, ts);
    notif0 N1 (OB, I, ts);

endmodule
