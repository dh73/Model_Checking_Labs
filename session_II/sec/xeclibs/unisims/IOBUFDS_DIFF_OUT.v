// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IOBUFDS_DIFF_OUT.v,v 1.4 2009/09/03 18:46:44 vandanad Exp $
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
// /___/   /\     Filename : IOBUFDS_DIFF_OUT.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module IOBUFDS_DIFF_OUT (O, OB, IO, IOB, I, TM, TS);

    parameter DIFF_TERM = "FALSE";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";

    output O;
    output OB;
    inout  IO;
    inout  IOB;
    input  I;
    input  TM;
    input  TS;

endmodule
