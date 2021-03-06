// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/SRLC16_1.v,v 1.1 2005/05/10 01:20:09 wloo Exp $

/*

FUNCTION	: 16 bit Shift Register LUT with Carry Negative_edge Clock and Clock Enable

*/

//`celldefine
`timescale  100 ps / 10 ps

module SRLC16_1 (Q, Q15, A0, A1, A2, A3, CLK, D);

    parameter INIT = 16'h0000;

    output Q, Q15;

    input  A0, A1, A2, A3, CLK, D;

    reg  [5:0]  count;
    reg  [15:0] data;
    wire [3:0]  addr;
    wire	clk_;
    wire	q_int;

    buf b_a3 (addr[3], A3);
    buf b_a2 (addr[2], A2);
    buf b_a1 (addr[1], A1);
    buf b_a0 (addr[0], A0);

    assign Q = data[addr];
    assign Q15 = data[15];

    not i_c (clk_, CLK);

// synopsys translate_off
    initial begin
	for (count = 0; count < 16; count = count + 1)
	    data[count] <= INIT[count];
    end
// synopsys translate_on

    always @(posedge clk_) begin
	{data[15:0]} <= {data[14:0], D};
    end

endmodule
