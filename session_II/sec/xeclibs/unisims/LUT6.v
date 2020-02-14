// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LUT6.v,v 1.1 2007/05/02 17:32:12 vandanad Exp $
/*

FUNCTION	: 6-inputs LUT

*/

module LUT6 (O, I0, I1, I2, I3, I4, I5);

    parameter INIT = 64'h0000_0000_0000_0000;

    input I0, I1, I2, I3, I4, I5;

    output O;


        assign O = INIT[{I5, I4, I3, I2, I1, I0}];


endmodule
