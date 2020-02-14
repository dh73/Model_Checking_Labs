//    Xilinx Proprietary Primitive Cell X_INV for Verilog
//
// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/X_INV.v,v 1.1 2007/05/02 17:37:39 vandanad Exp $
//

`celldefine
`timescale 1 ps/1 ps

module X_INV (O, I);

  output O;
  input I;

  not (O, I);

endmodule
