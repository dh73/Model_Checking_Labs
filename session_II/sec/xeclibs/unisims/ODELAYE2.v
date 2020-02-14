///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.0
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Onput Fixed or Variable Delay Element.
// /___/   /\     Filename : ODELAYE2.v
// \   \  /  \    Timestamp : Mon Sep 21 08:48:13 PDT 2009
//  \___\/\___\
//
// Revision:
//    09/21/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module ODELAYE2 (CNTVALUEOUT, DATAOUT, C, CE, CINVCTRL, CLKIN, CNTVALUEIN, INC, LD, LDPIPEEN, ODATAIN, REGRST);

    parameter CINVCTRL_SEL = "FALSE";
    parameter DELAY_SRC = "ODATAIN";
    parameter HIGH_PERFORMANCE_MODE    = "TRUE";
    parameter ODELAY_TYPE  = "FIXED";
    parameter integer ODELAY_VALUE = 0;
    parameter PIPE_SEL = "FALSE";
    parameter real REFCLK_FREQUENCY = 200.0;
    parameter SIGNAL_PATTERN    = "DATA";

    output [4:0] CNTVALUEOUT;
    output DATAOUT;

    input C;
    input CE;
    input CINVCTRL;
    input CLKIN;
    input [4:0] CNTVALUEIN;
    input INC;
    input LD;
    input LDPIPEEN;
    input ODATAIN;
    input REGRST;


endmodule // ODELAYE2

