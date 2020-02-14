// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BUFR.v,v 1.4 2010/11/23 20:37:36 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.i (O.14)
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Regional Clock Buffer
// /___/   /\     Filename : BUFR.v
// \   \  /  \    Timestamp : Thu Mar 25 16:43:43 PST 2004
//  \___\/\___\
//
// Revision:
//    03/23/04 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module BUFR (O, CE, CLR, I);

    output O;

    input CE;
    input CLR;
    input I;

    parameter BUFR_DIVIDE = "BYPASS";
    parameter SIM_DEVICE = "VIRTEX4";

    
endmodule // BUFR
