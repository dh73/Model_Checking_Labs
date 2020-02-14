// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM64X1D_1.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 64x1 Dual Port Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM64X1D_1 (DPO, SPO, A0, A1, A2, A3, A4, A5, D, DPRA0, DPRA1, DPRA2, DPRA3, DPRA4, DPRA5, WCLK, WE);

    parameter INIT = 64'h0000000000000000;

    output DPO, SPO;

    input  A0, A1, A2, A3, A4, A5, D, DPRA0, DPRA1, DPRA2, DPRA3, DPRA4, DPRA5, WCLK, WE;

    INV INV_WCLK (
      .I (WCLK),
      .O (WCLK_INV)
    );
    INV INV_A4 (
      .I (A4),
      .O (A4_INV)
    );
    INV INV_A5 (
      .I (A5),
      .O (A5_INV)
    );

    AND3 AND_WE_0 (
      .I0 (A4_INV),
      .I1 (A5_INV),
      .I2 (WE),
      .O (WE_0)
    );
    AND3 AND_WE_1 (
      .I0 (A4),
      .I1 (A5_INV),
      .I2 (WE),
      .O (WE_1)
    );
    AND3 AND_WE_2 (
      .I0 (A4_INV),
      .I1 (A5),
      .I2 (WE),
      .O (WE_2)
    );
    AND3 AND_WE_3 (
      .I0 (A4),
      .I1 (A5),
      .I2 (WE),
      .O (WE_3)
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
      .CLK (WCLK_INV),
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
      .CLK (WCLK_INV),
      .WE (WE_1),
      .O (SP_1)
    );
    X_RAMD16 RAMD_SP_2 (
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
      .WE (WE_2),
      .O (SP_2)
    );
    X_RAMD16 RAMD_SP_3 (
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
      .WE (WE_3),
      .O (SP_3)
    );

    X_MUX2 MUX_SP_0 (
      .IA (SP_0),
      .IB (SP_1),
      .SEL (A4),
      .O (SP_MUX_0)
    );
    X_MUX2 MUX_SP_1 (
      .IA (SP_2),
      .IB (SP_3),
      .SEL (A4),
      .O (SP_MUX_1)
    );
    X_MUX2 MUX_SP (
      .IA (SP_MUX_0),
      .IB (SP_MUX_1),
      .SEL (A5),
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
      .CLK (WCLK_INV),
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
      .CLK (WCLK_INV),
      .WE (WE_1),
      .O (DP_1)
    );
    X_RAMD16 RAMD_DP_2 (
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
      .WE (WE_2),
      .O (DP_2)
    );
    X_RAMD16 RAMD_DP_3 (
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
      .WE (WE_3),
      .O (DP_3)
    );

    X_MUX2 MUX_DP_0 (
      .IA (DP_0),
      .IB (DP_1),
      .SEL (DPRA4),
      .O (DP_MUX_0)
    );
    X_MUX2 MUX_DP_1 (
      .IA (DP_2),
      .IB (DP_3),
      .SEL (DPRA4),
      .O (DP_MUX_1)
    );
    X_MUX2 MUX_DP (
      .IA (DP_MUX_0),
      .IB (DP_MUX_1),
      .SEL (DPRA5),
      .O (DPO)
    );

endmodule
