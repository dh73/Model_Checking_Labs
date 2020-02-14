// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FRAME_ECC_VIRTEX4.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

`timescale  1 ps / 1 ps

module FRAME_ECC_VIRTEX4 (ERROR, SYNDROME, SYNDROMEVALID);

    output ERROR;
    output [11:0] SYNDROME;
    output SYNDROMEVALID;

endmodule // FRAME_ECC_VIRTEX4
