///////////////////////////////////////////////////////
//  Copyright (c) 2008 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /     Vendor      : Xilinx 
// \  \    \/      Version     : 12.i (O.4)
//  \  \           Description : 
//  /  /                      
// /__/   /\       Filename    : Xilinx Formal Library Component - PLLE2_BASE.v
// \  \  /  \ 
//  \__\/\__ \                    
//                                 
//  Revision:		1.0
//    12/09/09 - Initial version 
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module PLLE2_BASE (
  CLKFBOUT,
  CLKOUT0,
  CLKOUT1,
  CLKOUT2,
  CLKOUT3,
  CLKOUT4,
  CLKOUT5,
  LOCKED,
  CLKFBIN,
  CLKIN1,
  PWRDWN,
  RST
);

  parameter BANDWIDTH = "OPTIMIZED";
  parameter integer CLKFBOUT_MULT = 5;
  parameter real CLKFBOUT_PHASE = 0.000;
  parameter real CLKIN1_PERIOD = 0.000;
  parameter integer CLKOUT0_DIVIDE = 1;
  parameter real CLKOUT0_DUTY_CYCLE = 0.500;
  parameter real CLKOUT0_PHASE = 0.000;
  parameter integer CLKOUT1_DIVIDE = 1;
  parameter real CLKOUT1_DUTY_CYCLE = 0.500;
  parameter real CLKOUT1_PHASE = 0.000;
  parameter integer CLKOUT2_DIVIDE = 1;
  parameter real CLKOUT2_DUTY_CYCLE = 0.500;
  parameter real CLKOUT2_PHASE = 0.000;
  parameter integer CLKOUT3_DIVIDE = 1;
  parameter real CLKOUT3_DUTY_CYCLE = 0.500;
  parameter real CLKOUT3_PHASE = 0.000;
  parameter integer CLKOUT4_DIVIDE = 1;
  parameter real CLKOUT4_DUTY_CYCLE = 0.500;
  parameter real CLKOUT4_PHASE = 0.000;
  parameter integer CLKOUT5_DIVIDE = 1;
  parameter real CLKOUT5_DUTY_CYCLE = 0.500;
  parameter real CLKOUT5_PHASE = 0.000;
  parameter integer DIVCLK_DIVIDE = 1;
  parameter real REF_JITTER1 = 0.010;
  parameter STARTUP_WAIT = "FALSE";

  output CLKFBOUT;
  output CLKOUT0;
  output CLKOUT1;
  output CLKOUT2;
  output CLKOUT3;
  output CLKOUT4;
  output CLKOUT5;
  output LOCKED;

  input CLKFBIN;
  input CLKIN1;
  input PWRDWN;
  input RST;

endmodule
