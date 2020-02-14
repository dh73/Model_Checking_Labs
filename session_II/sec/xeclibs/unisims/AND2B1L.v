///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Latch used as 2-input AND Gate
// /___/   /\     Filename : AND2B1L.v
// \   \  /  \    Timestamp : Tue Feb 26 11:11:42 PST 2008
//  \___\/\___\
//
// Revision:
//    04/01/08 - Initial version.
//    04/14/09 - Invert SRI not DI (CR517897)
// End Revision

`timescale  1 ps / 1 ps

module AND2B1L (O,  DI, SRI);

   output O;
   input  SRI, DI;

    wire o_out, sri_b;


    assign O =  o_out;

    not A0 (sri_b, SRI);
    and A1 (o_out, sri_b, DI);

endmodule
