// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BSCAN_SPARTAN3A.v,v 1.2 2007/12/07 01:01:21 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Functional Formal Library Component
//  /   /                  Boundary Scan Logic Control Circuit for SPARTAN3A
// /___/   /\     Filename : BSCAN_SPARTAN3A.v
// \   \  /  \    Timestamp : Mon Nov 12 09:41:40 PDT 2007
//  \___\/\___\
//
// Revision:
// End Revision

`timescale  1 ps / 1 ps

module BSCAN_SPARTAN3A (CAPTURE, DRCK1, DRCK2, RESET, SEL1, SEL2, SHIFT, TCK, TDI, TMS, UPDATE, TDO1, TDO2);

    output CAPTURE, DRCK1, DRCK2, RESET, SEL1, SEL2, SHIFT, TCK, TDI, TMS, UPDATE;

    input TDO1, TDO2;



    pulldown (CAPTURE);
    pulldown (DRCK1);
    pulldown (DRCK2);
    pulldown (RESET);
    pulldown (SEL1);
    pulldown (SEL2);
    pulldown (SHIFT);
    pulldown (TCK);
    pulldown (TDI);
    pulldown (TMS);
    pulldown (UPDATE);

endmodule // BSCAN_SPARTAN3A
