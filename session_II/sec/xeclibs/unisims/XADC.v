///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2005 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.i (O.6)
//  \   \         Description : Xilinx Formal Library Component
//  /   /                 System Monitor 
// /___/   /\     Filename  : XADC.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    12/09/09 - Initial version.
// End Revision


`timescale 1ps / 1ps

module XADC (
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
        MUXADDR,
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
output [7:0] ALM;
output [4:0] CHANNEL;
output [4:0] MUXADDR;

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
    parameter  [15:0] INIT_58 = 16'h0;
    parameter  [15:0] INIT_59 = 16'h0;
    parameter  [15:0] INIT_5A = 16'h0;
    parameter  [15:0] INIT_5B = 16'h0;
    parameter  [15:0] INIT_5C = 16'h0;
    parameter  [15:0] INIT_5D = 16'h0;
    parameter  [15:0] INIT_5E = 16'h0;
    parameter  [15:0] INIT_5F = 16'h0;
    parameter SIM_DEVICE = "7SERIES";
    parameter SIM_MONITOR_FILE = "design.txt";
    

   endmodule 
