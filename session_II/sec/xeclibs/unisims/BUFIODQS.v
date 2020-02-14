// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BUFIODQS.v,v 1.4 2009/09/02 19:42:58 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 11.1i (L.11)
//  \   \         Description : Xilinx Formal Library Component
//  /   /            
// /___/   /\     Filename : BUFIODQS.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module BUFIODQS (O, DQSMASK, I);

    parameter DQSMASK_ENABLE = "FALSE";      // TRUE, FALSE

    output O; 
    input DQSMASK; 
    input I; 

endmodule // BUFIODQS
