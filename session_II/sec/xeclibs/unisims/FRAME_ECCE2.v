// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FRAME_ECCE2.v,v 1.2 2011/09/07 23:47:48 vandanad Exp $
///////////////////////////////////////////////////////
//  Copyright (c) 2009 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version     : 13.i (O.7)
//  \  \           Description : 
//  /  /                      
// /__/   /\       Filename    : Xilinx Formal Library Component - FRAME_ECCE2.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Revision:		1.0
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module FRAME_ECCE2 (
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
  parameter FRAME_RBT_IN_FILENAME = "NONE";


  output CRCERROR;
  output ECCERROR;
  output ECCERRORSINGLE;
  output SYNDROMEVALID;
  output [12:0] SYNDROME;
  output [25:0] FAR;
  output [4:0] SYNBIT;
  output [6:0] SYNWORD;

  
endmodule 
