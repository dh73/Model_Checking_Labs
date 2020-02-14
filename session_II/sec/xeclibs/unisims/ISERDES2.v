// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ISERDES2.v,v 1.4 2009/09/02 19:42:58 vandanad Exp $
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
// /___/   /\     Filename : ISERDES2.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module ISERDES2 (
  CFB0,
  CFB1,
  DFB,
  FABRICOUT,
  INCDEC,
  Q1,
  Q2,
  Q3,
  Q4,
  SHIFTOUT,
  VALID,
  BITSLIP,
  CE0,
  CLK0,
  CLK1,
  CLKDIV,
  D,
  IOCE,
  RST,
  SHIFTIN
);

  parameter BITSLIP_ENABLE = "FALSE";      // TRUE, FALSE
  parameter DATA_RATE = "SDR";             // SDR, DDR      
  parameter integer DATA_WIDTH = 1;        // {1..8}
  parameter INTERFACE_TYPE = "NETWORKING"; // NETWORKING, NETWORKING_PIPELINED, RETIMED
  parameter SERDES_MODE = "NONE";        // NONE, MASTER, SLAVE 

  output CFB0;
  output CFB1;
  output DFB;
  output FABRICOUT;
  output INCDEC;
  output Q1;
  output Q2;
  output Q3;
  output Q4;
  output SHIFTOUT;
  output VALID;

  input BITSLIP;
  input CE0;
  input CLK0;
  input CLK1;
  input CLKDIV;
  input D;
  input IOCE;
  input RST;
  input SHIFTIN;

endmodule // ISERDES2
