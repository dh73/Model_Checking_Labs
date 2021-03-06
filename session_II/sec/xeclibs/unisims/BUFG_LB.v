// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BUFG_LB.v,v 1.1 2011/11/23 18:50:19 vandanad Exp $
///////////////////////////////////////////////////////
//  Copyright (c) 2011 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version : 10.1
//  \  \           Description : 
//  /  /                      
// /__/   /\       Filename    : BUFG_LB.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Generated by :	/home/unified/patrickp/HEAD/env/Databases/CAEInterfaces/LibraryWriters/bin/ltw.pl
//  Revision:		1.0
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module BUFG_LB (
  CLKOUT,

  CLKIN
);


  output CLKOUT;

  input CLKIN;


  wire CLKOUT_OUT;

  wire CLKIN_IN;

  wire CLKIN_INDELAY;

  buf B_CLKOUT (CLKOUT, CLKIN);

endmodule
