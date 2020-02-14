// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BSCAN_VIRTEX5.v,v 1.2 2007/12/07 01:35:04 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Formal Verification Library Component
//  /   /                  Boundary Scan Logic Control Circuit for VIRTEX5
// /___/   /\     Filename : BSCAN_VIRTEX5.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module BSCAN_VIRTEX5 (CAPTURE, DRCK, RESET, SEL, SHIFT, TDI, UPDATE, TDO);

    parameter JTAG_CHAIN = 1;
    output CAPTURE, DRCK, RESET, SEL, SHIFT, TDI, UPDATE;
    input TDO;

    pulldown (DRCK);
    pulldown (RESET);
    pulldown (SEL);
    pulldown (SHIFT);
    pulldown (TDI);
    pulldown (UPDATE);

endmodule
