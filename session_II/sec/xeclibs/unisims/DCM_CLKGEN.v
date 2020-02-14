// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/DCM_CLKGEN.v,v 1.4 2009/09/02 19:42:58 vandanad Exp $
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
// /___/   /\     Filename : DCM_CLKGEN.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module DCM_CLKGEN (
  CLKFX,
  CLKFX180,
  CLKFXDV,
  LOCKED,
  PROGDONE,
  STATUS,
  CLKIN,
  FREEZEDCM,
  PROGCLK,
  PROGDATA,
  PROGEN,
  RST
);

  parameter SPREAD_SPECTRUM = "NONE";
  parameter STARTUP_WAIT = "FALSE";
  parameter integer CLKFXDV_DIVIDE = 2;
  parameter integer CLKFX_DIVIDE = 1;
  parameter integer CLKFX_MULTIPLY = 4;
  parameter real CLKFX_MD_MAX = 0.0;
  parameter real CLKIN_PERIOD = 0.0;
  

  output CLKFX180;
  output CLKFX;
  output CLKFXDV;
  output LOCKED;
  output PROGDONE;
  output [2:1] STATUS;

  input CLKIN;
  input FREEZEDCM;
  input PROGCLK;
  input PROGDATA;
  input PROGEN;
  input RST;

endmodule

