// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/KEEPER.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: KEEPER

*/

`celldefine
`timescale  100 ps / 10 ps

module KEEPER (O);

    inout O;
    reg   in;

    always @(O)
	if (O)
	    in <= 1;
	else
	    in <= 0;

    buf (pull1, pull0) B1 (O, in);

endmodule
