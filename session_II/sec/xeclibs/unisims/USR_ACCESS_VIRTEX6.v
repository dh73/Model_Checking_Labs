// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/USR_ACCESS_VIRTEX6.v,v 1.3 2009/08/22 00:32:35 harikr Exp $
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
// /___/   /\     Filename : USR_ACCESS_VIRTEX6.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module USR_ACCESS_VIRTEX6 (
  CFGCLK,
  DATA,
  DATAVALID
);

  output CFGCLK;
  output DATAVALID;
  output [31:0] DATA;


endmodule
