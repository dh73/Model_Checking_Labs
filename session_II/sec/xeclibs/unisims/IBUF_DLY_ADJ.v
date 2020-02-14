///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Dynamically Adjustable Input Delay Buffer
// /___/   /\     Filename : IBUF_DLY_ADJ.v
// \   \  /  \    Timestamp : Mon Nov 12 16:44:07 PST 2007
//  \___\/\___\
//
// Revision:
//    11/12/07 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module IBUF_DLY_ADJ (O, I, S);

    output O;

    input I;
    input [2:0] S;


    parameter DELAY_OFFSET = "OFF";
    parameter IOSTANDARD = "DEFAULT";    

endmodule // IBUF_DLY_ADJ

