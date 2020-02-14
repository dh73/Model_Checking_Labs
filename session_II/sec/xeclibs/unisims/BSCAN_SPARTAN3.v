// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BSCAN_SPARTAN3.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: BSCAN_SPARTAN3 dummy simulation module

*/

`celldefine
`timescale  100 ps / 10 ps

module BSCAN_SPARTAN3 (CAPTURE, DRCK1, DRCK2, RESET, SEL1, SEL2, SHIFT, TDI, UPDATE, TDO1, TDO2);

    input TDO1, TDO2;

    output CAPTURE, DRCK1, DRCK2, RESET, SEL1, SEL2, SHIFT, TDI, UPDATE;

    pulldown (DRCK1);
    pulldown (DRCK2);
    pulldown (RESET);
    pulldown (SEL1);
    pulldown (SEL2);
    pulldown (SHIFT);
    pulldown (TDI);
    pulldown (UPDATE);

endmodule
