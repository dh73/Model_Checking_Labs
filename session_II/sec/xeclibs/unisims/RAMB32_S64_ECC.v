///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  RAMB32_S64_ECC
// /___/   /\     Filename : RAMB32_S64_ECC.v
// \   \  /  \    Timestamp : Tue Nov 13 14:57:54 PST 2007
//  \___\/\___\
//
// Revision:
//    11/13/07 - Initial version.
// End Revision


`timescale 1 ps / 1 ps

module RAMB32_S64_ECC (
 DO,
 STATUS,

 DI,
 RDADDR,
 RDCLK,
 RDEN,
 SSR,
 WRADDR,
 WRCLK,
 WREN
);

parameter DO_REG = 0;
parameter SIM_COLLISION_CHECK = "ALL";

output [1:0] STATUS;
output [63:0] DO;

input RDCLK;
input RDEN;
input SSR;
input WRCLK;
input WREN;
input [63:0] DI;
input [8:0]  RDADDR;
input [8:0]  WRADDR;

endmodule
