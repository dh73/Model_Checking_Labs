// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IODELAY2.v,v 1.3 2009/08/22 00:32:34 harikr Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 11.1i (L.11)
//  \   \         Description : Xilinx Formal Library Component
//  /   /
// /___/   /\     Filename : IODELAY2.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module IODELAY2 (
  BUSY,
  DATAOUT,
  DATAOUT2,
  DOUT,
  TOUT,
  CAL,
  CE,
  CLK,
  IDATAIN,
  INC,
  IOCLK0,
  IOCLK1,
  ODATAIN,
  RST,
  T
);

  parameter COUNTER_WRAPAROUND = "WRAPAROUND"; // "WRAPAROUND", "STAY_AT_LIMIT"
  parameter DATA_RATE = "SDR";       // "SDR", "DDR"
  parameter DELAY_SRC = "IO";        // "IO", "IDATAIN", "ODATAIN"
  parameter integer IDELAY2_VALUE = 0;  // 0 to 255 inclusive
  parameter IDELAY_MODE = "NORMAL";  // "NORMAL", "PCI"
  parameter IDELAY_TYPE = "DEFAULT";    // "DEFAULT", "DIFF_PHASE_DETECTOR", "FIXED", "VARIABLE_FROM_HALF_MAX", "VARIABLE_FROM_ZERO"
  parameter integer IDELAY_VALUE = 0;   // 0 to 255 inclusive
  parameter integer ODELAY_VALUE = 0;   // 0 to 255 inclusive
  parameter SERDES_MODE = "NONE";       // "NONE", "MASTER", "SLAVE"
  parameter integer SIM_TAPDELAY_VALUE = 75; // 10 to 90 inclusive

  output BUSY;
  output DATAOUT2;
  output DATAOUT;
  output DOUT;
  output TOUT;

  input CAL;
  input CE;
  input CLK;
  input IDATAIN;
  input INC;
  input IOCLK0;
  input IOCLK1;
  input ODATAIN;
  input RST;
  input T;


 endmodule // IODELAY2
