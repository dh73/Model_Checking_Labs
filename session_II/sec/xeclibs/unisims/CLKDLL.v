// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/CLKDLL.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: Clock Delay Locked Loop

*/

`celldefine
`timescale  1 ps / 1 ps

module CLKDLL (CLK0, CLK180, CLK270, CLK2X, CLK90, CLKDV, LOCKED, CLKFB, CLKIN, RST);

parameter CLKDV_DIVIDE = 2.0;
parameter DUTY_CYCLE_CORRECTION = "TRUE";
parameter FACTORY_JF = 16'hC080;		// non-simulatable
parameter STARTUP_WAIT = "FALSE";		// non-simulatable

input  CLKIN, CLKFB, RST;
output CLK0, CLK90, CLK180, CLK270, CLK2X, CLKDV, LOCKED;

endmodule
