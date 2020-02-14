// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/AND3.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: 3-INPUT AND GATE

*/

`celldefine
`timescale  100 ps / 10 ps

module AND3 (O, I0, I1, I2);

    output O;

    input  I0, I1, I2;

    and A1 (O, I0, I1, I2);

endmodule
