// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BUFMR.v,v 1.1 2010/11/23 20:34:47 vandanad Exp $
///////////////////////////////////////////////////////
//  Copyright (c) 2009 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version     :  12.1
//  \  \           Description : 
//  /  /                      
// /__/   /\       Filename    : Xilinx Formal Library component - BUFMR.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Revision:		1.0
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module BUFMR (
  O,

  I
);

  output O;

  input I;


  buf B1 (O, I);

endmodule
