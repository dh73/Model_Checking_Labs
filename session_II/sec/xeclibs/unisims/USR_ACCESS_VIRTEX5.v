// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/USR_ACCESS_VIRTEX5.v,v 1.1 2007/05/02 17:37:39 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Formal Verification Library Component
//  /   /
// /___/   /\     Filename : USR_ACCESS_VIRTEX5.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module USR_ACCESS_VIRTEX5 (
        CFGCLK,
	DATA,
	DATAVALID
);

    output CFGCLK;
    output DATAVALID;
    output [31:0] DATA;

endmodule
