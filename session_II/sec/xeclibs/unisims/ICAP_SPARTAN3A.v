///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Internal Configuration Access Port for Spartan3a
// /___/   /\     Filename : ICAP_SPARTAN3A.v
// \   \  /  \    Timestamp : Mon Nov 12 18:29:19 PDT 2007
//  \___\/\___\
//
// Revision:
//    11/12/07 - Initial version.

`timescale  1 ps / 1 ps


module ICAP_SPARTAN3A (BUSY, O, CE, CLK, I, WRITE);

    output BUSY;
    output [7:0] O;

    input  CE, CLK, WRITE;
    input  [7:0] I; 
    
endmodule

