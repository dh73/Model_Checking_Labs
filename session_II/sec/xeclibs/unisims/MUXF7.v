// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/MUXF7.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: 2 to 1 Multiplexer for Carry Logic

*/

`celldefine
`timescale  100 ps / 10 ps

module MUXF7 (O, I0, I1, S);

    output O;
    reg    o_out;

    input  I0, I1, S;

    buf B1 (O, o_out);

	always @(I0 or I1 or S) begin
	    if (S)
		o_out <= I1;
	    else
		o_out <= I0;
	end

endmodule
