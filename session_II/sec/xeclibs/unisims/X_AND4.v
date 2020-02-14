//    Xilinx Proprietary Primitive Cell X_AND4 for Verilog
//
// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/X_AND4.v,v 1.1 2007/05/02 17:37:39 vandanad Exp $
//

`celldefine
`timescale 1 ps/1 ps

module X_AND4 (O, I0, I1, I2, I3);

  output O;
  input I0, I1, I2, I3;

  and (O, I0, I1, I2, I3);

endmodule
