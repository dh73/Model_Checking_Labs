// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/MUXCY_D.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: 2 to 1 Multiplexer for Carry Logic

*/

`celldefine
`timescale  100 ps / 10 ps

module MUXCY_D (LO, O, CI, DI, S);

    output O, LO;
    reg    o_out, lo_out;

    input  CI, DI, S;

    buf B1 (O, o_out);
    buf B2 (LO, lo_out);

	always @(CI or DI or S) begin
	    if (S)
		o_out <= CI;
	    else
		o_out <= DI;
	end

	always @(CI or DI or S) begin
	    if (S)
		lo_out <= CI;
	    else
		lo_out <= DI;
	end

endmodule
