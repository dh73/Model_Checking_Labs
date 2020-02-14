// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IODELAY.v,v 1.3 2008/12/11 17:17:40 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Functional Simulation Library Component
//  /   /                  Input and/or Output Fixed or Variable Delay Element.
// /___/   /\     Filename : IODELAY.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module IODELAY (DATAOUT, C, CE, DATAIN, IDATAIN, INC, ODATAIN, RST, T);

    parameter DELAY_SRC    = "I";
    parameter HIGH_PERFORMANCE_MODE    = "TRUE";
    parameter IDELAY_TYPE  = "DEFAULT";
    parameter IDELAY_VALUE = 0;
    parameter ODELAY_VALUE = 0;
    parameter REFCLK_FREQUENCY = 200.0;
    parameter SIGNAL_PATTERN    = "DATA";

    output DATAOUT;
    input C;
    input CE;
    input DATAIN;
    input IDATAIN;
    input INC;
    input ODATAIN;
    input RST;
    input T ;

endmodule // IODELAY
