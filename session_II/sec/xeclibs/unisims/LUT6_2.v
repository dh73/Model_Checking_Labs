// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/LUT6_2.v,v 1.5 2010/08/25 19:09:20 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  6-input Look-Up-Table with Two General Outputs
// /___/   /\     Filename : LUT6_2.v
// \   \  /  \    Timestamp : 
//  \___\/\___\
//
// Revision:
//    11/12/07 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module LUT6_2 (O5, O6, I0, I1, I2, I3, I4, I5);

  parameter INIT = 64'h0000000000000000;

  input I0, I1, I2, I3, I4, I5;

  output O5, O6;
  wire O_l, O_h;
  wire [63:0] init_reg;
  wire [31:0] init_l, init_h;

   assign init_reg = INIT;
   assign  init_l = init_reg[31:0];
   assign  init_h = init_reg[63:32];

   assign O5 = O_l;
   assign O6 = I5 ? O_h : O_l;

   assign O_l = init_l[{I4, I3, I2, I1, I0}];
   assign O_h = init_h[{I4, I3, I2, I1, I0}];

endmodule
