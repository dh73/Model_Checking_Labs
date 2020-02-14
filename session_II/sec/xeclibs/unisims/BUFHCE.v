// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BUFHCE.v,v 1.4 2010/11/23 20:37:36 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.i (M.36)
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  H Clock Buffer with Active High Enable
// /___/   /\     Filename : BUFHCE.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/08/08 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module BUFHCE (O, CE, I);

    parameter CE_TYPE = "SYNC";
    parameter integer INIT_OUT = 0;

    output O;

    input  CE;
    input  I;

    wire   NCE, o_bufg_o, o_bufg1_o;
                                                                                  
    BUFGMUX #(.CLK_SEL_TYPE(CE_TYPE)) 
      B1 (.I0(I),
        .I1(1'b0),
        .O(o_bufg_o),
        .S(NCE));
                                                                                  
    INV I1 (.I(CE),
        .O(NCE));

    BUFGMUX_1 #(.CLK_SEL_TYPE(CE_TYPE)) 
     B2 (.I0(I),
        .I1(1'b1),
        .O(o_bufg1_o),
        .S(NCE));

    assign O = (INIT_OUT == 1) ? o_bufg1_o : o_bufg_o;

endmodule

