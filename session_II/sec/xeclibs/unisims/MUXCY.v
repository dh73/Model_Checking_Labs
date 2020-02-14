// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/MUXCY.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: 2 to 1 Multiplexer for Carry Logic

*/

`celldefine
`timescale  100 ps / 10 ps

module MUXCY (O, CI, DI, S);

    output O;
    reg    o_out;

    input  CI, DI, S;

    buf B1 (O, o_out);

	always @(CI or DI or S) begin
	    if (S)
		o_out <= CI;
	    else
		o_out <= DI;
	end

endmodule
