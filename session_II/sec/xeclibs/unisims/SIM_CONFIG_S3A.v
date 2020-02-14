// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Configuration Simulation Model
// /___/   /\     Filename : SIM_CONFIG_S3A.v
// \   \  /  \    Timestamp : 
//  \___\/\___\
//
// Revision:
//    11/13/07 - Initial version 
////////////////////////////////////////////////////////////////////////////////

`timescale  1 ps / 1 ps

module SIM_CONFIG_S3A (
                   CSOB,
                   DONE,
                   CCLK,
                   D,
                   DCMLOCK,
                   CSIB,
                   INITB,
                   M,
                   PROGB,
                   RDWRB
                   );
 
  output CSOB;
  inout  DONE;
  input  CCLK;
  input  DCMLOCK;
  input  CSIB;
  inout  [7:0] D; 
  inout  INITB;
  input  [2:0] M;
  input  PROGB;
  input  RDWRB;

  parameter DEVICE_ID = 32'h0;

endmodule
