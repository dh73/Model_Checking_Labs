// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAMB4_S2_S16.v,v 1.3 2008/08/11 22:17:44 vandanad Exp $

`celldefine
`timescale 1 ps/1 ps

module RAMB4_S2_S16 (DOA, DOB, ADDRA, ADDRB, CLKA, CLKB, DIA, DIB, ENA, ENB, RSTA, RSTB, WEA, WEB);
    parameter SIM_COLLISION_CHECK = "ALL";
    parameter INIT_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    output [1:0] DOA;
    input [10:0] ADDRA;
    input [1:0] DIA;
    input ENA, CLKA, WEA, RSTA;
    output [15:0] DOB;
    input [7:0] ADDRB;
    input [15:0] DIB;
    input ENB, CLKB, WEB, RSTB;

    pulldown addra[10:0] (ADDRA);
    pulldown addrb[7:0] (ADDRB);
    pulldown dia[1:0] (DIA);
    pulldown dib[15:0] (DIB);

    ramb4_s2_s16_int u1 (DOA, DOB, ADDRA, ADDRB, CLKA, CLKB, DIA, DIB, ENA, ENB, RSTA, RSTB, WEA, WEB);

    defparam u1.INIT_00 = INIT_00;
    defparam u1.INIT_01 = INIT_01;
    defparam u1.INIT_02 = INIT_02;
    defparam u1.INIT_03 = INIT_03;
    defparam u1.INIT_04 = INIT_04;
    defparam u1.INIT_05 = INIT_05;
    defparam u1.INIT_06 = INIT_06;
    defparam u1.INIT_07 = INIT_07;
    defparam u1.INIT_08 = INIT_08;
    defparam u1.INIT_09 = INIT_09;
    defparam u1.INIT_0A = INIT_0A;
    defparam u1.INIT_0B = INIT_0B;
    defparam u1.INIT_0C = INIT_0C;
    defparam u1.INIT_0D = INIT_0D;
    defparam u1.INIT_0E = INIT_0E;
    defparam u1.INIT_0F = INIT_0F;

endmodule
