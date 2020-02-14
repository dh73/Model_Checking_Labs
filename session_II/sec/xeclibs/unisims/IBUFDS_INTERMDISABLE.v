///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2011 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Differential Signaling Input Buffer
// /___/   /\     Filename : IBUFDS_INTERMDISABLE.v
// \   \  /  \    Timestamp : Wed Dec  8 17:04:24 PST 2010
//  \___\/\___\
//
// Revision:
//    12/08/10 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module IBUFDS_INTERMDISABLE (O, I, IB, IBUFDISABLE, INTERMDISABLE);

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
    input  INTERMDISABLE;

    reg o_out;

    always @(I or IB) 
	if (I == 1'b1 && IB == 1'b0)
	    o_out = I;
	else if (I == 1'b0 && IB == 1'b1)
	    o_out = I;
    
   assign O = (IBUFDISABLE == 0)? o_out : (IBUFDISABLE == 1)? 1'b0  : 1'b0;

endmodule
