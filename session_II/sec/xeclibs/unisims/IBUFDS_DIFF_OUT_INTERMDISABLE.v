///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2011 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Differential Signaling Input Buffer with Differential Outputs
// /___/   /\     Filename : IBUFDS_DIFF_OUT_INTERMDISABLE.v
// \   \  /  \    Timestamp : Wed Apr 20 17:49:56 PDT 2011
//  \___\/\___\
//
// Revision:
//    04/20/11 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module IBUFDS_DIFF_OUT_INTERMDISABLE (O, OB, I, IB, IBUFDISABLE, INTERMDISABLE);

    parameter DIFF_TERM = "FALSE";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";

    output O; 
    output OB;

    input I;
    input IB;
    input IBUFDISABLE;
    input INTERMDISABLE;

    reg  o_out;

    always @(I or IB) begin
	if (I == 1'b1 && IB == 1'b0)
	    o_out <= I;
	else if (I == 1'b0 && IB == 1'b1)
	    o_out <= I;
    end

   assign O  = (IBUFDISABLE == 0)? o_out  : (IBUFDISABLE == 1)? 1'b0  : 1'b0;
   assign OB = (IBUFDISABLE == 0)? ~o_out  : (IBUFDISABLE == 1)? 1'b0  : 1'b0;

endmodule
