// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/PHASER_IN_PHY.v,v 1.5 2012/03/08 17:53:09 vandanad Exp $
///////////////////////////////////////////////////////
//  Copyright (c) 2010 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version : 10.1
//  \  \           Description : Xilinx Formal Library Component
//  /  /                         Fujisan PHASER IN
// /__/   /\       Filename    : PHASER_IN_PHY.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Revision: Comment:
//  22APR2010 Initial UNI/UNP/SIM version from yaml
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module PHASER_IN_PHY (
  COUNTERREADVAL,
  DQSFOUND,
  DQSOUTOFRANGE,
  FINEOVERFLOW,
  ICLK,
  ICLKDIV,
  ISERDESRST,
  PHASELOCKED,
  RCLK,
  WRENABLE,

  BURSTPENDINGPHY,
  COUNTERLOADEN,
  COUNTERLOADVAL,
  COUNTERREADEN,
  ENCALIBPHY,
  FINEENABLE,
  FINEINC,
  FREQREFCLK,
  MEMREFCLK,
  PHASEREFCLK,
  RANKSELPHY,
  RST,
  RSTDQSFIND,
  SYNCIN,
  SYSCLK
);

  parameter BURST_MODE = "FALSE";
  parameter integer CLKOUT_DIV = 4;
  parameter DQS_BIAS_MODE = "FALSE";
  parameter integer FINE_DELAY = 0;
  parameter FREQ_REF_DIV = "NONE";
  parameter real MEMREFCLK_PERIOD = 0.000;
  parameter OUTPUT_CLK_SRC = "PHASE_REF";
  parameter real PHASEREFCLK_PERIOD = 0.000;
  parameter real REFCLK_PERIOD = 0.000;
  parameter integer SEL_CLK_OFFSET = 5;
  parameter SYNC_IN_DIV_RST = "FALSE";
  parameter WR_CYCLES = "FALSE";
  

  output DQSFOUND;
  output DQSOUTOFRANGE;
  output FINEOVERFLOW;
  output ICLK;
  output ICLKDIV;
  output ISERDESRST;
  output PHASELOCKED;
  output RCLK;
  output WRENABLE;
  output [5:0] COUNTERREADVAL;

  input BURSTPENDINGPHY;
  input COUNTERLOADEN;
  input COUNTERREADEN;
  input FINEENABLE;
  input FINEINC;
  input FREQREFCLK;
  input MEMREFCLK;
  input PHASEREFCLK;
  input RST;
  input RSTDQSFIND;
  input SYNCIN;
  input SYSCLK;
  input [1:0] ENCALIBPHY;
  input [1:0] RANKSELPHY;
  input [5:0] COUNTERLOADVAL;

endmodule // PHASER_IN_PHY
