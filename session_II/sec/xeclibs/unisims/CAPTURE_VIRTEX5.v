// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/CAPTURE_VIRTEX5.v,v 1.3 2010/06/02 20:13:45 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Formal Verification Library Component
//  /   /                  Register State Capture for Bitstream Readback for VIRTEX5
// /___/   /\     Filename : CAPTURE_VIRTEX5.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module CAPTURE_VIRTEX5 (
	CAP,
	CLK
);

    input CAP;
    input CLK;

  parameter ONESHOT = "TRUE";
    
endmodule
