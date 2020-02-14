// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM32X1D.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 32x1 Dual Port Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM32X1D (DPO, SPO, A0, A1, A2, A3, A4, D, DPRA0, DPRA1, DPRA2, DPRA3, DPRA4, WCLK, WE);

    parameter INIT = 32'h00000000;

    output DPO, SPO;

    input  A0, A1, A2, A3, A4, D, DPRA0, DPRA1, DPRA2, DPRA3, DPRA4, WCLK, WE;

    INV INV_A4 (
      .I (A4),
      .O (A4_INV)
    );

    AND2 AND_WE_0 (
      .I0 (A4_INV),
      .I1 (WE),
      .O (WE_0)
    );
    AND2 AND_WE_1 (
      .I0 (A4),
      .I1 (WE),
      .O (WE_1)
    );

    X_RAMD16 RAMD_SP_0 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D),
      .CLK (WCLK),
      .WE (WE_0),
      .O (SP_0)
    );
    X_RAMD16 RAMD_SP_1 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D),
      .CLK (WCLK),
      .WE (WE_1),
      .O (SP_1)
    );

    X_MUX2 MUX_SP (
      .IA (SP_0),
      .IB (SP_1),
      .SEL (A4),
      .O (SPO)
    );

    X_RAMD16 RAMD_DP_0 (
      .RADR0 (DPRA0),
      .RADR1 (DPRA1),
      .RADR2 (DPRA2),
      .RADR3 (DPRA3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D),
      .CLK (WCLK),
      .WE (WE_0),
      .O (DP_0)
    );
    X_RAMD16 RAMD_DP_1 (
      .RADR0 (DPRA0),
      .RADR1 (DPRA1),
      .RADR2 (DPRA2),
      .RADR3 (DPRA3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D),
      .CLK (WCLK),
      .WE (WE_1),
      .O (DP_1)
    );

    X_MUX2 MUX_DP (
      .IA (DP_0),
      .IB (DP_1),
      .SEL (DPRA4),
      .O (DPO)
    );

endmodule
