// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/MMCME2_ADV.v,v 1.2 2011/12/01 19:28:04 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.i (M.60)
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Phase Lock Loop Clock
// /___/   /\     Filename : MMCME2_ADV.v
// \   \  /  \    Timestamp : 
//  \___\/\___\
//
// Revision:
//    07/07/08 - Initial version.
// End Revision


`timescale  1 ps / 1 ps


module MMCME2_ADV (
  CLKFBOUT,
  CLKFBOUTB,
  CLKFBSTOPPED,
  CLKINSTOPPED,
  CLKOUT0,
  CLKOUT0B,
  CLKOUT1,
  CLKOUT1B,
  CLKOUT2,
  CLKOUT2B,
  CLKOUT3,
  CLKOUT3B,
  CLKOUT4,
  CLKOUT5,
  CLKOUT6,
  DO,
  DRDY,
  LOCKED,
  PSDONE,
  CLKFBIN,
  CLKIN1,
  CLKIN2,
  CLKINSEL,
  DADDR,
  DCLK,
  DEN,
  DI,
  DWE,
  PSCLK,
  PSEN,
  PSINCDEC,
  PWRDWN,
  RST
);

  parameter BANDWIDTH = "OPTIMIZED";
  parameter CLKFBOUT_USE_FINE_PS = "FALSE";
  parameter CLKOUT0_USE_FINE_PS = "FALSE";
  parameter CLKOUT1_USE_FINE_PS = "FALSE";
  parameter CLKOUT2_USE_FINE_PS = "FALSE";
  parameter CLKOUT3_USE_FINE_PS = "FALSE";
  parameter CLKOUT4_CASCADE = "FALSE";
  parameter CLKOUT4_USE_FINE_PS = "FALSE";
  parameter CLKOUT5_USE_FINE_PS = "FALSE";
  parameter CLKOUT6_USE_FINE_PS = "FALSE";
  parameter COMPENSATION = "ZHOLD";
  parameter STARTUP_WAIT = "FALSE";
  parameter integer CLKOUT1_DIVIDE = 1;
  parameter integer CLKOUT2_DIVIDE = 1;
  parameter integer CLKOUT3_DIVIDE = 1;
  parameter integer CLKOUT4_DIVIDE = 1;
  parameter integer CLKOUT5_DIVIDE = 1;
  parameter integer CLKOUT6_DIVIDE = 1;
  parameter integer DIVCLK_DIVIDE = 1;
  parameter real CLKFBOUT_MULT_F = 5.000;
  parameter real CLKFBOUT_PHASE = 0.000;
  parameter real CLKIN1_PERIOD = 0.000;
  parameter real CLKIN2_PERIOD = 0.000;
  parameter real CLKOUT0_DIVIDE_F = 1.000;
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
  parameter real CLKOUT6_DUTY_CYCLE = 0.500;
  parameter real CLKOUT6_PHASE = 0.000;
  parameter real REF_JITTER1 = 0.010;
  parameter real REF_JITTER2 = 0.010;
  parameter SS_EN = "FALSE";
  parameter SS_MODE = "CENTER_HIGH";
  parameter integer SS_MOD_PERIOD = 10000;

  output CLKFBOUT;
  output CLKFBOUTB;
  output CLKFBSTOPPED;
  output CLKINSTOPPED;
  output CLKOUT0;
  output CLKOUT0B;
  output CLKOUT1;
  output CLKOUT1B;
  output CLKOUT2;
  output CLKOUT2B;
  output CLKOUT3;
  output CLKOUT3B;
  output CLKOUT4;
  output CLKOUT5;
  output CLKOUT6;
  output DRDY;
  output LOCKED;
  output PSDONE;
  output [15:0] DO;
                                                                                  
  input CLKFBIN;
  input CLKIN1;
  input CLKIN2;
  input CLKINSEL;
  input DCLK;
  input DEN;
  input DWE;
  input PSCLK;
  input PSEN;
  input PSINCDEC;
  input PWRDWN;
  input RST;
  input [15:0] DI;
  input [6:0] DADDR;

  
endmodule
