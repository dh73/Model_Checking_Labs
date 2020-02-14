// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/MUXCY_L.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: 2 to 1 Multiplexer for Carry Logic

*/

`celldefine
`timescale  100 ps / 10 ps

module MUXCY_L (LO, CI, DI, S);

    output LO;
    reg    lo_out;

    input  CI, DI, S;

    buf B1 (LO, lo_out);

	always @(CI or DI or S) begin
	    if (S)
		lo_out <= CI;
	    else
		lo_out <= DI;
	end

endmodule
