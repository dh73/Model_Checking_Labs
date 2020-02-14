///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Differential Signaling Input Buffer
// /___/   /\     Filename : IBUFDS_GTE2.v
// \   \  /  \    Timestamp : Tue Jun  1 14:31:01 PDT 2010
//  \___\/\___\
//
// Revision:
//    06/01/10 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module IBUFDS_GTE2 (
  O,
  ODIV2,

  CEB,
  I,
  IB
);

  parameter CLKCM_CFG = "TRUE";
  parameter CLKRCV_TRST = "TRUE";
  parameter CLKSWING_CFG = "TRUE";

  output O;
  output ODIV2;

  input CEB;
  input I;
  input IB;

endmodule
