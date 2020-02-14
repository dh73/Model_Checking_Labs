// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ICAP_VIRTEX6.v,v 1.3 2009/08/22 00:32:34 harikr Exp $
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
// /___/   /\     Filename : ICAP_VIRTEX6.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module ICAP_VIRTEX6 (
  BUSY,
  O,
  CLK,
  CSB,
  I,
  RDWRB
);

  parameter DEVICE_ID = 32'h04244093;

  parameter ICAP_WIDTH = "X8";
  parameter SIM_CFG_FILE_NAME = "NONE";

  output BUSY;
  output [31:0] O;

  input CLK;
  input CSB;
  input RDWRB;
  input [31:0] I;

endmodule
