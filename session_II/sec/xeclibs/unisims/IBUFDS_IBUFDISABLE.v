///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Differential Signaling Input Buffer
// /___/   /\     Filename : IBUFDS_IBUFDISABLE.v
// \   \  /  \    Timestamp : Wed Dec  8 17:04:24 PST 2010
//  \___\/\___\
//
// Revision:
//    12/08/10 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module IBUFDS_IBUFDISABLE (O, I, IB, IBUFDISABLE);

    parameter CAPACITANCE = "DONT_CARE";
    parameter DIFF_TERM = "FALSE";
    parameter DQS_BIAS = "FALSE";
    parameter IBUF_DELAY_VALUE = "0";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IFD_DELAY_VALUE = "AUTO";
    parameter IOSTANDARD = "DEFAULT";

    output O;

    input  I;
    input  IB;
    input  IBUFDISABLE;

    reg o_out;

    always @(I or IB) 
	if (I == 1'b1 && IB == 1'b0)
	    o_out = I;
	else if (I == 1'b0 && IB == 1'b1)
	    o_out = I;
    
   assign O = (IBUFDISABLE == 0) ? o_out : 1'b1;

endmodule
