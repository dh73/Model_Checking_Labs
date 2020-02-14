// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/XNOR2.v,v 1.1 2005/05/10 01:20:09 wloo Exp $

/*

FUNCTION	: 2-INPUT XNOR GATE

*/

`celldefine
`timescale  100 ps / 10 ps

module XNOR2 (O, I0, I1);

    output O;

    input  I0, I1;

	xnor X1 (O, I0, I1);

endmodule
