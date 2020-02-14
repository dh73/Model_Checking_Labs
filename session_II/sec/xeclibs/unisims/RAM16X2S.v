// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM16X2S.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 16x2 Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM16X2S (O0, O1, A0, A1, A2, A3, D0, D1, WCLK, WE);

    parameter INIT_00 = 16'h0000;
    parameter INIT_01 = 16'h0000;

    output O0, O1;

    input  A0, A1, A2, A3, D0, D1, WCLK, WE;

    X_RAMD16 RAMD_O0 (
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
      .WE (WE),
      .O (O0)
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
      .I (D1),
      .CLK (WCLK),
      .WE (WE),
      .O (O1)
    );

endmodule
