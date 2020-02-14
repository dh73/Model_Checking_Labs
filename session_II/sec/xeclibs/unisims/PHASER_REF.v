// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/PHASER_REF.v,v 1.2 2011/03/23 22:26:25 vandanad Exp $
///////////////////////////////////////////////////////
//  Copyright (c) 2010 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version     :  13.1
//  \  \           Description : Xilinx Formal Library Component
//  /  /                         Fujisan PHASER REF
// /__/   /\       Filename    : PHASER_REF.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Revision: Comment:
//  23APR2010 Initial UNI/UNP/SIM version from yml
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module PHASER_REF (
  LOCKED,

  CLKIN,
  PWRDWN,
  RST
);


  output LOCKED;

  input CLKIN;
  input PWRDWN;
  input RST;

endmodule // PHASER_REF
