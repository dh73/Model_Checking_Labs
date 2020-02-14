///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  3-State Differential Signaling Output Buffer
// /___/   /\     Filename : OBUFTDS_DCIEN.v
// \   \  /  \    Timestamp : Thu Apr 29 14:59:30 PDT 2010
//  \___\/\___\
//
// Revision:
//    04/29/10 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module OBUFTDS_DCIEN (O, OB, DCITERMDISABLE, I, T);

    parameter IOSTANDARD = "DEFAULT";
    parameter SLEW = "SLOW";
   
    output O;
    output OB;

    input  DCITERMDISABLE;
    input  I;
    input  T;

    wire ts;

    or O1 (ts, T);
    bufif0 B1 (O, I, ts);
    notif0 N1 (OB, I, ts);

endmodule
