// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LUT2_D.v,v 1.1 2005/05/10 01:20:06 wloo Exp $
/*

FUNCTION	: 2-inputs LUT

*/

`celldefine
`timescale  100 ps / 10 ps

module LUT2_D (LO, O, I0, I1);

    parameter INIT = 4'h0;

    input I0, I1;

    output LO, O;

    wire out;

        assign O = INIT[{I1,I0}];
        assign LO = INIT[{I1,I0}];

endmodule
