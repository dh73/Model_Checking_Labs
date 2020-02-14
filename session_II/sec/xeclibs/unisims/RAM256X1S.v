// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM256X1S.v,v 1.1 2007/05/02 17:34:43 vandanad Exp $
/*

FUNCTION	: Static Synchronous RAM 256-Deep by 1-Wide

*/

module RAM256X1S (O, A, D, WCLK, WE);

    parameter INIT = 256'h0;

    output O;

    input  [7:0] A;
    input  D;
    input  WCLK;
    input  WE;

    reg  [255:0] mem;

    //synopsys translate_off
    initial
         mem = INIT;
    //synopsys translate_on

    assign O = mem[A];

    always @(posedge WCLK) 
	if (WE == 1'b1)
	    mem[A] <= D;


endmodule

