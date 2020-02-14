// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BUFMRCE.v,v 1.1 2010/11/23 20:34:47 vandanad Exp $
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
// /__/   /\       Filename    : Xilinx Formal Library Component - BUFMRCE.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Revision:		1.0
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module BUFMRCE (
  O,

  CE,
  I
);

  parameter CE_TYPE = "SYNC";
  parameter integer INIT_OUT = 0;


  output O;

  input CE;
  input I;

  wire   NCE, o_bufg_o, o_bufg1_o;

  BUFGMUX #(.CLK_SEL_TYPE(CE_TYPE))
      B1 (.I0(I),
        .I1(1'b0),
        .O(o_bufg_o),
        .S(NCE));


    INV I1 (.I(CE),
        .O(NCE));

    BUFGMUX_1 #(.CLK_SEL_TYPE(CE_TYPE))
     B2 (.I0(I),
        .I1(1'b1),
        .O(o_bufg1_o),
        .S(NCE));

    assign O = (INIT_OUT == 1) ? o_bufg1_o : o_bufg_o;


endmodule
