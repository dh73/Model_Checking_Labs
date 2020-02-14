// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM64X2S.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 64x2 Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM64X2S (O0, O1, A0, A1, A2, A3, A4, A5, D0, D1, WCLK, WE);

    parameter INIT_00 = 64'h0000000000000000;
    parameter INIT_01 = 64'h0000000000000000;

    output O0, O1;

    input  A0, A1, A2, A3, A4, A5, D0, D1, WCLK, WE;

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

    X_RAMD16 RAMD_O0_0 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D0),
      .CLK (WCLK),
      .WE (WE_0),
      .O (O0_0)
    );
    X_RAMD16 RAMD_O0_1 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D0),
      .CLK (WCLK),
      .WE (WE_1),
      .O (O0_1)
    );
    X_RAMD16 RAMD_O0_2 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D0),
      .CLK (WCLK),
      .WE (WE_2),
      .O (O0_2)
    );
    X_RAMD16 RAMD_O0_3 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D0),
      .CLK (WCLK),
      .WE (WE_3),
      .O (O0_3)
    );

    X_MUX2 MUX_O0_0 (
      .IA (O0_0),
      .IB (O0_1),
      .SEL (A4),
      .O (O0_MUX_0)
    );
    X_MUX2 MUX_O0_1 (
      .IA (O0_2),
      .IB (O0_3),
      .SEL (A4),
      .O (O0_MUX_1)
    );
    X_MUX2 MUX_O0 (
      .IA (O0_MUX_0),
      .IB (O0_MUX_1),
      .SEL (A5),
      .O (O0)
    );

    X_RAMD16 RAMD_O1_0 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D1),
      .CLK (WCLK),
      .WE (WE_0),
      .O (O1_0)
    );
    X_RAMD16 RAMD_O1_1 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D1),
      .CLK (WCLK),
      .WE (WE_1),
      .O (O1_1)
    );
    X_RAMD16 RAMD_O1_2 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D1),
      .CLK (WCLK),
      .WE (WE_2),
      .O (O1_2)
    );
    X_RAMD16 RAMD_O1_3 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D1),
      .CLK (WCLK),
      .WE (WE_3),
      .O (O1_3)
    );

    X_MUX2 MUX_O1_0 (
      .IA (O1_0),
      .IB (O1_1),
      .SEL (A4),
      .O (O1_MUX_0)
    );
    X_MUX2 MUX_O1_1 (
      .IA (O1_2),
      .IB (O1_3),
      .SEL (A4),
      .O (O1_MUX_1)
    );
    X_MUX2 MUX_O1 (
      .IA (O1_MUX_0),
      .IB (O1_MUX_1),
      .SEL (A5),
      .O (O1)
    );

endmodule
