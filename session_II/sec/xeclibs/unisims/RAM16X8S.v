// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM16X8S.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 16x8 Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM16X8S (O, A0, A1, A2, A3, D, WCLK, WE);

    parameter INIT_00 = 16'h0000;
    parameter INIT_01 = 16'h0000;
    parameter INIT_02 = 16'h0000;
    parameter INIT_03 = 16'h0000;
    parameter INIT_04 = 16'h0000;
    parameter INIT_05 = 16'h0000;
    parameter INIT_06 = 16'h0000;
    parameter INIT_07 = 16'h0000;

    output [7:0] O;

    input  A0, A1, A2, A3, WCLK, WE;
    input [7:0] D;

    X_RAMD16 RAMD_O0 (
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
      .WE (WE),
      .O (O[0])
    );
    X_RAMD16 RAMD_O1 (
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
      .WE (WE),
      .O (O[1])
    );
    X_RAMD16 RAMD_O2 (
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
      .WE (WE),
      .O (O[2])
    );
    X_RAMD16 RAMD_O3 (
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
      .WE (WE),
      .O (O[3])
    );
    X_RAMD16 RAMD_O4 (
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
      .WE (WE),
      .O (O[4])
    );
    X_RAMD16 RAMD_O5 (
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
      .WE (WE),
      .O (O[5])
    );
    X_RAMD16 RAMD_O6 (
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
      .WE (WE),
      .O (O[6])
    );
    X_RAMD16 RAMD_O7 (
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
      .WE (WE),
      .O (O[7])
    );

endmodule
