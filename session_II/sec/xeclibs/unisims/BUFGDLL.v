// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/BUFGDLL.v,v 1.1 2005/05/10 01:20:03 wloo Exp $

/*

FUNCTION	: BUFGDLL

*/

`celldefine
`timescale  100 ps / 10 ps

module BUFGDLL (O, I);

    output O;
    input  I;

    parameter DUTY_CYCLE_CORRECTION = "TRUE";

    wire clk0_out, clk180_out, clk270_out, clk2x_out;
    wire clk90_out, clkdv_out, locked_out;

    CLKDLL clkdll_inst (.CLK0(clk0_out), .CLK180(clk180_out), .CLK270(clk270_out), .CLK2X(clk2x_out), .CLK90(clk90_out), .CLKDV(clkdv_out), .LOCKED(locked_out), .CLKFB(O), .CLKIN(clkin_int), .RST(1'b0));
    defparam clkdll_inst.DUTY_CYCLE_CORRECTION = DUTY_CYCLE_CORRECTION;

    IBUFG ibufg_inst (.O(clkin_int), .I(I));

    BUFG bufg_inst (.O(O), .I(clk0_out));

endmodule
