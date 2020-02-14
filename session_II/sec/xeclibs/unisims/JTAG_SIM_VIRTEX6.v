// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/JTAG_SIM_VIRTEX6.v,v 1.4 2009/09/03 18:46:44 vandanad Exp $
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
// /___/   /\     Filename : JTAG_SIM_VIRTEX6.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale 1 ps/1 ps

module JTAG_SIM_VIRTEX6( TDO, TCK, TDI, TMS);


  output TDO;

  input TCK, TDI, TMS;
   
  parameter PART_NAME = "LX75T";

endmodule // JTAG_SIM_VIRTEX6
