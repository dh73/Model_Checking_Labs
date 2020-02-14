// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ICAP_VIRTEX5.v,v 1.1 2007/05/02 17:30:06 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Internal Configuration Access Port for Virtex5
// /___/   /\     Filename : ICAP_VIRTEX5.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module ICAP_VIRTEX5 (
	BUSY,
	O,
	CE,
	CLK,
	I,
	WRITE
);

    parameter ICAP_WIDTH = "X8";
    output BUSY;
    output [31:0] O;
    input CE;
    input CLK;
    input WRITE;
    input [31:0] I;
    
endmodule
