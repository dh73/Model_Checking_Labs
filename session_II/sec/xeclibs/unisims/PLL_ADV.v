// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/PLL_ADV.v,v 1.7 2011/03/23 22:26:25 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.i (O.50)
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Phase Lock Loop Clock
// /___/   /\     Filename : PLL_ADV.v
// \   \  /  \    Timestamp : Thu Mar 25 16:44:07 PST 2004
//  \___\/\___\
//
// Revision:
//    10/02/08 - Initial version.
// End Revision


`timescale  1 ps / 1 ps


module PLL_ADV (
        CLKFBDCM,
        CLKFBOUT,
        CLKOUT0,
        CLKOUT1,
        CLKOUT2,
        CLKOUT3,
        CLKOUT4,
        CLKOUT5,
        CLKOUTDCM0,
        CLKOUTDCM1,
        CLKOUTDCM2,
        CLKOUTDCM3,
        CLKOUTDCM4,
        CLKOUTDCM5,
        DO,
        DRDY,
        LOCKED,
        CLKFBIN,
        CLKIN1,
        CLKIN2,
        CLKINSEL,
        DADDR,
        DCLK,
        DEN,
        DI,
        DWE,
        REL,
        RST
);

parameter BANDWIDTH = "OPTIMIZED";
parameter CLK_FEEDBACK = "CLKFBOUT";
parameter CLKFBOUT_DESKEW_ADJUST = "NONE";
parameter CLKOUT0_DESKEW_ADJUST = "NONE";
parameter CLKOUT1_DESKEW_ADJUST = "NONE";
parameter CLKOUT2_DESKEW_ADJUST = "NONE";
parameter CLKOUT3_DESKEW_ADJUST = "NONE";
parameter CLKOUT4_DESKEW_ADJUST = "NONE";
parameter CLKOUT5_DESKEW_ADJUST = "NONE";
parameter integer CLKFBOUT_MULT = 1;
parameter real CLKFBOUT_PHASE = 0.0;
parameter real CLKIN1_PERIOD = 0.000;
parameter real CLKIN2_PERIOD = 0.000;
parameter integer CLKOUT0_DIVIDE = 1;
parameter real CLKOUT0_DUTY_CYCLE = 0.5;
parameter real CLKOUT0_PHASE = 0.0;
parameter integer CLKOUT1_DIVIDE = 1;
parameter real CLKOUT1_DUTY_CYCLE = 0.5;
parameter real CLKOUT1_PHASE = 0.0;
parameter integer CLKOUT2_DIVIDE = 1;
parameter real CLKOUT2_DUTY_CYCLE = 0.5;
parameter real CLKOUT2_PHASE = 0.0;
parameter integer CLKOUT3_DIVIDE = 1;
parameter real CLKOUT3_DUTY_CYCLE = 0.5;
parameter real CLKOUT3_PHASE = 0.0;
parameter integer CLKOUT4_DIVIDE = 1;
parameter real CLKOUT4_DUTY_CYCLE = 0.5;
parameter real CLKOUT4_PHASE = 0.0;
parameter integer CLKOUT5_DIVIDE = 1;
parameter real CLKOUT5_DUTY_CYCLE = 0.5;
parameter real CLKOUT5_PHASE = 0.0;
parameter COMPENSATION = "SYSTEM_SYNCHRONOUS";
parameter integer DIVCLK_DIVIDE = 1;
parameter EN_REL = "FALSE";
parameter PLL_PMCD_MODE = "FALSE";
parameter real REF_JITTER = 0.100;
parameter RESET_ON_LOSS_OF_LOCK = "FALSE";
parameter RST_DEASSERT_CLK = "CLKIN1";
parameter SIM_DEVICE = "VIRTEX5";


output CLKFBDCM;
output CLKFBOUT;
output CLKOUT0;
output CLKOUT1;
output CLKOUT2;
output CLKOUT3;
output CLKOUT4;
output CLKOUT5;
output CLKOUTDCM0;
output CLKOUTDCM1;
output CLKOUTDCM2;
output CLKOUTDCM3;
output CLKOUTDCM4;
output CLKOUTDCM5;
output DRDY;
output LOCKED;
output [15:0] DO;

input CLKFBIN;
input CLKIN1;
input CLKIN2;
input CLKINSEL;
input DCLK;
input DEN;
input DWE;
input REL;
input RST;
input [15:0] DI;
input [4:0] DADDR;

endmodule
