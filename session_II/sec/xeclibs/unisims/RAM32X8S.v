// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM32X8S.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 32x8 Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM32X8S (O, A0, A1, A2, A3, A4, D, WCLK, WE);

    parameter INIT_00 = 32'h00000000;
    parameter INIT_01 = 32'h00000000;
    parameter INIT_02 = 32'h00000000;
    parameter INIT_03 = 32'h00000000;
    parameter INIT_04 = 32'h00000000;
    parameter INIT_05 = 32'h00000000;
    parameter INIT_06 = 32'h00000000;
    parameter INIT_07 = 32'h00000000;

    output [7:0] O;

    input  A0, A1, A2, A3, A4, WCLK, WE;
    input [7:0] D;

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
      .I (D[0]),
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
      .I (D[0]),
      .CLK (WCLK),
      .WE (WE_1),
      .O (O0_1)
    );

    X_MUX2 MUX_O0 (
      .IA (O0_0),
      .IB (O0_1),
      .SEL (A4),
      .O (O[0])
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
      .I (D[1]),
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
      .I (D[1]),
      .CLK (WCLK),
      .WE (WE_1),
      .O (O1_1)
    );

    X_MUX2 MUX_O1 (
      .IA (O1_0),
      .IB (O1_1),
      .SEL (A4),
      .O (O[1])
    );

    X_RAMD16 RAMD_O2_0 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[2]),
      .CLK (WCLK),
      .WE (WE_0),
      .O (O2_0)
    );
    X_RAMD16 RAMD_O2_1 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[2]),
      .CLK (WCLK),
      .WE (WE_1),
      .O (O2_1)
    );

    X_MUX2 MUX_O2 (
      .IA (O2_0),
      .IB (O2_1),
      .SEL (A4),
      .O (O[2])
    );

    X_RAMD16 RAMD_O3_0 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[3]),
      .CLK (WCLK),
      .WE (WE_0),
      .O (O3_0)
    );
    X_RAMD16 RAMD_O3_1 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[3]),
      .CLK (WCLK),
      .WE (WE_1),
      .O (O3_1)
    );

    X_MUX2 MUX_O3 (
      .IA (O3_0),
      .IB (O3_1),
      .SEL (A4),
      .O (O[3])
    );

    X_RAMD16 RAMD_O4_0 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[4]),
      .CLK (WCLK),
      .WE (WE_0),
      .O (O4_0)
    );
    X_RAMD16 RAMD_O4_1 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[4]),
      .CLK (WCLK),
      .WE (WE_1),
      .O (O4_1)
    );

    X_MUX2 MUX_O4 (
      .IA (O4_0),
      .IB (O4_1),
      .SEL (A4),
      .O (O[4])
    );

    X_RAMD16 RAMD_O5_0 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[5]),
      .CLK (WCLK),
      .WE (WE_0),
      .O (O5_0)
    );
    X_RAMD16 RAMD_O5_1 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[5]),
      .CLK (WCLK),
      .WE (WE_1),
      .O (O5_1)
    );

    X_MUX2 MUX_O5 (
      .IA (O5_0),
      .IB (O5_1),
      .SEL (A4),
      .O (O[5])
    );

    X_RAMD16 RAMD_O6_0 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[6]),
      .CLK (WCLK),
      .WE (WE_0),
      .O (O6_0)
    );
    X_RAMD16 RAMD_O6_1 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[6]),
      .CLK (WCLK),
      .WE (WE_1),
      .O (O6_1)
    );

    X_MUX2 MUX_O6 (
      .IA (O6_0),
      .IB (O6_1),
      .SEL (A4),
      .O (O[6])
    );

    X_RAMD16 RAMD_O7_0 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[7]),
      .CLK (WCLK),
      .WE (WE_0),
      .O (O7_0)
    );
    X_RAMD16 RAMD_O7_1 (
      .RADR0 (A0),
      .RADR1 (A1),
      .RADR2 (A2),
      .RADR3 (A3),
      .WADR0 (A0),
      .WADR1 (A1),
      .WADR2 (A2),
      .WADR3 (A3),
      .I (D[7]),
      .CLK (WCLK),
      .WE (WE_1),
      .O (O7_1)
    );

    X_MUX2 MUX_O7 (
      .IA (O7_0),
      .IB (O7_1),
      .SEL (A4),
      .O (O[7])
    );

endmodule
