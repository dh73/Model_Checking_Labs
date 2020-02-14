// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OBUFDS.v,v 1.2 2007/05/02 17:24:18 vandanad Exp $

/*

FUNCTION	: OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module OBUFDS (O, OB, I);

    parameter CAPACITANCE = "DONT_CARE";
    parameter IOSTANDARD = "DEFAULT";

    output O, OB;

    input  I;

	bufif0 B1 (O, I, 1'b0);
	notif0 N1 (OB, I, 1'b0);

endmodule
