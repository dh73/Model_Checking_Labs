// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IODRP2.v,v 1.3 2009/08/22 00:32:34 harikr Exp $
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
// /___/   /\     Filename : IODRP2.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module IODRP2 (
  DATAOUT,
  DATAOUT2,
  DOUT,
  SDO,
  TOUT,
  ADD,
  BKST,
  CLK,
  CS,
  IDATAIN,
  IOCLK0,
  IOCLK1,
  ODATAIN,
  SDI,
  T
);

  parameter DATA_RATE = "SDR";       // "SDR", "DDR"
  parameter integer SIM_TAPDELAY_VALUE = 75; // 10 to 90 inclusive

  output DATAOUT2;
  output DATAOUT;
  output DOUT;
  output SDO;
  output TOUT;

  input ADD;
  input BKST;
  input CLK;
  input CS;
  input IDATAIN;
  input IOCLK0;
  input IOCLK1;
  input ODATAIN;
  input SDI;
  input T;

  endmodule // IODRP2
