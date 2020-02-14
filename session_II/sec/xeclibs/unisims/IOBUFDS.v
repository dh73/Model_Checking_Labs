// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IOBUFDS.v,v 1.6 2012/10/18 18:08:53 vandanad Exp $
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
// /___/   /\     Filename : IOBUFDS.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module IOBUFDS (O, IO, IOB, I, T);

    parameter CAPACITANCE = "DONT_CARE";
    parameter DIFF_TERM = "FALSE";
    parameter DQS_BIAS = "FALSE";
    parameter IBUF_DELAY_VALUE = "0";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IFD_DELAY_VALUE = "AUTO";
    parameter IOSTANDARD = "DEFAULT";

    output O;
    inout  IO, IOB;
    input  I, T;

    reg O;
   
    wire ts;
 
    or O1 (ts, 1'b0, T);
    bufif0 B1 (IO, I, ts);
    notif0 N1 (IOB, I, ts);

    always @(IO or IOB) begin
        if (IO == 1'b1 && IOB == 1'b0)
            O <= IO;
        else if (IO == 1'b0 && IOB == 1'b1)
            O <= IO;
        else if (IO == 1'bx || IO == 1'bz || IOB == 1'bx || IOB == 1'bz)
            O = 1'bx;
    end
    

endmodule


