// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM64X1S.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 64x1 Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM64X1S (O, A0, A1, A2, A3, A4, A5, D, WCLK, WE);

    parameter INIT = 64'h0000000000000000;

    output O;

    input  A0, A1, A2, A3, A4, A5, D, WCLK, WE;

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
      .CLK (WCLK),
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
      .CLK (WCLK),
      .WE (WE_1),
      .O (O_1)
    );
    X_RAMD16 RAMD_O_2 (
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
      .WE (WE_2),
      .O (O_2)
    );
    X_RAMD16 RAMD_O_3 (
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
      .WE (WE_3),
      .O (O_3)
    );

    X_MUX2 MUX_O_0 (
      .IA (O_0),
      .IB (O_1),
      .SEL (A4),
      .O (O_MUX_0)
    );
    X_MUX2 MUX_O_1 (
      .IA (O_2),
      .IB (O_3),
      .SEL (A4),
      .O (O_MUX_1)
    );
    X_MUX2 MUX_O (
      .IA (O_MUX_0),
      .IB (O_MUX_1),
      .SEL (A5),
      .O (O)
    );

endmodule
