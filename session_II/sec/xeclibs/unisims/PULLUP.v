// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/PULLUP.v,v 1.1 2005/05/10 01:20:08 wloo Exp $

/*

FUNCTION	: pullup cell

*/

`celldefine
`timescale  100 ps / 10 ps

module PULLUP (O);

    output O;
	pullup (A);
	buf (weak0,weak1) #(1,1) (O,A);

endmodule
