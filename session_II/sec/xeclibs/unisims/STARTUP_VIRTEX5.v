// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/STARTUP_VIRTEX5.v,v 1.1 2007/05/02 17:37:39 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Formal Verification Library Component
//  /   /                  User Interface to Global Clock, Reset and 3-State Controls for VIRTEX5
// /___/   /\     Filename : STARTUP_VIRTEX5.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 

module STARTUP_VIRTEX5 (
        CFGCLK,
        CFGMCLK,
        DINSPI,
	EOS,
        TCKSPI,
	CLK,
	GSR,
	GTS,
	USRCCLKO,
	USRCCLKTS,
	USRDONEO,
	USRDONETS
);

    output CFGCLK;
    output CFGMCLK;
    output DINSPI;
    output EOS;
    output TCKSPI;
    
    input CLK;
    input GSR;
    input GTS;
    input USRCCLKO;
    input USRCCLKTS;
    input USRDONEO;
    input USRDONETS;
    
endmodule
