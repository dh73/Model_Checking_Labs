// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/SRLC32E.v,v 1.1 2007/05/02 17:37:39 vandanad Exp $
/*

FUNCTION	: 32-Bit Shift Register Look-Up-Table with Carry and Clock Enable

*/

`timescale  100 ps / 10 ps

module SRLC32E (Q, Q31, A, CE, CLK, D);

    parameter INIT = 32'h00000000;

    output Q;
    output Q31;

    input  [4:0] A;
    input  CE, CLK, D;

    reg  [31:0] data;
    reg  [6:0]  count;
    wire [4:0]  addr;

    
    buf b_a4 (addr[4], A[4]);
    buf b_a3 (addr[3], A[3]);
    buf b_a2 (addr[2], A[2]);
    buf b_a1 (addr[1], A[1]);
    buf b_a0 (addr[0], A[0]);



    assign  Q = data[addr];
    assign  Q31 = data[31];

    // synopsys translate_off
    initial begin
	for (count = 0; count < 32; count = count + 1)
	    data[count] <= INIT[count];
    end
   // synopsys translate_on

    always @(posedge CLK)
	if (CE == 1'b1) 
	    data <=  {data[30:0], D};


endmodule

