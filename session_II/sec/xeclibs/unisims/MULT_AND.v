// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/MULT_AND.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: 2-INPUT AND

*/

`celldefine
`timescale  100 ps / 10 ps

module MULT_AND (LO, I0, I1);

    output LO;

    input  I0, I1;

    and A1 (LO, I0, I1);

endmodule
