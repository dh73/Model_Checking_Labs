// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BSCAN_VIRTEX4.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

`timescale  100 ps / 10 ps

module BSCAN_VIRTEX4 (CAPTURE, DRCK, RESET, SEL, SHIFT, TDI, UPDATE, TDO);

    output CAPTURE, DRCK, RESET, SEL, SHIFT, TDI, UPDATE;
    input TDO;
    parameter JTAG_CHAIN = 1;

    pulldown (DRCK);
    pulldown (RESET);
    pulldown (SEL);
    pulldown (SHIFT);
    pulldown (TDI);
    pulldown (UPDATE);

endmodule
