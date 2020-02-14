//////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.i (O.13)
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Configuration Simulation Model
// /___/   /\     Filename : SIM_CONFIGE2.v
// \   \  /  \    Timestamp : 
//  \___\/\___\
//
// Revision:
//     04/29/10 - Initial version
// End Revision
////////////////////////////////////////////////////////////////////////////////

`timescale  1 ps / 1 ps

module SIM_CONFIGE2 ( 
                   CSOB,
                   DONE,
                   CCLK,
                   CSB,
                   D,
                   INITB,
                   M,
                   PROGB,
                   RDWRB
                   );
 
  output CSOB;
  inout DONE;
  input  CCLK;
  input  CSB;
  inout  [31:0] D; 
  inout  INITB;
  input  [2:0] M;
  input  PROGB;
  input  RDWRB;

  parameter DEVICE_ID = 32'h0;
  parameter ICAP_SUPPORT = "FALSE";
  parameter ICAP_WIDTH = "X8";

endmodule
