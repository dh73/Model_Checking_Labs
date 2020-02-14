///////////////////////////////////////////////////////
//  Copyright (c) 2012 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version : 13.1
//  \  \           Description : 
//  /  /                      
// /__/   /\       Filename    : GTPE2_COMMON.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Revision:		1.0
// 06/02/11 - Initial version
// 09/27/11 - 626008 - YML updated
// 10/24/11 - 630158 - Add message
// 01/04/12 - 640449 - YML update
// 02/01/12 - 641156 - complete GTPE2 wrapper
// 11/14/12 - 686589 - GTPE2 YML update
/////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module GTPE2_COMMON (
  DMONITOROUT,
  DRPDO,
  DRPRDY,
  PLL0FBCLKLOST,
  PLL0LOCK,
  PLL0OUTCLK,
  PLL0OUTREFCLK,
  PLL0REFCLKLOST,
  PLL1FBCLKLOST,
  PLL1LOCK,
  PLL1OUTCLK,
  PLL1OUTREFCLK,
  PLL1REFCLKLOST,
  PMARSVDOUT,
  REFCLKOUTMONITOR0,
  REFCLKOUTMONITOR1,

  BGBYPASSB,
  BGMONITORENB,
  BGPDB,
  BGRCALOVRD,
  BGRCALOVRDENB,
  DRPADDR,
  DRPCLK,
  DRPDI,
  DRPEN,
  DRPWE,
  GTEASTREFCLK0,
  GTEASTREFCLK1,
  GTGREFCLK0,
  GTGREFCLK1,
  GTREFCLK0,
  GTREFCLK1,
  GTWESTREFCLK0,
  GTWESTREFCLK1,
  PLL0LOCKDETCLK,
  PLL0LOCKEN,
  PLL0PD,
  PLL0REFCLKSEL,
  PLL0RESET,
  PLL1LOCKDETCLK,
  PLL1LOCKEN,
  PLL1PD,
  PLL1REFCLKSEL,
  PLL1RESET,
  PLLRSVD1,
  PLLRSVD2,
  PMARSVD,
  RCALENB
);

  parameter [63:0] BIAS_CFG = 64'h0000000000000000;
  parameter [31:0] COMMON_CFG = 32'h00000000;
  parameter [26:0] PLL0_CFG = 27'h01F03DC;
  parameter [0:0] PLL0_DMON_CFG = 1'b0;
  parameter integer PLL0_FBDIV = 4;
  parameter integer PLL0_FBDIV_45 = 5;
  parameter [23:0] PLL0_INIT_CFG = 24'h00001E;
  parameter [8:0] PLL0_LOCK_CFG = 9'h1E8;
  parameter integer PLL0_REFCLK_DIV = 1;
  parameter [26:0] PLL1_CFG = 27'h01F03DC;
  parameter [0:0] PLL1_DMON_CFG = 1'b0;
  parameter integer PLL1_FBDIV = 4;
  parameter integer PLL1_FBDIV_45 = 5;
  parameter [23:0] PLL1_INIT_CFG = 24'h00001E;
  parameter [8:0] PLL1_LOCK_CFG = 9'h1E8;
  parameter integer PLL1_REFCLK_DIV = 1;
  parameter [7:0] PLL_CLKOUT_CFG = 8'b00000000;
  parameter [15:0] RSVD_ATTR0 = 16'h0000;
  parameter [15:0] RSVD_ATTR1 = 16'h0000;
  parameter [2:0] SIM_PLL0REFCLK_SEL = 3'b001;
  parameter [2:0] SIM_PLL1REFCLK_SEL = 3'b001;
  parameter SIM_RESET_SPEEDUP = "TRUE";
  parameter SIM_VERSION = "1.0";
  

  output DRPRDY;
  output PLL0FBCLKLOST;
  output PLL0LOCK;
  output PLL0OUTCLK;
  output PLL0OUTREFCLK;
  output PLL0REFCLKLOST;
  output PLL1FBCLKLOST;
  output PLL1LOCK;
  output PLL1OUTCLK;
  output PLL1OUTREFCLK;
  output PLL1REFCLKLOST;
  output REFCLKOUTMONITOR0;
  output REFCLKOUTMONITOR1;
  output [15:0] DRPDO;
  output [15:0] PMARSVDOUT;
  output [7:0] DMONITOROUT;

  input BGBYPASSB;
  input BGMONITORENB;
  input BGPDB;
  input BGRCALOVRDENB;
  input DRPCLK;
  input DRPEN;
  input DRPWE;
  input GTEASTREFCLK0;
  input GTEASTREFCLK1;
  input GTGREFCLK0;
  input GTGREFCLK1;
  input GTREFCLK0;
  input GTREFCLK1;
  input GTWESTREFCLK0;
  input GTWESTREFCLK1;
  input PLL0LOCKDETCLK;
  input PLL0LOCKEN;
  input PLL0PD;
  input PLL0RESET;
  input PLL1LOCKDETCLK;
  input PLL1LOCKEN;
  input PLL1PD;
  input PLL1RESET;
  input RCALENB;
  input [15:0] DRPDI;
  input [15:0] PLLRSVD1;
  input [2:0] PLL0REFCLKSEL;
  input [2:0] PLL1REFCLKSEL;
  input [4:0] BGRCALOVRD;
  input [4:0] PLLRSVD2;
  input [7:0] DRPADDR;
  input [7:0] PMARSVD;

endmodule
