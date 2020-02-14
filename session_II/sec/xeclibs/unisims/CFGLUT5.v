// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/CFGLUT5.v,v 1.1 2007/05/02 17:26:43 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Formal Verification Library Component
//  /   /                  5-input Dynamically Reconfigurable Look-Up-Table with Carry and Clock Enable
// /___/   /\     Filename : CFGLUT5.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module CFGLUT5 (CDO, O5, O6, CDI, CE, CLK, I0, I1, I2, I3, I4);

    parameter INIT = 32'h00000000;
    output CDO;
    output O5;
    output O6;
    input  I4, I3, I2, I1, I0;
    input  CDI, CE, CLK;

endmodule
