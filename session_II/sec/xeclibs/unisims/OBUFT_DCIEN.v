///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Formal Simulation Library Component
//  /   /                  3-State Output Buffer
// /___/   /\     Filename : OBUFT_DCIEN.v
// \   \  /  \    Timestamp : Thu Apr 29 14:59:30 PDT 2010
//  \___\/\___\
//
// Revision:
//    04/29/10 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module OBUFT_DCIEN (O, DCITERMDISABLE, I, T);

    parameter integer DRIVE = 12;
    parameter IOSTANDARD = "DEFAULT";
    parameter SLEW = "SLOW";

    output O;

    input  DCITERMDISABLE;
    input  I;
    input  T;

    wire ts;


    or O1 (ts,T);
    bufif0 T1 (O, I, ts);


endmodule

