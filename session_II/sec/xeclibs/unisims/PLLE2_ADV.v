// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/PLLE2_ADV.v,v 1.1 2010/11/23 20:34:48 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.i (O.13)
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Phase Lock Loop Clock
// /___/   /\     Filename : PLLE2_ADV.v
// \   \  /  \    Timestamp : 
//  \___\/\___\
//
// Revision:
//    12/09/09 - Initial version.
// End Revision


`timescale  1 ps / 1 ps

module PLLE2_ADV (
  CLKFBOUT,
  CLKOUT0,
  CLKOUT1,
  CLKOUT2,
  CLKOUT3,
  CLKOUT4,
  CLKOUT5,
  DO,
  DRDY,
  LOCKED,
  CLKFBIN,
  CLKIN1,
  CLKIN2,
  CLKINSEL,
  DADDR,
  DCLK,
  DEN,
  DI,
  DWE,
  PWRDWN,
  RST
);
  parameter BANDWIDTH = "OPTIMIZED";
  parameter COMPENSATION = "ZHOLD";
  parameter STARTUP_WAIT = "FALSE";
  parameter integer CLKOUT0_DIVIDE = 1;
  parameter integer CLKOUT1_DIVIDE = 1;
  parameter integer CLKOUT2_DIVIDE = 1;
  parameter integer CLKOUT3_DIVIDE = 1;
  parameter integer CLKOUT4_DIVIDE = 1;
  parameter integer CLKOUT5_DIVIDE = 1;
  parameter integer DIVCLK_DIVIDE = 1;
  parameter integer CLKFBOUT_MULT = 5;
  parameter real CLKFBOUT_PHASE = 0.000;
  parameter real CLKIN1_PERIOD = 0.000;
  parameter real CLKIN2_PERIOD = 0.000;
  parameter real CLKOUT0_DUTY_CYCLE = 0.500;
  parameter real CLKOUT0_PHASE = 0.000;
  parameter real CLKOUT1_DUTY_CYCLE = 0.500;
  parameter real CLKOUT1_PHASE = 0.000;
  parameter real CLKOUT2_DUTY_CYCLE = 0.500;
  parameter real CLKOUT2_PHASE = 0.000;
  parameter real CLKOUT3_DUTY_CYCLE = 0.500;
  parameter real CLKOUT3_PHASE = 0.000;
  parameter real CLKOUT4_DUTY_CYCLE = 0.500;
  parameter real CLKOUT4_PHASE = 0.000;
  parameter real CLKOUT5_DUTY_CYCLE = 0.500;
  parameter real CLKOUT5_PHASE = 0.000;
  parameter real REF_JITTER1 = 0.010;
  parameter real REF_JITTER2 = 0.010;

  output CLKFBOUT;
  output CLKOUT0;
  output CLKOUT1;
  output CLKOUT2;
  output CLKOUT3;
  output CLKOUT4;
  output CLKOUT5;
  output DRDY;
  output LOCKED;
  output [15:0] DO;


  input CLKFBIN;
  input CLKIN1;
  input CLKIN2;
  input CLKINSEL;
  input DCLK;
  input DEN;
  input DWE;
  input PWRDWN;
  input RST;
  input [15:0] DI;
  input [6:0] DADDR;

endmodule
