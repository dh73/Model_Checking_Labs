// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BSCAN_SPARTAN6.v,v 1.3 2009/08/22 00:32:34 harikr Exp $
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
// /___/   /\     Filename : BSCAN_SPARTAN6.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module BSCAN_SPARTAN6 (CAPTURE, DRCK, RESET, RUNTEST, SEL, SHIFT, TCK, TDI, TMS, UPDATE, TDO);

    output CAPTURE, DRCK, RESET, RUNTEST, SEL, SHIFT, TCK, TDI, TMS, UPDATE;
    
    input TDO;

    parameter integer JTAG_CHAIN = 1;
    
endmodule
