///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  3-State Diffential Signaling I/O Buffer
// /___/   /\     Filename : IOBUFDS_DCIEN.v
// \   \  /  \    Timestamp : Wed Dec  8 17:04:24 PST 2010
//  \___\/\___\
//
// Revision:
//    12/08/10 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module IOBUFDS_DCIEN (O, IO, IOB, DCITERMDISABLE, I, IBUFDISABLE, T);

    parameter CAPACITANCE = "DONT_CARE";
    parameter DIFF_TERM = "FALSE";
    parameter DQS_BIAS = "FALSE";
    parameter IBUF_DELAY_VALUE = "0";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IFD_DELAY_VALUE = "AUTO";
    parameter IOSTANDARD = "DEFAULT";
    parameter USE_IBUFDISABLE = "TRUE";

    parameter SLEW = "SLOW";

    output O;
    inout  IO;
    inout  IOB;
    input  DCITERMDISABLE;
    input  I;
    input  IBUFDISABLE;
    input  T;

    wire ts;


    or O1 (ts, T);
    bufif0 B1 (IO, I, ts);
    notif0 N1 (IOB, I, ts);

    and a1 (disable_out, DCITERMDISABLE, IBUFDISABLE);

    reg O_int;


    always @(IO or IOB) begin
        if (IO == 1'b1 && IOB == 1'b0)
            O_int <= IO;
        else if (IO == 1'b0 && IOB == 1'b1)
            O_int <= IO;
    end
    
    assign O = (disable_out == 1) ? 0 : (disable_out == 0) ? O_int : 1'bx;

endmodule
