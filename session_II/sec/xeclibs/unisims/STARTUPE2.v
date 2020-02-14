///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  User Interface to Global Clock, Reset and 3-State Controls
// /___/   /\     Filename : STARTUPE2.v
// \   \  /  \    Timestamp : Mon Mar  8 15:49:37 PST 2010
//  \___\/\___\
//
// Revision:
//    03/08/10 - Initial version.
// End Revision

`timescale 1 ps / 1 ps

module STARTUPE2 (
  CFGCLK,
  CFGMCLK,
  EOS,
  PREQ,

  CLK,
  GSR,
  GTS,
  KEYCLEARB,
  PACK,
  USRCCLKO,
  USRCCLKTS,
  USRDONEO,
  USRDONETS
);

  parameter PROG_USR = "FALSE";

  output CFGCLK;
  output CFGMCLK;
  output EOS;
  output PREQ;

  input CLK;
  input GSR;
  input GTS;
  input KEYCLEARB;
  input PACK;
  input USRCCLKO;
  input USRCCLKTS;
  input USRDONEO;
  input USRDONETS;

  
endmodule
