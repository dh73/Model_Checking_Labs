// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/STARTUP_VIRTEX6.v,v 1.3 2009/08/22 00:32:35 harikr Exp $
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
// /___/   /\     Filename : STARTUP_VIRTEX6.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module STARTUP_VIRTEX6 (
  CFGCLK,
  CFGMCLK,
  DINSPI,
  EOS,
  PREQ,
  TCKSPI,
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
  output DINSPI;
  output EOS;
  output PREQ;
  output TCKSPI;

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
