// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/X_RAMS128.v,v 1.1 2007/05/02 17:37:39 vandanad Exp $

// `celldefine
`timescale 1 ps/1 ps

module X_RAMS128 (O, ADR0, ADR1, ADR2, ADR3, ADR4, ADR5, ADR6, CLK, I, WE);

  parameter INIT = 128'h0000000000000000_0000000000000000;

  output O;
  input I, CLK, WE, ADR0, ADR1, ADR2, ADR3, ADR4, ADR5, ADR6;

    X_INV INV_ADR4 (
      .I (ADR4),
      .O (ADR4_INV)
    );
    X_INV INV_ADR5 (
      .I (ADR5),
      .O (ADR5_INV)
    );
    X_INV INV_ADR6 (
      .I (ADR6),
      .O (ADR6_INV)
    );

    X_AND4 AND_WE_0 (
      .I0 (ADR4_INV),
      .I1 (ADR5_INV),
      .I2 (ADR6_INV),
      .I3 (WE),
      .O (WE_0)
    );
    X_AND4 AND_WE_1 (
      .I0 (ADR4),
      .I1 (ADR5_INV),
      .I2 (ADR6_INV),
      .I3 (WE),
      .O (WE_1)
    );
    X_AND4 AND_WE_2 (
      .I0 (ADR4_INV),
      .I1 (ADR5),
      .I2 (ADR6_INV),
      .I3 (WE),
      .O (WE_2)
    );
    X_AND4 AND_WE_3 (
      .I0 (ADR4),
      .I1 (ADR5),
      .I2 (ADR6_INV),
      .I3 (WE),
      .O (WE_3)
    );
    X_AND4 AND_WE_4 (
      .I0 (ADR4_INV),
      .I1 (ADR5_INV),
      .I2 (ADR6),
      .I3 (WE),
      .O (WE_4)
    );
    X_AND4 AND_WE_5 (
      .I0 (ADR4),
      .I1 (ADR5_INV),
      .I2 (ADR6),
      .I3 (WE),
      .O (WE_5)
    );
    X_AND4 AND_WE_6 (
      .I0 (ADR4_INV),
      .I1 (ADR5),
      .I2 (ADR6),
      .I3 (WE),
      .O (WE_6)
    );
    X_AND4 AND_WE_7 (
      .I0 (ADR4),
      .I1 (ADR5),
      .I2 (ADR6),
      .I3 (WE),
      .O (WE_7)
    );

    X_RAMD16 RAMD_O_0 (
      .RADR0 (ADR0),
      .RADR1 (ADR1),
      .RADR2 (ADR2),
      .RADR3 (ADR3),
      .WADR0 (ADR0),
      .WADR1 (ADR1),
      .WADR2 (ADR2),
      .WADR3 (ADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_0),
      .O (O_0)
    );
    X_RAMD16 RAMD_O_1 (
      .RADR0 (ADR0),
      .RADR1 (ADR1),
      .RADR2 (ADR2),
      .RADR3 (ADR3),
      .WADR0 (ADR0),
      .WADR1 (ADR1),
      .WADR2 (ADR2),
      .WADR3 (ADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_1),
      .O (O_1)
    );
    X_RAMD16 RAMD_O_2 (
      .RADR0 (ADR0),
      .RADR1 (ADR1),
      .RADR2 (ADR2),
      .RADR3 (ADR3),
      .WADR0 (ADR0),
      .WADR1 (ADR1),
      .WADR2 (ADR2),
      .WADR3 (ADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_2),
      .O (O_2)
    );
    X_RAMD16 RAMD_O_3 (
      .RADR0 (ADR0),
      .RADR1 (ADR1),
      .RADR2 (ADR2),
      .RADR3 (ADR3),
      .WADR0 (ADR0),
      .WADR1 (ADR1),
      .WADR2 (ADR2),
      .WADR3 (ADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_3),
      .O (O_3)
    );
    X_RAMD16 RAMD_O_4 (
      .RADR0 (ADR0),
      .RADR1 (ADR1),
      .RADR2 (ADR2),
      .RADR3 (ADR3),
      .WADR0 (ADR0),
      .WADR1 (ADR1),
      .WADR2 (ADR2),
      .WADR3 (ADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_4),
      .O (O_4)
    );
    X_RAMD16 RAMD_O_5 (
      .RADR0 (ADR0),
      .RADR1 (ADR1),
      .RADR2 (ADR2),
      .RADR3 (ADR3),
      .WADR0 (ADR0),
      .WADR1 (ADR1),
      .WADR2 (ADR2),
      .WADR3 (ADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_5),
      .O (O_5)
    );
    X_RAMD16 RAMD_O_6 (
      .RADR0 (ADR0),
      .RADR1 (ADR1),
      .RADR2 (ADR2),
      .RADR3 (ADR3),
      .WADR0 (ADR0),
      .WADR1 (ADR1),
      .WADR2 (ADR2),
      .WADR3 (ADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_6),
      .O (O_6)
    );
    X_RAMD16 RAMD_O_7 (
      .RADR0 (ADR0),
      .RADR1 (ADR1),
      .RADR2 (ADR2),
      .RADR3 (ADR3),
      .WADR0 (ADR0),
      .WADR1 (ADR1),
      .WADR2 (ADR2),
      .WADR3 (ADR3),
      .I (I),
      .CLK (CLK),
      .WE (WE_7),
      .O (O_7)
    );

    X_MUX2 MUX_O_0 (
      .IA (O_0),
      .IB (O_1),
      .SEL (ADR4),
      .O (O_MUX_0)
    );
    X_MUX2 MUX_O_1 (
      .IA (O_2),
      .IB (O_3),
      .SEL (ADR4),
      .O (O_MUX_1)
    );
    X_MUX2 MUX_O_2 (
      .IA (O_4),
      .IB (O_5),
      .SEL (ADR4),
      .O (O_MUX_2)
    );
    X_MUX2 MUX_O_3 (
      .IA (O_6),
      .IB (O_7),
      .SEL (ADR4),
      .O (O_MUX_3)
    );
    X_MUX2 MUX_O_4 (
      .IA (O_MUX_0),
      .IB (O_MUX_1),
      .SEL (ADR5),
      .O (O_MUX_4)
    );
    X_MUX2 MUX_O_5 (
      .IA (O_MUX_2),
      .IB (O_MUX_3),
      .SEL (ADR5),
      .O (O_MUX_5)
    );
    X_MUX2 MUX_O (
      .IA (O_MUX_4),
      .IB (O_MUX_5),
      .SEL (ADR6),
      .O (O)
    );

endmodule
