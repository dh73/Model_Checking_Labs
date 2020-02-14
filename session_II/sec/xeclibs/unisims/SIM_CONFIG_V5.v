///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Configuration Simulation Model
// /___/   /\     Filename : SIM_CONFIG_V5.v
// \   \  /  \    Timestamp : 
//  \___\/\___\
//
// Revision:
//    11/13/07 - Initial version.
////////////////////////////////////////////////////////////////////////////////

`timescale  1 ps / 1 ps

module SIM_CONFIG_V5 ( BUSY,
                   CSOB,
                   DONE,
                   CCLK,
                   CSB,
                   D,
                   DCMLOCK,
                   INITB,
                   M,
                   PROGB,
                   RDWRB
                   );
 
  output BUSY;
  output CSOB;
  inout DONE;
  input  CCLK;
  input  CSB;
  inout  [31:0] D; 
  input  DCMLOCK;
  inout  INITB;
  input  [2:0] M;
  input  PROGB;
  input  RDWRB;

  parameter DEVICE_ID = 32'h0;

endmodule
