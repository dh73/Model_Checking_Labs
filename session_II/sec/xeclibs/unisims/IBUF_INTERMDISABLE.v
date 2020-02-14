///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2011 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Input Buffer
// /___/   /\     Filename : IBUF_INTERMDISABLE.v
// \   \  /  \    Timestamp : Wed Apr 20 17:49:56 PDT 2011
//  \___\/\___\
//
// Revision:
//    04/20/11 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module IBUF_INTERMDISABLE (O, I, IBUFDISABLE, INTERMDISABLE);

    parameter CAPACITANCE = "DONT_CARE";
    parameter IBUF_DELAY_VALUE = "0";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IFD_DELAY_VALUE = "AUTO";
    parameter IOSTANDARD = "DEFAULT";
    
    output O;

    input  I;
    input  IBUFDISABLE;
    input  INTERMDISABLE;

   assign O = (IBUFDISABLE == 0)? I : (IBUFDISABLE == 1)? 1'b0  : 1'b0;
endmodule
