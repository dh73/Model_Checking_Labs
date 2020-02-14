// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LUT5.v,v 1.1 2007/05/02 17:32:12 vandanad Exp $
/*

FUNCTION	: 5-inputs LUT

*/


module LUT5 (O, I0, I1, I2, I3, I4);

  parameter INIT = 32'h00000000;

  input I0, I1, I2, I3, I4;

  output O;

  assign  O = INIT[{I4, I3, I2, I1, I0}];

endmodule
