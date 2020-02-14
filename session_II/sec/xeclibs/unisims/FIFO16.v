// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FIFO16.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

`timescale 1 ps / 1 ps

module FIFO16 (ALMOSTEMPTY, ALMOSTFULL, DO, DOP, EMPTY, FULL, RDCOUNT, RDERR, WRCOUNT, WRERR, DI, DIP, RDCLK, RDEN, RST, WRCLK, WREN
);

    output ALMOSTEMPTY;
    output ALMOSTFULL;
    output [31:0] DO;
    output [3:0] DOP;
    output EMPTY;
    output FULL;
    output [11:0] RDCOUNT;
    output RDERR;
    output [11:0] WRCOUNT;
    output WRERR;
    input [31:0] DI;
    input [3:0] DIP;
    input RDCLK;
    input RDEN;
    input RST;
    input WRCLK;
    input WREN;
    parameter ALMOST_FULL_OFFSET = 12'h080;
    parameter ALMOST_EMPTY_OFFSET = 12'h080;
    parameter DATA_WIDTH = 36;
    parameter FIRST_WORD_FALL_THROUGH = "FALSE";

endmodule
