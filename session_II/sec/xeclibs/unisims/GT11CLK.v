// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/GT11CLK.v,v 1.1 2005/05/10 01:20:04 wloo Exp $

`timescale 1 ps / 1 ps 

module GT11CLK (
	SYNCLK1OUT,
	SYNCLK2OUT,
	MGTCLKN,
	MGTCLKP,
	REFCLK,
	RXBCLK,
	SYNCLK1IN,
	SYNCLK2IN
);

parameter REFCLKSEL = "MGTCLK";
parameter SYNCLK1OUTEN = "ENABLE";
parameter SYNCLK2OUTEN = "DISABLE";

output SYNCLK1OUT;
output SYNCLK2OUT;

input MGTCLKN;
input MGTCLKP;
input REFCLK;
input RXBCLK;
input SYNCLK1IN;
input SYNCLK2IN;

endmodule
