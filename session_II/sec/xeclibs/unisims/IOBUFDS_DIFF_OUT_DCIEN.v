///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  3-State Diffential Signaling I/O Buffer
// /___/   /\     Filename : IOBUFDS_DIFF_OUT_DCIEN.v
// \   \  /  \    Timestamp : Mon Oct 19 08:59:46 PDT 2009
//  \___\/\___\
//
// Revision:
//    10/19/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps


module IOBUFDS_DIFF_OUT_DCIEN (O, OB, IO, IOB, DCITERMDISABLE, I, IBUFDISABLE, TM, TS);

    parameter DIFF_TERM = "FALSE";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "DEFAULT";

    output O;
    output OB;
    inout  IO;
    inout  IOB;
    input  DCITERMDISABLE;
    input  I;
    input  IBUFDISABLE;
    input  TM;
    input  TS;

    wire t1, t2;

    tri0 GTS = 1'b0;

    or O1 (t1, GTS, TM);
    bufif0 B1 (IO, I, t1);

    or O2 (t2, GTS, TS);
    notif0 N2 (IOB, I, t2);

    and a1 (disable_out, DCITERMDISABLE, IBUFDISABLE);
    reg O_int, OB_int;

    always @(IO or IOB) begin
        if (IO == 1'b1 && IOB == 1'b0) begin
            O_int  = IO;
            OB_int = ~IO;
        end
        else if (IO == 1'b0 && IOB == 1'b1) begin
            O_int  = IO;
            OB_int = ~IO;
        end
    end

    assign O = (disable_out == 1) ? 1 : (disable_out == 0) ? O_int : 1'b0;
    assign OB = (disable_out == 1) ? 1 : (disable_out == 0) ? OB_int : 1'b1;
endmodule
