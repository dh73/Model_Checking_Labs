///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Jtag TAP Controler for VIRTEX7
// /___/   /\     Filename : JTAG_SIME2.v
// \   \  /  \    Timestamp : Mon May 17 17:10:29 PDT 2010
//  \___\/\___\
//
// Revision:
//    05/17/10 - Initial version.
//    11/30/11 - 632642 - Updated supported devices and corresponding IDCODES.
// End Revision

`timescale 1 ps/1 ps

module JTAG_SIME2( TDO, TCK, TDI, TMS);


  output TDO;

  input TCK, TDI, TMS;
   

  parameter PART_NAME = "7A8";

endmodule // JTAG_SIME2
