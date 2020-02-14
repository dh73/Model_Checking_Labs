// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IODRP2_MCB.v,v 1.3 2009/08/22 00:32:34 harikr Exp $
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
// /___/   /\     Filename : IODRP2_MCB.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module IODRP2_MCB (
  AUXSDO,
  DATAOUT,
  DATAOUT2,
  DOUT,
  DQSOUTN,
  DQSOUTP,
  SDO,
  TOUT,
  ADD,
  AUXADDR,
  AUXSDOIN,
  BKST,
  CLK,
  CS,
  IDATAIN,
  IOCLK0,
  IOCLK1,
  MEMUPDATE,
  ODATAIN,
  SDI,
  T
);

  parameter DATA_RATE = "SDR";       // "SDR", "DDR"
  parameter integer IDELAY_VALUE = 0;   // 0 to 255 inclusive
  parameter integer MCB_ADDRESS = 0; // 0 to 15
  parameter integer ODELAY_VALUE = 0;   // 0 to 255 inclusive
  parameter SERDES_MODE = "NONE";       // "NONE", "MASTER", "SLAVE"
  parameter integer SIM_TAPDELAY_VALUE = 75; // 10 to 90 inclusive

  output AUXSDO;
  output DATAOUT2;
  output DATAOUT;
  output DOUT;
  output DQSOUTN;
  output DQSOUTP;
  output SDO;
  output TOUT;

  input ADD;
  input AUXSDOIN;
  input BKST;
  input CLK;
  input CS;
  input IDATAIN;
  input IOCLK0;
  input IOCLK1;
  input MEMUPDATE;
  input ODATAIN;
  input SDI;
  input T;
  input [4:0] AUXADDR;

 endmodule // IODRP2_MCB
