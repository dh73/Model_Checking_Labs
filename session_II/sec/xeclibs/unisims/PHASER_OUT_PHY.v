// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/PHASER_OUT_PHY.v,v 1.4 2012/03/08 17:53:09 vandanad Exp $
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
//  /  /                         Fujisan PHASER OUT
// /__/   /\       Filename    : PHASER_OUT_PHY.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Revision: Comment:
//  22APR2010 Initial UNI/UNP/SIM version from yaml
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module PHASER_OUT_PHY (
  COARSEOVERFLOW,
  COUNTERREADVAL,
  CTSBUS,
  DQSBUS,
  DTSBUS,
  FINEOVERFLOW,
  OCLK,
  OCLKDELAYED,
  OCLKDIV,
  OSERDESRST,
  RDENABLE,

  BURSTPENDINGPHY,
  COARSEENABLE,
  COARSEINC,
  COUNTERLOADEN,
  COUNTERLOADVAL,
  COUNTERREADEN,
  ENCALIBPHY,
  FINEENABLE,
  FINEINC,
  FREQREFCLK,
  MEMREFCLK,
  PHASEREFCLK,
  RST,
  SELFINEOCLKDELAY,
  SYNCIN,
  SYSCLK
);

  parameter integer CLKOUT_DIV = 4;
  parameter COARSE_BYPASS = "FALSE";
  parameter integer COARSE_DELAY = 0;
  parameter DATA_CTL_N = "FALSE";
  parameter DATA_RD_CYCLES = "FALSE";
  parameter integer FINE_DELAY = 0;
  parameter real MEMREFCLK_PERIOD = 0.000;
  parameter OCLKDELAY_INV = "FALSE";
  parameter integer OCLK_DELAY = 0;
  parameter OUTPUT_CLK_SRC = "PHASE_REF";
  parameter real PHASEREFCLK_PERIOD = 0.000;
  parameter [2:0] PO = 3'b000;
  parameter real REFCLK_PERIOD = 0.000;
  parameter SYNC_IN_DIV_RST = "FALSE";
  
  output COARSEOVERFLOW;
  output FINEOVERFLOW;
  output OCLK;
  output OCLKDELAYED;
  output OCLKDIV;
  output OSERDESRST;
  output RDENABLE;
  output [1:0] CTSBUS;
  output [1:0] DQSBUS;
  output [1:0] DTSBUS;
  output [8:0] COUNTERREADVAL;

  input BURSTPENDINGPHY;
  input COARSEENABLE;
  input COARSEINC;
  input COUNTERLOADEN;
  input COUNTERREADEN;
  input FINEENABLE;
  input FINEINC;
  input FREQREFCLK;
  input MEMREFCLK;
  input PHASEREFCLK;
  input RST;
  input SELFINEOCLKDELAY;
  input SYNCIN;
  input SYSCLK;
  input [1:0] ENCALIBPHY;
  input [8:0] COUNTERLOADVAL;

endmodule // PHASER_OUT_PHY
