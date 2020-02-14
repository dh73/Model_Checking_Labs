// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ICAP_VIRTEX4.v,v 1.1 2005/05/10 01:20:05 wloo Exp $

`timescale  100 ps / 10 ps

module ICAP_VIRTEX4 (BUSY, O, CE, CLK, I, WRITE);

    output BUSY;
    output [31:0] O;
    input  CE, CLK, WRITE;
    input  [31:0] I;
    parameter ICAP_WIDTH = "X8";

endmodule
