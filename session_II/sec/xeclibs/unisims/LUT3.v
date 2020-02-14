// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LUT3.v,v 1.1 2005/05/10 01:20:06 wloo Exp $
/*

FUNCTION	: 3-inputs LUT

*/

`celldefine
`timescale  100 ps / 10 ps

module LUT3 (O, I0, I1, I2);

    parameter INIT = 8'h00;

    input I0, I1, I2;

    output O;

    wire out0, out1, out;

        assign O = INIT[{I2,I1,I0}];


endmodule
