// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/CAPTURE_FPGACORE.v,v 1.2 2007/12/07 01:35:04 vandanad Exp $
/*

FUNCTION	: Special Function Cell, CAPTURE_FPGACORE

*/

`timescale  100 ps / 10 ps


module CAPTURE_FPGACORE (CAP, CLK);

    input  CAP, CLK;
  
   parameter ONESHOT = "FALSE";

endmodule

