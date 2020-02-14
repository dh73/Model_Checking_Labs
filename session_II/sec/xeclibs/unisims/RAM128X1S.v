// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM128X1S.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 128x1 Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM128X1S (O, A0, A1, A2, A3, A4, A5, A6, D, WCLK, WE);

    parameter INIT = 128'h00000000000000000000000000000000;

    output O;

    input  A0, A1, A2, A3, A4, A5, A6, D, WCLK, WE;

    INV INV_A4 (
      .I (A4),
      .O (A4_INV)
    );
    INV INV_A5 (
      .I (A5),
      .O (A5_INV)
    );
    INV INV_A6 (
      .I (A6),
      .O (A6_INV)
    );

    AND4 AND_WE_0 (
      .I0 (A4_INV),
      .I1 (A5_INV),
      .I2 (A6_INV),
      .I3 (WE),
      .O (WE_0)
    );
    AND4 AND_WE_1 (
      .I0 (A4),
      .I1 (A5_INV),
      .I2 (A6_INV),
      .I3 (WE),
      .O (WE_1)
    );
    AND4 AND_WE_2 (
      .I0 (A4_INV),
      .I1 (A5),
      .I2 (A6_INV),
      .I3 (WE),
      .O (WE_2)
    );
    AND4 AND_WE_3 (
      .I0 (A4),
      .I1 (A5),
      .I2 (A6_INV),
      .I3 (WE),
      .O (WE_3)
    );
    AND4 AND_WE_4 (
      .I0 (A4_INV),
      .I1 (A5_INV),
      .I2 (A6),
      .I3 (WE),
      .O (WE_4)
    );
    AND4 AND_WE_5 (
      .I0 (A4),
      .I1 (A5_INV),
      .I2 (A6),
      .I3 (WE),
      .O (WE_5)
    );
    AND4 AND_WE_6 (
      .I0 (A4_INV),
      .I1 (A5),
      .I2 (A6),
      .I3 (WE),
      .O (WE_6)
    );
    AND4 AND_WE_7 (
      .I0 (A4),
      .I1 (A5),
      .I2 (A6),
      .I3 (WE),
      .O (WE_7)
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
    X_RAMD16 RAMD_O_4 (
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
      .WE (WE_4),
      .O (O_4)
    );
    X_RAMD16 RAMD_O_5 (
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
      .WE (WE_5),
      .O (O_5)
    );
    X_RAMD16 RAMD_O_6 (
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
      .WE (WE_6),
      .O (O_6)
    );
    X_RAMD16 RAMD_O_7 (
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
      .WE (WE_7),
      .O (O_7)
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
    X_MUX2 MUX_O_2 (
      .IA (O_4),
      .IB (O_5),
      .SEL (A4),
      .O (O_MUX_2)
    );
    X_MUX2 MUX_O_3 (
      .IA (O_6),
      .IB (O_7),
      .SEL (A4),
      .O (O_MUX_3)
    );
    X_MUX2 MUX_O_4 (
      .IA (O_MUX_0),
      .IB (O_MUX_1),
      .SEL (A5),
      .O (O_MUX_4)
    );
    X_MUX2 MUX_O_5 (
      .IA (O_MUX_2),
      .IB (O_MUX_3),
      .SEL (A5),
      .O (O_MUX_5)
    );
    X_MUX2 MUX_O_6 (
      .IA (O_MUX_4),
      .IB (O_MUX_5),
      .SEL (A6),
      .O (O)
    );

endmodule
