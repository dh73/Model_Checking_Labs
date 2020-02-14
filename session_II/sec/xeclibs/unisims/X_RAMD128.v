// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/X_RAMD128.v,v 1.1 2007/05/02 17:37:39 vandanad Exp $

// `celldefine
`timescale 1 ps/1 ps

module X_RAMD128 (O, CLK, I, RADR0, RADR1, RADR2, RADR3, RADR4, RADR5, RADR6, WADR0, WADR1, WADR2, WADR3, WADR4, WADR5, WADR6,WE);

  parameter INIT = 128'h0000000000000000_0000000000000000;

  output O;
  input I, CLK, WE, WADR0, WADR1, WADR2, WADR3, WADR4, WADR5, WADR6, RADR0, RADR1, RADR2, RADR3, RADR4, RADR5, RADR6;

    X_INV INV_WADR4 (
      .I (WADR4),
      .O (WADR4_INV)
    );
    X_INV INV_WADR5 (
      .I (WADR5),
      .O (WADR5_INV)
    );
    X_INV INV_WADR6 (
      .I (WADR6),
      .O (WADR6_INV)
    );

    X_AND4 AND_WE_0 (
      .I0 (WADR4_INV),
      .I1 (WADR5_INV),
      .I2 (WADR6_INV),
      .I3 (WE),
      .O (WE_0)
    );
    X_AND4 AND_WE_1 (
      .I0 (WADR4),
      .I1 (WADR5_INV),
      .I2 (WADR6_INV),
      .I3 (WE),
      .O (WE_1)
    );
    X_AND4 AND_WE_2 (
      .I0 (WADR4_INV),
      .I1 (WADR5),
      .I2 (WADR6_INV),
      .I3 (WE),
      .O (WE_2)
    );
    X_AND4 AND_WE_3 (
      .I0 (WADR4),
      .I1 (WADR5),
      .I2 (WADR6_INV),
      .I3 (WE),
      .O (WE_3)
    );
    X_AND4 AND_WE_4 (
      .I0 (WADR4_INV),
      .I1 (WADR5_INV),
      .I2 (WADR6),
      .I3 (WE),
      .O (WE_4)
    );
    X_AND4 AND_WE_5 (
      .I0 (WADR4),
      .I1 (WADR5_INV),
      .I2 (WADR6),
      .I3 (WE),
      .O (WE_5)
    );
    X_AND4 AND_WE_6 (
      .I0 (WADR4_INV),
      .I1 (WADR5),
      .I2 (WADR6),
      .I3 (WE),
      .O (WE_6)
    );
    X_AND4 AND_WE_7 (
      .I0 (WADR4),
      .I1 (WADR5),
      .I2 (WADR6),
      .I3 (WE),
      .O (WE_7)
    );

    X_RAMD16 RAMD_O_0 (
      .RADR0 (RADR0),
      .RADR1 (RADR1),
      .RADR2 (RADR2),
      .RADR3 (RADR3),
      .WADR0 (WADR0),
      .WADR1 (WADR1),
      .WADR2 (WADR2),
      .WADR3 (WADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_0),
      .O (O_0)
    );
    X_RAMD16 RAMD_O_1 (
      .RADR0 (RADR0),
      .RADR1 (RADR1),
      .RADR2 (RADR2),
      .RADR3 (RADR3),
      .WADR0 (WADR0),
      .WADR1 (WADR1),
      .WADR2 (WADR2),
      .WADR3 (WADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_1),
      .O (O_1)
    );
    X_RAMD16 RAMD_O_2 (
      .RADR0 (RADR0),
      .RADR1 (RADR1),
      .RADR2 (RADR2),
      .RADR3 (RADR3),
      .WADR0 (WADR0),
      .WADR1 (WADR1),
      .WADR2 (WADR2),
      .WADR3 (WADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_2),
      .O (O_2)
    );
    X_RAMD16 RAMD_O_3 (
      .RADR0 (RADR0),
      .RADR1 (RADR1),
      .RADR2 (RADR2),
      .RADR3 (RADR3),
      .WADR0 (WADR0),
      .WADR1 (WADR1),
      .WADR2 (WADR2),
      .WADR3 (WADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_3),
      .O (O_3)
    );
    X_RAMD16 RAMD_O_4 (
      .RADR0 (RADR0),
      .RADR1 (RADR1),
      .RADR2 (RADR2),
      .RADR3 (RADR3),
      .WADR0 (WADR0),
      .WADR1 (WADR1),
      .WADR2 (WADR2),
      .WADR3 (WADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_4),
      .O (O_4)
    );
    X_RAMD16 RAMD_O_5 (
      .RADR0 (RADR0),
      .RADR1 (RADR1),
      .RADR2 (RADR2),
      .RADR3 (RADR3),
      .WADR0 (WADR0),
      .WADR1 (WADR1),
      .WADR2 (WADR2),
      .WADR3 (WADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_5),
      .O (O_5)
    );
    X_RAMD16 RAMD_O_6 (
      .RADR0 (RADR0),
      .RADR1 (RADR1),
      .RADR2 (RADR2),
      .RADR3 (RADR3),
      .WADR0 (WADR0),
      .WADR1 (WADR1),
      .WADR2 (WADR2),
      .WADR3 (WADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_6),
      .O (O_6)
    );
    X_RAMD16 RAMD_O_7 (
      .RADR0 (RADR0),
      .RADR1 (RADR1),
      .RADR2 (RADR2),
      .RADR3 (RADR3),
      .WADR0 (WADR0),
      .WADR1 (WADR1),
      .WADR2 (WADR2),
      .WADR3 (WADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_7),
      .O (O_7)
    );

    X_MUX2 MUX_O_0 (
      .IA (O_0),
      .IB (O_1),
      .SEL (RADR4),
      .O (O_MUX_0)
    );
    X_MUX2 MUX_O_1 (
      .IA (O_2),
      .IB (O_3),
      .SEL (RADR4),
      .O (O_MUX_1)
    );
    X_MUX2 MUX_O_2 (
      .IA (O_4),
      .IB (O_5),
      .SEL (RADR4),
      .O (O_MUX_2)
    );
    X_MUX2 MUX_O_3 (
      .IA (O_6),
      .IB (O_7),
      .SEL (RADR4),
      .O (O_MUX_3)
    );
    X_MUX2 MUX_O_4 (
      .IA (O_MUX_0),
      .IB (O_MUX_1),
      .SEL (RADR5),
      .O (O_MUX_4)
    );
    X_MUX2 MUX_O_5 (
      .IA (O_MUX_2),
      .IB (O_MUX_3),
      .SEL (RADR5),
      .O (O_MUX_5)
    );
    X_MUX2 MUX_O (
      .IA (O_MUX_4),
      .IB (O_MUX_5),
      .SEL (RADR6),
      .O (O)
    );

endmodule
