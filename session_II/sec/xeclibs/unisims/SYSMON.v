// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/SYSMON.v,v 1.5 2009/08/22 00:32:35 harikr Exp $
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
// /___/   /\     Filename : SYSMON.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision


`timescale 1ps / 1ps
//`define EOFile -1

module SYSMON (
        ALM,
        BUSY,
        CHANNEL,
        DO,
        DRDY,
        EOC,
        EOS,
        JTAGBUSY,
        JTAGLOCKED,
        JTAGMODIFIED,
        OT,
        CONVST,
        CONVSTCLK,
        DADDR,
        DCLK,
        DEN,
        DI,
        DWE,
        RESET,
        VAUXN,
        VAUXP,
        VN,
        VP

);

output BUSY;
output DRDY;
output EOC;
output EOS;
output JTAGBUSY;
output JTAGLOCKED;
output JTAGMODIFIED;
output OT;
output [15:0] DO;
output [2:0] ALM;
output [4:0] CHANNEL;

input CONVST;
input CONVSTCLK;
input DCLK;
input DEN;
input DWE;
input RESET;
input VN;
input VP;
input [15:0] DI;
input [15:0] VAUXN;
input [15:0] VAUXP;
input [6:0] DADDR;

    parameter  [15:0] INIT_40 = 16'h0;
    parameter  [15:0] INIT_41 = 16'h0;
    parameter  [15:0] INIT_42 = 16'h0800;
    parameter  [15:0] INIT_43 = 16'h0;
    parameter  [15:0] INIT_44 = 16'h0;
    parameter  [15:0] INIT_45 = 16'h0;
    parameter  [15:0] INIT_46 = 16'h0;
    parameter  [15:0] INIT_47 = 16'h0;
    parameter  [15:0] INIT_48 = 16'h0;
    parameter  [15:0] INIT_49 = 16'h0;
    parameter  [15:0] INIT_4A = 16'h0;
    parameter  [15:0] INIT_4B = 16'h0;
    parameter  [15:0] INIT_4C = 16'h0;
    parameter  [15:0] INIT_4D = 16'h0;
    parameter  [15:0] INIT_4E = 16'h0;
    parameter  [15:0] INIT_4F = 16'h0;
    parameter  [15:0] INIT_50 = 16'h0;
    parameter  [15:0] INIT_51 = 16'h0;
    parameter  [15:0] INIT_52 = 16'h0;
    parameter  [15:0] INIT_53 = 16'h0;
    parameter  [15:0] INIT_54 = 16'h0;
    parameter  [15:0] INIT_55 = 16'h0;
    parameter  [15:0] INIT_56 = 16'h0;
    parameter  [15:0] INIT_57 = 16'h0;
    parameter SIM_DEVICE = "VIRTEX5";
    parameter SIM_MONITOR_FILE = "design.txt";
    
endmodule 
