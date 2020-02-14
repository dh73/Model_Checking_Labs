///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Latch used as 2-input OR Gate
// /___/   /\     Filename : OR2L.v
// \   \  /  \    Timestamp : Tue Feb 26 11:11:42 PST 2008
//  \___\/\___\
//
// Revision:
//    02/26/08 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module OR2L (O, DI, SRI);

    output O;

    input  SRI, DI;
    
    wire o_out;

    assign O = o_out;
    or O1 (o_out, SRI, DI);

endmodule
