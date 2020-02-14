///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2011 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.0
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Input Fixed or Variable Delay Element with Fine Adjustment.
// /___/   /\     Filename : IDELAYE2_FINEDELAY.v
// \   \  /  \    Timestamp : Tue Feb 15 15:52:17 PST 2011
//  \___\/\___\
//
// Revision:
//    02/15/11 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module IDELAYE2_FINEDELAY (
  CNTVALUEOUT,
  DATAOUT,

  C,
  CE,
  CINVCTRL,
  CNTVALUEIN,
  DATAIN,
  IDATAIN,
  IFDLY,
  INC,
  LD,
  LDPIPEEN,
  REGRST
);

    parameter CINVCTRL_SEL = "FALSE";
    parameter DELAY_SRC = "IDATAIN";
    parameter FINEDELAY = "BYPASS";
    parameter HIGH_PERFORMANCE_MODE    = "FALSE";
    parameter IDELAY_TYPE  = "FIXED";
    parameter integer IDELAY_VALUE = 0;
    parameter PIPE_SEL = "FALSE";
    parameter real REFCLK_FREQUENCY = 200.0;
    parameter SIGNAL_PATTERN    = "DATA";

    output [4:0] CNTVALUEOUT;
    output DATAOUT;

    input C;
    input CE;
    input CINVCTRL;
    input [4:0] CNTVALUEIN;
    input DATAIN;
    input IDATAIN;
    input [2:0] IFDLY;
    input INC;
    input LD;
    input LDPIPEEN;
    input REGRST;


endmodule // IDELAYE2_FINEDELAY
