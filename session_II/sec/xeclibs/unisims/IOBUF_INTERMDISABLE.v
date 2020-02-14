///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2011 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 13.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Bi-Directional Buffer
// /___/   /\     Filename : IOBUF_INTERMDISABLE.v
// \   \  /  \    Timestamp : Wed Apr 20 17:49:56 PDT 2011
//  \___\/\___\
//
// Revision:
//    04/20/11 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module IOBUF_INTERMDISABLE (O, IO, I, IBUFDISABLE, INTERMDISABLE, T);

    parameter CAPACITANCE = "DONT_CARE";
    parameter integer DRIVE = 12;
    parameter IBUF_DELAY_VALUE = "0";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IFD_DELAY_VALUE = "AUTO";
    parameter IOSTANDARD = "DEFAULT";
    parameter SLEW = "SLOW";

    output O;
    inout  IO;
    input  I;
    input  IBUFDISABLE;
    input  INTERMDISABLE;
    input  T;

    wire ts;


    or O1 (ts, T);
    bufif0 T1 (IO, I, ts);

    assign O = (IBUFDISABLE == 1'b1) ? 1'b0 : (IBUFDISABLE == 1'b0) ? IO : 1'b0;

endmodule
