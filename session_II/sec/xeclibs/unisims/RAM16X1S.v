// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM16X1S.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: 16x1 Static RAM with synchronous write capability

*/

// `celldefine
`timescale  100 ps / 10 ps

module RAM16X1S (O, A0, A1, A2, A3, D, WCLK, WE);

    parameter INIT = 16'h0000;

    output O;

    input  A0, A1, A2, A3, D, WCLK, WE;

    X_RAMD16 RAMD_O (
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
      .WE (WE),
      .O (O)
    );

endmodule
