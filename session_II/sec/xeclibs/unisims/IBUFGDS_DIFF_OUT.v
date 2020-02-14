// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IBUFGDS_DIFF_OUT.v,v 1.2 2009/09/03 18:46:44 vandanad Exp $
/*

FUNCTION	: INPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module IBUFGDS_DIFF_OUT (O, OB, I, IB);

    parameter DIFF_TERM = "FALSE";
    parameter IBUF_LOW_PWR = "TRUE";
    parameter IOSTANDARD = "LVDS_25";

    output O, OB;

    input  I, IB;

    reg  o_out;

    buf B0 (O, o_out);
    not B1 (OB, o_out);

    always @(I or IB) begin
	if (I == 1'b1 && IB == 1'b0)
	    o_out <= I;
	else if (I == 1'b0 && IB == 1'b1)
	    o_out <= I;
    end

endmodule

