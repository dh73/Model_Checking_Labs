// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OBUF.v,v 1.2 2007/05/02 17:24:18 vandanad Exp $

/*

FUNCTION	: OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module OBUF (O, I);
    
    parameter CAPACITANCE = "DONT_CARE";
    parameter DRIVE = 12;
    parameter IOSTANDARD = "DEFAULT";
    parameter SLEW = "SLOW";

    output O;

    input  I;

    bufif0 B1 (O, I, 1'b0);

endmodule
