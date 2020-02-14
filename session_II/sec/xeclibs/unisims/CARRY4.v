// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/CARRY4.v,v 1.2 2008/05/05 22:10:46 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Formal Verification Library Component
//  /   /                  Fast Carry Logic with Look Ahead 
// /___/   /\     Filename : CARRY4.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale  100 ps / 10 ps

module CARRY4 (CO, O, CI, CYINIT, DI, S);

    output [3:0] CO;
    output [3:0] O;
    input CI;
    input CYINIT;
    input [3:0] DI;
    input [3:0] S;
    wire ci_or_cyinit;


    assign O = S ^ {CO[2:0], ci_or_cyinit};
    assign CO[0] = S[0] ? ci_or_cyinit : DI[0];
    assign CO[1] = S[1] ? CO[0] : DI[1];
    assign CO[2] = S[2] ? CO[1] : DI[2];
    assign CO[3] = S[3] ? CO[2] : DI[3];
    assign ci_or_cyinit = CYINIT | CI;

endmodule
