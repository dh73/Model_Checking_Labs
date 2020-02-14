// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OBUFT.v,v 1.2 2007/05/02 17:24:18 vandanad Exp $

/*

FUNCTION	: TRI-STATE OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module OBUFT (O, I, T);

    parameter CAPACITANCE = "DONT_CARE";
    parameter DRIVE = 12;
    parameter IOSTANDARD = "DEFAULT";
    parameter SLEW = "SLOW";

    output O;

    input  I, T;

    bufif0 T1 (O, I, T);

endmodule
