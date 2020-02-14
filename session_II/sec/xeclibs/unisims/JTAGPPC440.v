///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /
// /___/   /\     Filename : JTAGPPC440.v
// \   \  /  \    Timestamp : Mon Nov 12 16:23:43 PDT 2007
//  \___\/\___\
//
// Revision:
//    11/12/07 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module JTAGPPC440 (
        TCK,
        TDIPPC,
        TMS,
        TDOPPC
);

output TCK;
output TDIPPC;
output TMS;

input TDOPPC;

endmodule
