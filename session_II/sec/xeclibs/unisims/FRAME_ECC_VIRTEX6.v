// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FRAME_ECC_VIRTEX6.v,v 1.4 2009/09/02 19:42:58 vandanad Exp $
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
// /___/   /\     Filename : FRAME_ECC_VIRTEX6.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module FRAME_ECC_VIRTEX6 (
  CRCERROR,
  ECCERROR,
  ECCERRORSINGLE,
  FAR,
  SYNBIT,
  SYNDROME,
  SYNDROMEVALID,
  SYNWORD
);
  parameter FARSRC = "EFAR";
  parameter FRAME_RBT_IN_FILENAME = "frame_rbt_v6.txt";

  output CRCERROR;
  output ECCERROR;
  output ECCERRORSINGLE;
  output SYNDROMEVALID;
  output [12:0] SYNDROME;
  output [23:0] FAR;
  output [4:0] SYNBIT;
  output [6:0] SYNWORD;


endmodule
