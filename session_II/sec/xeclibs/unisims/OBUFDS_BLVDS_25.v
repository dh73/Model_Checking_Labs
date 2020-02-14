// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/OBUFDS_BLVDS_25.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

FUNCTION	: OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module OBUFDS_BLVDS_25 (O, OB, I);

    output O, OB;

    input  I;

	bufif0 B1 (O, I, 1'b0);
	notif0 N1 (OB, I, 1'b0);

endmodule
