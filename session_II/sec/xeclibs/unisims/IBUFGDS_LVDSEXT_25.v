// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IBUFGDS_LVDSEXT_25.v,v 1.1 2005/05/10 01:20:04 wloo Exp $

/*

FUNCTION	: INPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module IBUFGDS_LVDSEXT_25 (O, I, IB);

    output O;

    reg o_out;

    input  I, IB;

    buf b_0 (O, o_out);

    always @(I or IB) begin
	if (I == 1'b1 && IB == 1'b0)
	    o_out <= I;
	else if (I == 1'b0 && IB == 1'b1)
	    o_out <= I;
    end

endmodule
