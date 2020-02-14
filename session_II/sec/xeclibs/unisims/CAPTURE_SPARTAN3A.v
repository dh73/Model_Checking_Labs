///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2007 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Register State Capture for Bitstream Readback for SPARTAN3A
// /___/   /\     Filename : CAPTURE_SPARTAN3A.v
// \   \  /  \    Timestamp : Mon Nov 12 14:45:00 PDT 2007
//  \___\/\___\
//
// Revision:
//    11/12/07 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module CAPTURE_SPARTAN3A (CAP, CLK);

    input  CAP, CLK;
    
    parameter ONESHOT = "TRUE";

endmodule
