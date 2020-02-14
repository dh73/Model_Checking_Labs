// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM16X1D_1.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 16x1 Dual Port Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM16X1D_1 (DPO, SPO, A0, A1, A2, A3, D, DPRA0, DPRA1, DPRA2, DPRA3, WCLK, WE);

    parameter INIT = 16'h0000;

    output DPO, SPO;

    input  A0, A1, A2, A3, D, DPRA0, DPRA1, DPRA2, DPRA3, WCLK, WE;

    INV INV_WCLK (
      .I (WCLK),
      .O (WCLK_INV)
    );

    X_RAMD16 RAMD_SPO (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D),
      .CLK (WCLK_INV),
      .WE (WE),
      .O (SPO)
    );

    X_RAMD16 RAMD_DPO (
      .RADR0 (DPRA0),
      .RADR1 (DPRA1),
      .RADR2 (DPRA2),
      .RADR3 (DPRA3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D),
      .CLK (WCLK_INV),
      .WE (WE),
      .O (DPO)
    );

endmodule
