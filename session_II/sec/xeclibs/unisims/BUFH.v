///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  H Clock Buffer
// /___/   /\     Filename : BUFH.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/08/08 - Initial version.
//    09//9/08 - Change to use BUFHCE according to yaml.
//    11/11/08 - Change to not use BUFHCE.
// End Revision

`timescale  1 ps / 1 ps


module BUFH (O, I);

    output O;

    input  I;


    buf B1 (O, I);

endmodule

