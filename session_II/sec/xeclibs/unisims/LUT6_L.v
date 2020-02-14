// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LUT6_L.v,v 1.1 2007/05/02 17:32:12 vandanad Exp $
/*

FUNCTION	: 6-inputs LUT

*/

`timescale  100 ps / 10 ps

module LUT6_L (LO, I0, I1, I2, I3, I4, I5);

  parameter INIT = 64'h0000000000000000;
  output LO;
  input I0, I1, I2, I3, I4, I5;

    assign LO = INIT[{I5, I4, I3, I2, I1, I0}];
    
endmodule
