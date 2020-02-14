// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ISERDES_NODELAY.v,v 1.3 2007/12/07 01:35:04 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Source Synchronous Input Deserializer without delay element
// /___/   /\     Filename : ISERDES_NODELAY.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module ISERDES_NODELAY (Q1, Q2, Q3, Q4, Q5, Q6, SHIFTOUT1, SHIFTOUT2,
		  BITSLIP, CE1, CE2, CLK, CLKB, CLKDIV, D, OCLK, RST, SHIFTIN1, SHIFTIN2);

    parameter BITSLIP_ENABLE = "FALSE";
    parameter DATA_RATE = "DDR";
    parameter DATA_WIDTH = 4;
    parameter INIT_Q1 = 1'b0;
    parameter INIT_Q2 = 1'b0;
    parameter INIT_Q3 = 1'b0;
    parameter INIT_Q4 = 1'b0;
    parameter INTERFACE_TYPE = "MEMORY";
    parameter NUM_CE = 2;
    parameter SERDES_MODE = "MASTER";

    output Q1;
    output Q2;
    output Q3;
    output Q4;
    output Q5;
    output Q6;
    output SHIFTOUT1;
    output SHIFTOUT2;

    input BITSLIP;
    input CE1;
    input CE2;
    input CLK;
    input CLKB;
    input CLKDIV;
    input D;
    input OCLK;
    input RST;
    input SHIFTIN1;
    input SHIFTIN2;

endmodule // ISERDES_NODELAY
