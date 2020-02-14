// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/STARTUP_SPARTAN3.v,v 1.1 2005/05/10 01:20:09 wloo Exp $
/*

FUNCTION	: Special Function Cell, STARTUP_SPARTAN3

*/

`celldefine
`timescale  100 ps / 10 ps

module STARTUP_SPARTAN3 (CLK, GSR, GTS);

    input  CLK, GSR, GTS;

// synopsys translate_off
    tri0 GSR, GTS;
// synopsys translate_on

endmodule
