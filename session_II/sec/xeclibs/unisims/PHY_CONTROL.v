// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/PHY_CONTROL.v,v 1.3 2011/05/05 16:54:23 vandanad Exp $
///////////////////////////////////////////////////////
//  Copyright (c) 2009 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version : 10.1
//  \  \           Description : Xilinx Formal Library Component
//  /  /                         Fujisan Phaser Phy Control
// /__/   /\       Filename    : PHY_CONTROL.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Date:     Comment:
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module PHY_CONTROL (
  AUXOUTPUT,
  INBURSTPENDING,
  INRANKA,
  INRANKB,
  INRANKC,
  INRANKD,
  OUTBURSTPENDING,
  PCENABLECALIB,
  PHYCTLALMOSTFULL,
  PHYCTLEMPTY,
  PHYCTLFULL,
  PHYCTLREADY,

  MEMREFCLK,
  PHYCLK,
  PHYCTLMSTREMPTY,
  PHYCTLWD,
  PHYCTLWRENABLE,
  PLLLOCK,
  READCALIBENABLE,
  REFDLLLOCK,
  RESET,
  SYNCIN,
  WRITECALIBENABLE
);

  parameter integer AO_TOGGLE = 0;
  parameter [3:0] AO_WRLVL_EN = 4'b0000;
  parameter BURST_MODE = "FALSE";
  parameter integer CLK_RATIO = 1;
  parameter integer CMD_OFFSET = 0;
  parameter integer CO_DURATION = 0;
  parameter DATA_CTL_A_N = "FALSE";
  parameter DATA_CTL_B_N = "FALSE";
  parameter DATA_CTL_C_N = "FALSE";
  parameter DATA_CTL_D_N = "FALSE";
  parameter DISABLE_SEQ_MATCH = "TRUE";
  parameter integer DI_DURATION = 0;
  parameter integer DO_DURATION = 0;
  parameter integer EVENTS_DELAY = 63;
  parameter integer FOUR_WINDOW_CLOCKS = 63;
  parameter MULTI_REGION = "FALSE";
  parameter PHY_COUNT_ENABLE = "FALSE";
  parameter integer RD_CMD_OFFSET_0 = 0;
  parameter integer RD_CMD_OFFSET_1 = 00;
  parameter integer RD_CMD_OFFSET_2 = 0;
  parameter integer RD_CMD_OFFSET_3 = 0;
  parameter integer RD_DURATION_0 = 0;
  parameter integer RD_DURATION_1 = 0;
  parameter integer RD_DURATION_2 = 0;
  parameter integer RD_DURATION_3 = 0;
  parameter SYNC_MODE = "FALSE";
  parameter integer WR_CMD_OFFSET_0 = 0;
  parameter integer WR_CMD_OFFSET_1 = 0;
  parameter integer WR_CMD_OFFSET_2 = 0;
  parameter integer WR_CMD_OFFSET_3 = 0;
  parameter integer WR_DURATION_0 = 0;
  parameter integer WR_DURATION_1 = 0;
  parameter integer WR_DURATION_2 = 0;
  parameter integer WR_DURATION_3 = 0;
  
  output PHYCTLALMOSTFULL;
  output PHYCTLEMPTY;
  output PHYCTLFULL;
  output PHYCTLREADY;
  output [1:0] INRANKA;
  output [1:0] INRANKB;
  output [1:0] INRANKC;
  output [1:0] INRANKD;
  output [1:0] PCENABLECALIB;
  output [3:0] AUXOUTPUT;
  output [3:0] INBURSTPENDING;
  output [3:0] OUTBURSTPENDING;

  input MEMREFCLK;
  input PHYCLK;
  input PHYCTLMSTREMPTY;
  input PHYCTLWRENABLE;
  input PLLLOCK;
  input READCALIBENABLE;
  input REFDLLLOCK;
  input RESET;
  input SYNCIN;
  input WRITECALIBENABLE;
  input [31:0] PHYCTLWD;

endmodule // PHY_CONTROL
