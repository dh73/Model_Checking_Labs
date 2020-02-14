// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FRAME_ECC_VIRTEX5.v,v 1.1 2007/05/02 17:30:06 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /
// /___/   /\     Filename : FRAME_ECC_VIRTEX5.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module FRAME_ECC_VIRTEX5 (
	CRCERROR,
	ECCERROR,
	SYNDROME,
	SYNDROMEVALID
);

    output CRCERROR;
    output ECCERROR;
    output SYNDROMEVALID;
    output [11:0] SYNDROME;
    
endmodule
