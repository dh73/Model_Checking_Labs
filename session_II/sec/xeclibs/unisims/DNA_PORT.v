///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                       Device DNA Data Access Port
// /___/   /\     Filename : DNA_PORT.v
// \   \  /  \    Timestamp : Mon Nov 12 14:55:34 PDT 2007
//  \___\/\___\
//
// Revision:
//    11/12/07 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module DNA_PORT (DOUT, CLK, DIN, READ, SHIFT);

    parameter SIM_DNA_VALUE = 57'h0;

    output DOUT;

    input  CLK, DIN, READ, SHIFT;

endmodule // DNA_PORT
