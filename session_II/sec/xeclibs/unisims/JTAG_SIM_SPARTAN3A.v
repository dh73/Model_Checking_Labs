///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Jtag TAP Controler
// /___/   /\     Filename : JTAG_SIM_SPARTAN3A.v
// \   \  /  \    Timestamp : Mon Nov 12 16:18:11 PDT 2007
//  \___\/\___\
//
// Revision:
//    11/12/07 - Initial version.
// End Revision

`timescale 1 ps/1 ps

module JTAG_SIM_SPARTAN3A( TDO, TCK, TDI, TMS );


  output TDO;

  input TCK, TDI, TMS;
   

  parameter PART_NAME = "3S200A";

endmodule // JTAG_SIM_SPARTAN3A
