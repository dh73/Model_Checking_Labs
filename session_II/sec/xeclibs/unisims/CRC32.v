// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/CRC32.v,v 1.1 2007/05/02 17:26:43 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Formal Verification Library Component
//  /   /                  Cyclic Redundancy Check 32-bit Input Simulation Model
// /___/   /\     Filename : CRC32.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module CRC32 (CRCOUT,
	      CRCCLK,
	      CRCDATAVALID,
	      CRCDATAWIDTH,
	      CRCIN,
	      CRCRESET
	      );

    parameter CRC_INIT = 32'hFFFFFFFF;
    output [31:0] CRCOUT;
    input CRCCLK;
    input CRCDATAVALID;
    input [2:0] CRCDATAWIDTH;
    input [31:0] CRCIN;
    input CRCRESET;

endmodule 
