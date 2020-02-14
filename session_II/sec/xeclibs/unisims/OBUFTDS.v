// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OBUFTDS.v,v 1.2 2007/05/02 17:24:18 vandanad Exp $

/*

FUNCTION	: TRI-STATE OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module OBUFTDS (O, OB, I, T);

    parameter CAPACITANCE = "DONT_CARE";
    parameter IOSTANDARD = "DEFAULT";

    output O, OB;

    input  I, T;

    or O1 (ts, 1'b0, T);
    bufif0 B1 (O, I, ts);
    notif0 N1 (OB, I, ts);

endmodule
