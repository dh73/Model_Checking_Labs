// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/SIM_CONFIG_V5_SERIAL.v,v 1.2 2009/09/02 20:46:40 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 11.1i (L.11)
//  \   \         Description : Xilinx Formal Library Component
//  /   /
// /___/   /\     Filename : SIM_CONFIG_V5_SERIAL.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module SIM_CONFIG_V5_SERIAL (
                   DONE,
                   DOUT,
                   CCLK,
                   DIN,
                   INITB,
                   M,
                   PROGB
                   );

  inout DONE;
  output DOUT;
  input  CCLK;
  input  DIN;
  inout  INITB;
  input  [2:0] M;
  input  PROGB;

  parameter DEVICE_ID = 32'h0;

endmodule
