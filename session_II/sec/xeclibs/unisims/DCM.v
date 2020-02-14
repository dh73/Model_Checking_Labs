// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/DCM.v,v 1.3 2008/08/11 22:17:43 vandanad Exp $

/*

FUNCTION	: Digital Clock Manager

*/

`celldefine
`timescale  1 ps / 1 ps

module DCM (
	CLK0, CLK180, CLK270, CLK2X, CLK2X180, CLK90,
	CLKDV, CLKFX, CLKFX180, LOCKED, PSDONE, STATUS,
	CLKFB, CLKIN, DSSEN, PSCLK, PSEN, PSINCDEC, RST);

parameter CLKDV_DIVIDE = 2.0;
parameter CLKFX_DIVIDE = 1;
parameter CLKFX_MULTIPLY = 4;
parameter CLKIN_DIVIDE_BY_2 = "FALSE";
parameter CLKIN_PERIOD = 10.0;			// non-simulatable
parameter CLKOUT_PHASE_SHIFT = "NONE";
parameter CLK_FEEDBACK = "1X";
parameter DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS";	// non-simulatable
parameter DFS_FREQUENCY_MODE = "LOW";
parameter DLL_FREQUENCY_MODE = "LOW";
parameter DSS_MODE = "NONE";			// non-simulatable
parameter DUTY_CYCLE_CORRECTION = "TRUE";
parameter FACTORY_JF = 16'hC080;		// non-simulatable
parameter PHASE_SHIFT = 0;
parameter STARTUP_WAIT = "FALSE";		// non-simulatable
parameter SIM_MODE = "SAFE";

input CLKFB, CLKIN, DSSEN;
input PSCLK, PSEN, PSINCDEC, RST;

output CLK0, CLK180, CLK270, CLK2X, CLK2X180, CLK90;
output CLKDV, CLKFX, CLKFX180, LOCKED, PSDONE;
output [7:0] STATUS;

endmodule
