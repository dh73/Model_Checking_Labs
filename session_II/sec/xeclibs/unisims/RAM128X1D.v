// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM128X1D.v,v 1.1 2007/05/02 17:34:43 vandanad Exp $

/*

FUNCTION	: 128X1 Dual Port Static RAM with synchronous write capability

*/
`timescale  100 ps / 10 ps


module RAM128X1D (DPO, SPO, A, D, DPRA, WCLK, WE);

    parameter INIT = 128'h0;

    output DPO, SPO;

    input  [6:0] A;
    input  [6:0] DPRA;
    input  D;
    input  WCLK;
    input  WE;

    wire DPO_temp1;
    wire DPO_temp2;
    wire SPO_temp1;
    wire SPO_temp2;

    X_RAMS128 RAMD_SPO (
      .ADR0 (A[0]),
      .ADR1 (A[1]),
      .ADR2 (A[2]),
      .ADR3 (A[3]),
      .ADR4 (A[4]),
      .ADR5 (A[5]),
      .ADR6 (A[6]),
      .I (D),
      .CLK (WCLK),
      .WE (WE),
      .O (SPO)
    );

    X_RAMD128 RAMD_DPO (
      .RADR0 (DPRA[0]),
      .RADR1 (DPRA[1]),
      .RADR2 (DPRA[2]),
      .RADR3 (DPRA[3]),
      .RADR4 (DPRA[4]),
      .RADR5 (DPRA[5]),
      .RADR6 (DPRA[6]),
      .WADR0 (A[0]),
      .WADR1 (A[1]),
      .WADR2 (A[2]),
      .WADR3 (A[3]),
      .WADR4 (A[4]),
      .WADR5 (A[5]),
      .WADR6 (A[6]),
      .I (D),
      .CLK (WCLK),
      .WE (WE),
      .O (DPO)
    );


endmodule

