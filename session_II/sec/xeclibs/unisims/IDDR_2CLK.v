///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Input Dual Data-Rate Register with Dual Clock inputs
// /___/   /\     Filename : IDDR_2CLK.v
// \   \  /  \    Timestamp : Mon Nov 12 16:44:06 PST 2007
//  \___\/\___\
//
// Revision:
//    11/12/07 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module IDDR_2CLK (Q1, Q2, C, CB, CE, D, R, S);

    parameter DDR_CLK_EDGE = "OPPOSITE_EDGE";    
    parameter INIT_Q1 = 1'b0;
    parameter INIT_Q2 = 1'b0;
    parameter SRTYPE = "SYNC";

    output Q1;
    output Q2;
    
    input C;
    input CB;
    input CE;
    input D;
    input R;
    input S;

endmodule // IDDR_2CLK
