///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Bi-Directional Buffer
// /___/   /\     Filename : IOBUF_DCIEN.v
// \   \  /  \    Timestamp : Wed Dec  8 17:04:24 PST 2010
//  \___\/\___\
//
// Revision:
//    12/08/10 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module IOBUF_DCIEN (O, IO, DCITERMDISABLE, I, IBUFDISABLE, T);

    parameter CAPACITANCE = "DONT_CARE";
    parameter integer DRIVE = 12;
    parameter IBUF_DELAY_VALUE = "0";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IFD_DELAY_VALUE = "AUTO";
    parameter IOSTANDARD = "DEFAULT";
    parameter SLEW = "SLOW";
    parameter USE_IBUFDISABLE = "TRUE";

    output O;
    inout  IO;
    input  DCITERMDISABLE;
    input  I;
    input  IBUFDISABLE;
    input  T;

    wire ts;


    or O1 (ts, T);
    bufif0 T1 (IO, I, ts);

    and a1 (disable_out, DCITERMDISABLE, IBUFDISABLE);

    assign O = (disable_out == 1) ? 0 : (disable_out == 0) ? IO : 1'bx;

endmodule
