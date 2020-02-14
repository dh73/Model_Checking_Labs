///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Source Synchronous Input Deserializer for Virtex7
// /___/   /\     Filename : ISERDESE2.v
// \   \  /  \    Timestamp : Tue Jan 19 16:29:39 PST 2010
//  \___\/\___\
//
// Revision:
//    01/19/10 - Initial version.
// End Revision
`timescale 1 ps / 1 ps 

module ISERDESE2 (
  O,
  Q1,
  Q2,
  Q3,
  Q4,
  Q5,
  Q6,
  Q7,
  Q8,
  SHIFTOUT1,
  SHIFTOUT2,

  BITSLIP,
  CE1,
  CE2,
  CLK,
  CLKB,
  CLKDIV,
  CLKDIVP,
  D,
  DDLY,
  DYNCLKDIVSEL,
  DYNCLKSEL,
  OCLK,
  OCLKB,
  OFB,
  RST,
  SHIFTIN1,
  SHIFTIN2
);

  parameter DATA_RATE = "DDR";
  parameter integer DATA_WIDTH = 4;
  parameter DYN_CLKDIV_INV_EN = "FALSE";
  parameter DYN_CLK_INV_EN = "FALSE";
  parameter [0:0] INIT_Q1 = 1'b0;
  parameter [0:0] INIT_Q2 = 1'b0;
  parameter [0:0] INIT_Q3 = 1'b0;
  parameter [0:0] INIT_Q4 = 1'b0;
  parameter INTERFACE_TYPE = "MEMORY";
  parameter IOBDELAY = "NONE";
  parameter integer NUM_CE = 2;
  parameter OFB_USED = "FALSE";
  parameter SERDES_MODE = "MASTER";
  parameter [0:0] SRVAL_Q1 = 1'b0;
  parameter [0:0] SRVAL_Q2 = 1'b0;
  parameter [0:0] SRVAL_Q3 = 1'b0;
  parameter [0:0] SRVAL_Q4 = 1'b0;

  output O;
  output Q1;
  output Q2;
  output Q3;
  output Q4;
  output Q5;
  output Q6;
  output Q7;
  output Q8;
  output SHIFTOUT1;
  output SHIFTOUT2;

  input BITSLIP;
  input CE1;
  input CE2;
  input CLK;
  input CLKB;
  input CLKDIV;
  input CLKDIVP;
  input D;
  input DDLY;
  input DYNCLKDIVSEL;
  input DYNCLKSEL;
  input OCLK;
  input OCLKB;
  input OFB;
  input RST;
  input SHIFTIN1;
  input SHIFTIN2;
  
 endmodule
