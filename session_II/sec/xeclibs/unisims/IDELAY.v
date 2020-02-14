// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IDELAY.v,v 1.1 2005/05/10 01:20:05 wloo Exp $

`timescale  1 ps / 1 ps

module IDELAY (O, C, CE, I, INC, RST);

    output O;
    input C;
    input CE;
    input I;
    input INC;
    input RST;
    parameter IOBDELAY_TYPE = "DEFAULT";    
    parameter IOBDELAY_VALUE = 0;

    assign    O = I;
    
endmodule // IDELAY
