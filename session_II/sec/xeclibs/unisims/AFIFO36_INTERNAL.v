// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/AFIFO36_INTERNAL.v,v 1.1 2008/08/11 22:18:40 vandanad Exp $

`timescale 1 ps/1 ps

module AFIFO36_INTERNAL (ALMOSTEMPTY, ALMOSTFULL, DBITERR, DO, DOP, ECCPARITY, EMPTY, FULL, RDCOUNT, RDERR, SBITERR, WRCOUNT, WRERR,
			DI, DIP, RDCLK, RDEN, RDRCLK, RST, WRCLK, WREN);
 
    output ALMOSTEMPTY;
    output ALMOSTFULL;
    output DBITERR;
    output [63:0] DO;
    output [7:0] DOP;
    output [7:0] ECCPARITY;
    output EMPTY;
    output FULL;
    output [12:0] RDCOUNT;
    output RDERR;
    output SBITERR;
    output [12:0] WRCOUNT;
    output WRERR;

    input [63:0] DI;
    input [7:0] DIP;
    input RDCLK;
    input RDEN;
    input RDRCLK;
    input RST;
    input WRCLK;
    input WREN;

    parameter integer DATA_WIDTH = 4;
    parameter integer DO_REG = 1;
    parameter EN_SYN = "FALSE";
    parameter FIRST_WORD_FALL_THROUGH = "FALSE";
    parameter ALMOST_EMPTY_OFFSET = 13'h0080;
    parameter ALMOST_FULL_OFFSET = 13'h0080;
    parameter EN_ECC_WRITE = "FALSE";
    parameter EN_ECC_READ = "FALSE";
    parameter SIM_MODE = "SAFE";
    
    endmodule
