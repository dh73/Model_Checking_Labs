// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM32X1S_1.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 32x1 Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM32X1S_1 (O, A0, A1, A2, A3, A4, D, WCLK, WE);

    parameter INIT = 32'h00000000;

    output O;

    input  A0, A1, A2, A3, A4, D, WCLK, WE;

    INV INV_WCLK (
      .I (WCLK),
      .O (WCLK_INV)
    );
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

    X_RAMD16 RAMD_O_0 (
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
      .O (O_0)
    );
    X_RAMD16 RAMD_O_1 (
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
      .O (O_1)
    );

    X_MUX2 MUX_O (
      .IA (O_0),
      .IB (O_1),
      .SEL (A4),
      .O (O)
    );

endmodule
