// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LUT1_L.v,v 1.1 2005/05/10 01:20:06 wloo Exp $
/*

FUNCTION	: 2-inputs LUT

*/

`celldefine
`timescale  100 ps / 10 ps

module LUT1_L (LO, I0);

    parameter INIT = 2'h0;

    input I0;

    output LO;

    wire out;

	assign LO = INIT[I0];

endmodule
