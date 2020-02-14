// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ICAP_SPARTAN6.v,v 1.4 2011/12/01 19:28:04 vandanad Exp $
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
// /___/   /\     Filename : ICAP_SPARTAN6.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module ICAP_SPARTAN6 (
  BUSY,
  O,
  CE,
  CLK,
  I,
  WRITE
);
  
  parameter DEVICE_ID = 32'h04000093;

  parameter SIM_CFG_FILE_NAME = "NONE";


  output BUSY;
  output [15:0] O;

  input CE;
  input CLK;
  input WRITE;
  input [15:0] I;

endmodule
