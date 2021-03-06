// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LUT4_L.v,v 1.1 2005/05/10 01:20:06 wloo Exp $
/*

FUNCTION	: 4-inputs LUT

*/

`celldefine
`timescale  100 ps / 10 ps

module LUT4_L (LO, I0, I1, I2, I3);

    parameter INIT = 16'h0000;

    input I0, I1, I2, I3;

    output LO;

    wire out0, out1, out2, out3, out;

        assign LO = INIT[{I3,I2,I1,I0}];

endmodule
