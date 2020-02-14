// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/JTAG_SIM_VIRTEX5.v,v 1.1 2007/05/02 17:32:12 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Formal Verification Library Component
//  /   /                  Jtag TAP Controler
// /___/   /\     Filename : JTAG_SIM_VIRTEX5.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale 1 ps/1 ps

module JTAG_SIM_VIRTEX5( TDO, TCK, TDI, TMS );

    parameter PART_NAME = "LX30";
    output TDO;
    input TCK, TDI, TMS;

endmodule // JTAG_SIM_VIRTEX5
