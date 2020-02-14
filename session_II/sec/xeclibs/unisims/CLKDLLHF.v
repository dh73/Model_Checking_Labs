// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/CLKDLLHF.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: Clock Delay Locked Loop

*/

`celldefine
`timescale  1 ps / 1 ps

module CLKDLLHF (CLK0, CLK180, CLKDV, LOCKED, CLKFB, CLKIN, RST);

parameter CLKDV_DIVIDE = 2.0;
parameter DUTY_CYCLE_CORRECTION = "TRUE";
parameter FACTORY_JF = 16'hFFF0;		// non-simulatable
parameter STARTUP_WAIT = "FALSE";		// non-simulatable

input  CLKIN, CLKFB, RST;
output CLK0, CLK180, CLKDV, LOCKED;

endmodule
