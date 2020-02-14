// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/DCM_ADV.v,v 1.3 2008/08/11 22:17:43 vandanad Exp $

`timescale  1 ps / 1 ps

module DCM_ADV (
        CLK0,
        CLK180,
        CLK270,
        CLK2X,
        CLK2X180,
        CLK90,
        CLKDV,
        CLKFX,
        CLKFX180,
        DO,
        DRDY,
        LOCKED,
        PSDONE,
        CLKFB,
        CLKIN,
        DADDR,
        DCLK,
        DEN,
        DI,
        DWE,
        PSCLK,
        PSEN,
        PSINCDEC,
        RST
);

parameter CLKDV_DIVIDE = 2.0;
parameter CLKFX_DIVIDE = 1;
parameter CLKFX_MULTIPLY = 4;
parameter CLKIN_DIVIDE_BY_2 = "FALSE";
parameter CLKIN_PERIOD = 10.0;                  // non-simulatable
parameter CLKOUT_PHASE_SHIFT = "NONE";
parameter CLK_FEEDBACK = "1X";
parameter DCM_AUTOCALIBRATION = "TRUE";
parameter DCM_PERFORMANCE_MODE = "MAX_SPEED";   // non-simulatable
parameter DESKEW_ADJUST = "SYSTEM_SYNCHRONOUS"; // non-simulatable
parameter DFS_FREQUENCY_MODE = "LOW";
parameter DLL_FREQUENCY_MODE = "LOW";
parameter DUTY_CYCLE_CORRECTION = "TRUE";
parameter FACTORY_JF = 16'hF0F0;                // non-simulatable
parameter PHASE_SHIFT = 0;
parameter SIM_DEVICE ="VIRTEX4";
parameter STARTUP_WAIT = "FALSE";               // non-simulatable

output CLK0;
output CLK180;
output CLK270;
output CLK2X180;
output CLK2X;
output CLK90;
output CLKDV;
output CLKFX180;
output CLKFX;
output DRDY;
output LOCKED;
output PSDONE;
output [15:0] DO;

input CLKFB;
input CLKIN;
input DCLK;
input DEN;
input DWE;
input PSCLK;
input PSEN;
input PSINCDEC;
input RST;
input [15:0] DI;
input [6:0] DADDR;

endmodule
