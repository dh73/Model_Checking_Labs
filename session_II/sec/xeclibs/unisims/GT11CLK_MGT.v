// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/GT11CLK_MGT.v,v 1.1 2005/05/10 01:20:04 wloo Exp $

`timescale 1 ps / 1 ps 

module GT11CLK_MGT (
	SYNCLK1OUT,
	SYNCLK2OUT,
	MGTCLKN,
	MGTCLKP
);

parameter SYNCLK1OUTEN = "ENABLE";
parameter SYNCLK2OUTEN = "DISABLE";


output SYNCLK1OUT;
output SYNCLK2OUT;

input MGTCLKN;
input MGTCLKP;


GT11CLK gt11clk_1 (
	.MGTCLKN (MGTCLKN),
	.MGTCLKP (MGTCLKP),
	.SYNCLK1OUT (SYNCLK1OUT),
	.SYNCLK2OUT (SYNCLK2OUT),
	.REFCLK(1'b0),
	.RXBCLK(1'b0),
	.SYNCLK1IN(1'b0),
	.SYNCLK2IN(1'b0)
);

defparam gt11clk_1.REFCLKSEL = "MGTCLK";
defparam gt11clk_1.SYNCLK1OUTEN = SYNCLK1OUTEN;
defparam gt11clk_1.SYNCLK2OUTEN = SYNCLK2OUTEN;

endmodule
