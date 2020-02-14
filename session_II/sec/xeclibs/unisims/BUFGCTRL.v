// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BUFGCTRL.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

`timescale 1 ps/1 ps

module BUFGCTRL (O, CE0, CE1, I0, I1, IGNORE0, IGNORE1, S0, S1);

    output O;
    input CE0;
    input CE1;
    input I0;
    input I1;
    input IGNORE0;
    input IGNORE1;
    input S0;
    input S1;
    parameter INIT_OUT = 0;
    parameter PRESELECT_I0 = "FALSE";
    parameter PRESELECT_I1 = "FALSE";
// *** parameter checking
// *** input enable for i0

endmodule
