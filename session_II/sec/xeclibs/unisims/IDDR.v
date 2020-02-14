// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IDDR.v,v 1.1 2005/05/10 01:20:05 wloo Exp $

`timescale  1 ps / 1 ps

module IDDR (Q1, Q2, C, CE, D, R, S);

    output Q1;
    output Q2;
    input C;
    input CE;
    input D;
    input R;
    input S;
    parameter DDR_CLK_EDGE = "OPPOSITE_EDGE";    
    parameter INIT_Q1 = 1'b0;
    parameter INIT_Q2 = 1'b0;
    parameter SRTYPE = "SYNC";

endmodule // IDDR
