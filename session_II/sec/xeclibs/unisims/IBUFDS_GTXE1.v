// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IBUFDS_GTXE1.v,v 1.3 2009/08/22 00:32:34 harikr Exp $
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
// /___/   /\     Filename : IBUFDS_GTXE1.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module IBUFDS_GTXE1 (O, ODIV2, CEB, I, IB);


    parameter CLKCM_CFG = "TRUE";
    parameter CLKRCV_TRST = "TRUE";
    parameter [9:0] REFCLKOUT_DLY = 10'b0000000000;

    output O; 
    output ODIV2; 

    input CEB; 
    input I; 
    input IB; 

endmodule // IBUFDS_GTXE1

