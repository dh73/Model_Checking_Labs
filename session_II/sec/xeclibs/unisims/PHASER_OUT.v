// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/PHASER_OUT.v,v 1.4 2012/03/08 17:53:09 vandanad Exp $
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
// /__/   /\       Filename    : PHASER_OUT.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Revision: Comment:
//  22APR2010 Initial UNI/UNP/SIM version from yaml
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module PHASER_OUT (
  COARSEOVERFLOW,
  COUNTERREADVAL,
  FINEOVERFLOW,
  OCLK,
  OCLKDELAYED,
  OCLKDIV,
  OSERDESRST,

  COARSEENABLE,
  COARSEINC,
  COUNTERLOADEN,
  COUNTERLOADVAL,
  COUNTERREADEN,
  DIVIDERST,
  EDGEADV,
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
  parameter EN_OSERDES_RST = "FALSE";
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
  output [8:0] COUNTERREADVAL;

  input COARSEENABLE;
  input COARSEINC;
  input COUNTERLOADEN;
  input COUNTERREADEN;
  input DIVIDERST;
  input EDGEADV;
  input FINEENABLE;
  input FINEINC;
  input FREQREFCLK;
  input MEMREFCLK;
  input PHASEREFCLK;
  input RST;
  input SELFINEOCLKDELAY;
  input SYNCIN;
  input SYSCLK;
  input [8:0] COUNTERLOADVAL;

endmodule // PHASER_OUT
