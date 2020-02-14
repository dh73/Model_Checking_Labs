// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FIFO18_36.v,v 1.3 2008/08/11 22:17:43 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Formal Verification Library Component
//  /   /                  18K-Bit FIFO
// /___/   /\     Filename : FIFO18_36.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale 1 ps/1 ps

module FIFO18_36 (ALMOSTEMPTY, ALMOSTFULL, DO, DOP, EMPTY, FULL, RDCOUNT, RDERR, WRCOUNT, WRERR,
		  DI, DIP, RDCLK, RDEN, RST, WRCLK, WREN);

    parameter ALMOST_EMPTY_OFFSET = 9'h080;
    parameter ALMOST_FULL_OFFSET = 9'h080;
    parameter DO_REG = 1;
    parameter EN_SYN = "FALSE";
    parameter FIRST_WORD_FALL_THROUGH = "FALSE";
    parameter SIM_MODE = "SAFE";
    output ALMOSTEMPTY;
    output ALMOSTFULL;
    output [31:0] DO;
    output [3:0] DOP;
    output EMPTY;
    output FULL;
    output [8:0] RDCOUNT;
    output RDERR;
    output [8:0] WRCOUNT;
    output WRERR;
    input [31:0] DI;
    input [3:0] DIP;
    input RDCLK;
    input RDEN;
    input RST;
    input WRCLK;
    input WREN;

endmodule // FIFO18_36
