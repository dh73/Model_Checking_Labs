// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/EFUSE_USR.v,v 1.3 2009/08/22 00:32:34 harikr Exp $
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
// /___/   /\     Filename : EFUSE_USR.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module EFUSE_USR (
  EFUSEUSR
);
  parameter [31:0] SIM_EFUSE_VALUE = 32'h00000000;

  output [31:0] EFUSEUSR;






endmodule
 
