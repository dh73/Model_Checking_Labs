// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/JTAGPPC.v,v 1.1 2005/05/10 01:20:06 wloo Exp $

/*

		: JTAG for PPC

*/

`celldefine
`timescale  100 ps / 10 ps

module JTAGPPC (TCK, TDIPPC, TMS, TDOPPC, TDOTSPPC);

output TCK;
output TDIPPC;
output TMS;

input TDOPPC;
input TDOTSPPC;

endmodule
