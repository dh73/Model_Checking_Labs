// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OSERDES2.v,v 1.4 2009/09/03 18:46:44 vandanad Exp $
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
// /___/   /\     Filename : OSERDES2.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module OSERDES2 (
  OQ,
  SHIFTOUT1,
  SHIFTOUT2,
  SHIFTOUT3,
  SHIFTOUT4,
  TQ,
  CLK0,
  CLK1,
  CLKDIV,
  D1,
  D2,
  D3,
  D4,
  IOCE,
  OCE,
  RST,
  SHIFTIN1,
  SHIFTIN2,
  SHIFTIN3,
  SHIFTIN4,
  T1,
  T2,
  T3,
  T4,
  TCE,
  TRAIN
);

   parameter BYPASS_GCLK_FF = "FALSE"; // TRUE, FALSE
   parameter DATA_RATE_OQ = "DDR"; // SDR, DDR      | Data Rate setting
   parameter DATA_RATE_OT = "DDR"; // SDR, DDR, BUF | Tristate Rate setting.
   parameter integer DATA_WIDTH =   2; // {1..8} 
   parameter OUTPUT_MODE = "SINGLE_ENDED";  // SINGLE_ENDED, DIFFERENTIAL
   parameter SERDES_MODE = "NONE"; // NONE, MASTER, SLAVE
   parameter integer TRAIN_PATTERN =  0; // {0..15}             

   output OQ;
   output SHIFTOUT1;
   output SHIFTOUT2;
   output SHIFTOUT3;
   output SHIFTOUT4;
   output TQ;

   input  CLK0;
   input  CLK1;
   input  CLKDIV;
   input  D1;
   input  D2;
   input  D3;
   input  D4;
   input  IOCE;
   input  OCE;
   input  RST;
   input  SHIFTIN1;
   input  SHIFTIN2;
   input  SHIFTIN3;
   input  SHIFTIN4;
   input  T1;
   input  T2;
   input  T3;
   input  T4;
   input  TCE;
   input  TRAIN;

endmodule // OSERDES2
