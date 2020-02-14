// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/CAPTURE_SPARTAN3.v,v 1.2 2007/12/07 01:35:04 vandanad Exp $
/*

FUNCTION	: Special Function Cell, CAPTURE_SPARTAN3

*/

`celldefine
`timescale  100 ps / 10 ps

module CAPTURE_SPARTAN3 (CAP, CLK);

    input  CAP, CLK;
  parameter ONESHOT = "FALSE";

endmodule
