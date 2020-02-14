// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LUT6_D.v,v 1.1 2007/05/02 17:32:12 vandanad Exp $
/*

FUNCTION	: 6-inputs LUT

*/

module LUT6_D (LO, O, I0, I1, I2, I3, I4, I5);

  parameter INIT = 64'h0000000000000000;

  input I0, I1, I2, I3, I4, I5;

  output LO, O;

  wire LO;

  assign LO = O;

  assign O = INIT[{I5, I4, I3, I2, I1, I0}];

endmodule
