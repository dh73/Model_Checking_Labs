// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM32X2S.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 32x2 Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM32X2S (O0, O1, A0, A1, A2, A3, A4, D0, D1, WCLK, WE);

    parameter INIT_00 = 32'h00000000;
    parameter INIT_01 = 32'h00000000;

    output O0, O1;

    input  A0, A1, A2, A3, A4, D0, D1, WCLK, WE;

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

    X_MUX2 MUX_O0 (
      .IA (O0_0),
      .IB (O0_1),
      .SEL (A4),
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

    X_MUX2 MUX_O1 (
      .IA (O1_0),
      .IB (O1_1),
      .SEL (A4),
      .O (O1)
    );

endmodule
