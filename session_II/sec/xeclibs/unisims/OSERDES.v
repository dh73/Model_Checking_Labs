// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OSERDES.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

`timescale  1 ps / 1 ps

module OSERDES (OQ, SHIFTOUT1, SHIFTOUT2, TQ,
		  CLK, CLKDIV, D1, D2, D3, D4, D5, D6, OCE, REV, SHIFTIN1, SHIFTIN2, SR, T1, T2, T3, T4, TCE);

    parameter DATA_RATE_OQ = "DDR";
    parameter DATA_RATE_TQ = "DDR";
    parameter DATA_WIDTH = 4;
    parameter INIT_OQ = 1'b0;
    parameter INIT_TQ = 1'b0;
    parameter SERDES_MODE = "MASTER";
    parameter SRVAL_OQ = 1'b0;
    parameter SRVAL_TQ = 1'b0;
    parameter TRISTATE_WIDTH = 4;
    output OQ;
    output SHIFTOUT1;
    output SHIFTOUT2;
    output TQ;
    input CLK;
    input CLKDIV;
    input D1;
    input D2;
    input D3;
    input D4;
    input D5;
    input D6;
    input OCE;
    input REV;
    input SHIFTIN1;
    input SHIFTIN2;
    input SR;
    input T1;
    input T2;
    input T3;
    input T4;
    input TCE;
// Data output delays
    parameter io_ffd = 1; // clock to out delay for flip flops
    parameter io_mxd = 1; // 60 ps mux delay
    parameter ffdcnt = 1;
    parameter mxdcnt = 1;
    // Tristate output delays
    parameter iot_ffd = 1;
    parameter iot_mxd = 1;
// Representation of 3rd flop ( latch and output latch)
// First rank of flops for input data
// Representation of 3rd flop ( latch and output latch)

endmodule // OSERDES
