// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ramb4_s1_s1_int.v,v 1.1 2005/05/10 01:20:09 wloo Exp $

/*

FUNCTION	: 4x1x1 Block RAM with synchronous write capability

*/

`celldefine
`timescale  100 ps / 10 ps

module ramb4_s1_s1_int (DOA, DOB, ADDRA, ADDRB, CLKA, CLKB, DIA, DIB, ENA, ENB, RSTA, RSTB, WEA, WEB);

    parameter INIT_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_08 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_09 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_0F = 256'h0000000000000000000000000000000000000000000000000000000000000000;

    output [0:0] DOA;
    reg [0:0] DOA;

    input [11:0] ADDRA;
    input [0:0] DIA;
    input ENA, CLKA, WEA, RSTA;

    output [0:0] DOB;
    reg [0:0] DOB;

    input [11:0] ADDRB;
    input [0:0] DIB;
    input ENB, CLKB, WEB, RSTB;

// synopsys translate_off
    reg [4095:0] mem;
    reg [8:0] count;

    initial begin
	for (count = 0; count < 256; count = count + 1) begin
	    mem[count]		  <= INIT_00[count];
	    mem[256 * 1 + count]  <= INIT_01[count];
	    mem[256 * 2 + count]  <= INIT_02[count];
	    mem[256 * 3 + count]  <= INIT_03[count];
	    mem[256 * 4 + count]  <= INIT_04[count];
	    mem[256 * 5 + count]  <= INIT_05[count];
	    mem[256 * 6 + count]  <= INIT_06[count];
	    mem[256 * 7 + count]  <= INIT_07[count];
	    mem[256 * 8 + count]  <= INIT_08[count];
	    mem[256 * 9 + count]  <= INIT_09[count];
	    mem[256 * 10 + count] <= INIT_0A[count];
	    mem[256 * 11 + count] <= INIT_0B[count];
	    mem[256 * 12 + count] <= INIT_0C[count];
	    mem[256 * 13 + count] <= INIT_0D[count];
	    mem[256 * 14 + count] <= INIT_0E[count];
	    mem[256 * 15 + count] <= INIT_0F[count];
	end
    end

    always @(posedge CLKA) begin
	if (ENA == 1'b1) begin
	    if (RSTA == 1'b1) begin
		DOA[0] <= 0;
	    end
	    else if (WEA == 0) begin
		DOA[0] <= mem[ADDRA * 1 + 0];
	    end
	    else begin
		DOA[0] <= DIA[0];
	    end
	end
    end

    always @(posedge CLKA) begin
	if (ENA == 1'b1 && WEA == 1'b1) begin
	    mem[ADDRA * 1 + 0] <= DIA[0];
	end
    end

    always @(posedge CLKB) begin
	if (ENB == 1'b1) begin
	    if (RSTB == 1'b1) begin
		DOB[0] <= 0;
	    end
	    else if (WEB == 0) begin
		DOB[0] <= mem[ADDRB * 1 + 0];
	    end
	    else begin
		DOB[0] <= DIB[0];
	    end
	end
    end

    always @(posedge CLKB) begin
	if (ENB == 1'b1 && WEB == 1'b1) begin
	    mem[ADDRB * 1 + 0] <= DIB[0];
	end
    end
// synopsys translate_on

endmodule
