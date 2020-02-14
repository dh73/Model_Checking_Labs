// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ramb16_s36_int.v,v 1.1 2005/05/10 01:20:09 wloo Exp $

/*

FUNCTION	: 16x36 Block RAM with synchronous write capability

*/

`celldefine
`timescale  100 ps / 10 ps

module ramb16_s36_int (DO, DOP, ADDR, CLK, DI, DIP, EN, SSR, WE);

    parameter INIT = 36'h0;
    parameter SRVAL = 36'h0;
    parameter WRITE_MODE = "WRITE_FIRST";

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
    parameter INIT_10 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_11 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_12 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_13 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_14 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_15 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_16 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_17 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_18 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_19 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_1F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_20 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_21 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_22 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_23 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_24 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_25 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_26 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_27 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_28 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_29 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_2F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_30 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_31 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_32 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_33 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_34 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_35 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_36 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_37 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_38 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_39 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3A = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3B = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3C = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3D = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3E = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INIT_3F = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_04 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_05 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_06 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_07 = 256'h0000000000000000000000000000000000000000000000000000000000000000;

    output [31:0] DO;
    output [3:0] DOP;
    reg [31:0] DO;
    reg [3:0] DOP;

    input [8:0] ADDR;
    input [31:0] DI;
    input [3:0] DIP;
    input EN, CLK, WE, SSR;

// synopsys translate_off
    reg [18431:0] mem;
    reg [8:0] count;
    reg [1:0] wr_mode;

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
	    mem[256 * 16 + count] <= INIT_10[count];
	    mem[256 * 17 + count] <= INIT_11[count];
	    mem[256 * 18 + count] <= INIT_12[count];
	    mem[256 * 19 + count] <= INIT_13[count];
	    mem[256 * 20 + count] <= INIT_14[count];
	    mem[256 * 21 + count] <= INIT_15[count];
	    mem[256 * 22 + count] <= INIT_16[count];
	    mem[256 * 23 + count] <= INIT_17[count];
	    mem[256 * 24 + count] <= INIT_18[count];
	    mem[256 * 25 + count] <= INIT_19[count];
	    mem[256 * 26 + count] <= INIT_1A[count];
	    mem[256 * 27 + count] <= INIT_1B[count];
	    mem[256 * 28 + count] <= INIT_1C[count];
	    mem[256 * 29 + count] <= INIT_1D[count];
	    mem[256 * 30 + count] <= INIT_1E[count];
	    mem[256 * 31 + count] <= INIT_1F[count];
	    mem[256 * 32 + count] <= INIT_20[count];
	    mem[256 * 33 + count] <= INIT_21[count];
	    mem[256 * 34 + count] <= INIT_22[count];
	    mem[256 * 35 + count] <= INIT_23[count];
	    mem[256 * 36 + count] <= INIT_24[count];
	    mem[256 * 37 + count] <= INIT_25[count];
	    mem[256 * 38 + count] <= INIT_26[count];
	    mem[256 * 39 + count] <= INIT_27[count];
	    mem[256 * 40 + count] <= INIT_28[count];
	    mem[256 * 41 + count] <= INIT_29[count];
	    mem[256 * 42 + count] <= INIT_2A[count];
	    mem[256 * 43 + count] <= INIT_2B[count];
	    mem[256 * 44 + count] <= INIT_2C[count];
	    mem[256 * 45 + count] <= INIT_2D[count];
	    mem[256 * 46 + count] <= INIT_2E[count];
	    mem[256 * 47 + count] <= INIT_2F[count];
	    mem[256 * 48 + count] <= INIT_30[count];
	    mem[256 * 49 + count] <= INIT_31[count];
	    mem[256 * 50 + count] <= INIT_32[count];
	    mem[256 * 51 + count] <= INIT_33[count];
	    mem[256 * 52 + count] <= INIT_34[count];
	    mem[256 * 53 + count] <= INIT_35[count];
	    mem[256 * 54 + count] <= INIT_36[count];
	    mem[256 * 55 + count] <= INIT_37[count];
	    mem[256 * 56 + count] <= INIT_38[count];
	    mem[256 * 57 + count] <= INIT_39[count];
	    mem[256 * 58 + count] <= INIT_3A[count];
	    mem[256 * 59 + count] <= INIT_3B[count];
	    mem[256 * 60 + count] <= INIT_3C[count];
	    mem[256 * 61 + count] <= INIT_3D[count];
	    mem[256 * 62 + count] <= INIT_3E[count];
	    mem[256 * 63 + count] <= INIT_3F[count];
	    mem[256 * 64 + count] <= INITP_00[count];
	    mem[256 * 65 + count] <= INITP_01[count];
	    mem[256 * 66 + count] <= INITP_02[count];
	    mem[256 * 67 + count] <= INITP_03[count];
	    mem[256 * 68 + count] <= INITP_04[count];
	    mem[256 * 69 + count] <= INITP_05[count];
	    mem[256 * 70 + count] <= INITP_06[count];
	    mem[256 * 71 + count] <= INITP_07[count];
	end
    end

    initial begin
	case (WRITE_MODE)
	    "WRITE_FIRST" : wr_mode <= 2'b00;
	    "READ_FIRST"  : wr_mode <= 2'b01;
	    "NO_CHANGE"   : wr_mode <= 2'b10;
	    default       : begin
				$display("Error : WRITE_MODE = %s is not WRITE_FIRST, READ_FIRST or NO_CHANGE.", WRITE_MODE);
				$finish;
			    end
	endcase
    end

    always @(posedge CLK) begin
	if (EN == 1'b1) begin
	    if (SSR == 1'b1) begin
		DO[0] <= SRVAL[0];
		DO[1] <= SRVAL[1];
		DO[2] <= SRVAL[2];
		DO[3] <= SRVAL[3];
		DO[4] <= SRVAL[4];
		DO[5] <= SRVAL[5];
		DO[6] <= SRVAL[6];
		DO[7] <= SRVAL[7];
		DO[8] <= SRVAL[8];
		DO[9] <= SRVAL[9];
		DO[10] <= SRVAL[10];
		DO[11] <= SRVAL[11];
		DO[12] <= SRVAL[12];
		DO[13] <= SRVAL[13];
		DO[14] <= SRVAL[14];
		DO[15] <= SRVAL[15];
		DO[16] <= SRVAL[16];
		DO[17] <= SRVAL[17];
		DO[18] <= SRVAL[18];
		DO[19] <= SRVAL[19];
		DO[20] <= SRVAL[20];
		DO[21] <= SRVAL[21];
		DO[22] <= SRVAL[22];
		DO[23] <= SRVAL[23];
		DO[24] <= SRVAL[24];
		DO[25] <= SRVAL[25];
		DO[26] <= SRVAL[26];
		DO[27] <= SRVAL[27];
		DO[28] <= SRVAL[28];
		DO[29] <= SRVAL[29];
		DO[30] <= SRVAL[30];
		DO[31] <= SRVAL[31];
		DOP[0] <= SRVAL[32];
		DOP[1] <= SRVAL[33];
		DOP[2] <= SRVAL[34];
		DOP[3] <= SRVAL[35];
	    end
	    else begin
		if (WE == 1'b1) begin
		    if (wr_mode == 2'b00) begin
			DO[0] <= DI[0];
			DO[1] <= DI[1];
			DO[2] <= DI[2];
			DO[3] <= DI[3];
			DO[4] <= DI[4];
			DO[5] <= DI[5];
			DO[6] <= DI[6];
			DO[7] <= DI[7];
			DO[8] <= DI[8];
			DO[9] <= DI[9];
			DO[10] <= DI[10];
			DO[11] <= DI[11];
			DO[12] <= DI[12];
			DO[13] <= DI[13];
			DO[14] <= DI[14];
			DO[15] <= DI[15];
			DO[16] <= DI[16];
			DO[17] <= DI[17];
			DO[18] <= DI[18];
			DO[19] <= DI[19];
			DO[20] <= DI[20];
			DO[21] <= DI[21];
			DO[22] <= DI[22];
			DO[23] <= DI[23];
			DO[24] <= DI[24];
			DO[25] <= DI[25];
			DO[26] <= DI[26];
			DO[27] <= DI[27];
			DO[28] <= DI[28];
			DO[29] <= DI[29];
			DO[30] <= DI[30];
			DO[31] <= DI[31];
			DOP[0] <= DIP[0];
			DOP[1] <= DIP[1];
			DOP[2] <= DIP[2];
			DOP[3] <= DIP[3];
		    end
		    else if (wr_mode == 2'b01) begin
			DO[0] <= mem[ADDR * 32 + 0];
			DO[1] <= mem[ADDR * 32 + 1];
			DO[2] <= mem[ADDR * 32 + 2];
			DO[3] <= mem[ADDR * 32 + 3];
			DO[4] <= mem[ADDR * 32 + 4];
			DO[5] <= mem[ADDR * 32 + 5];
			DO[6] <= mem[ADDR * 32 + 6];
			DO[7] <= mem[ADDR * 32 + 7];
			DO[8] <= mem[ADDR * 32 + 8];
			DO[9] <= mem[ADDR * 32 + 9];
			DO[10] <= mem[ADDR * 32 + 10];
			DO[11] <= mem[ADDR * 32 + 11];
			DO[12] <= mem[ADDR * 32 + 12];
			DO[13] <= mem[ADDR * 32 + 13];
			DO[14] <= mem[ADDR * 32 + 14];
			DO[15] <= mem[ADDR * 32 + 15];
			DO[16] <= mem[ADDR * 32 + 16];
			DO[17] <= mem[ADDR * 32 + 17];
			DO[18] <= mem[ADDR * 32 + 18];
			DO[19] <= mem[ADDR * 32 + 19];
			DO[20] <= mem[ADDR * 32 + 20];
			DO[21] <= mem[ADDR * 32 + 21];
			DO[22] <= mem[ADDR * 32 + 22];
			DO[23] <= mem[ADDR * 32 + 23];
			DO[24] <= mem[ADDR * 32 + 24];
			DO[25] <= mem[ADDR * 32 + 25];
			DO[26] <= mem[ADDR * 32 + 26];
			DO[27] <= mem[ADDR * 32 + 27];
			DO[28] <= mem[ADDR * 32 + 28];
			DO[29] <= mem[ADDR * 32 + 29];
			DO[30] <= mem[ADDR * 32 + 30];
			DO[31] <= mem[ADDR * 32 + 31];
			DOP[0] <= mem[16384 + ADDR * 4 + 0];
			DOP[1] <= mem[16384 + ADDR * 4 + 1];
			DOP[2] <= mem[16384 + ADDR * 4 + 2];
			DOP[3] <= mem[16384 + ADDR * 4 + 3];
		    end
		end
		else begin
		    DO[0] <= mem[ADDR * 32 + 0];
		    DO[1] <= mem[ADDR * 32 + 1];
		    DO[2] <= mem[ADDR * 32 + 2];
		    DO[3] <= mem[ADDR * 32 + 3];
		    DO[4] <= mem[ADDR * 32 + 4];
		    DO[5] <= mem[ADDR * 32 + 5];
		    DO[6] <= mem[ADDR * 32 + 6];
		    DO[7] <= mem[ADDR * 32 + 7];
		    DO[8] <= mem[ADDR * 32 + 8];
		    DO[9] <= mem[ADDR * 32 + 9];
		    DO[10] <= mem[ADDR * 32 + 10];
		    DO[11] <= mem[ADDR * 32 + 11];
		    DO[12] <= mem[ADDR * 32 + 12];
		    DO[13] <= mem[ADDR * 32 + 13];
		    DO[14] <= mem[ADDR * 32 + 14];
		    DO[15] <= mem[ADDR * 32 + 15];
		    DO[16] <= mem[ADDR * 32 + 16];
		    DO[17] <= mem[ADDR * 32 + 17];
		    DO[18] <= mem[ADDR * 32 + 18];
		    DO[19] <= mem[ADDR * 32 + 19];
		    DO[20] <= mem[ADDR * 32 + 20];
		    DO[21] <= mem[ADDR * 32 + 21];
		    DO[22] <= mem[ADDR * 32 + 22];
		    DO[23] <= mem[ADDR * 32 + 23];
		    DO[24] <= mem[ADDR * 32 + 24];
		    DO[25] <= mem[ADDR * 32 + 25];
		    DO[26] <= mem[ADDR * 32 + 26];
		    DO[27] <= mem[ADDR * 32 + 27];
		    DO[28] <= mem[ADDR * 32 + 28];
		    DO[29] <= mem[ADDR * 32 + 29];
		    DO[30] <= mem[ADDR * 32 + 30];
		    DO[31] <= mem[ADDR * 32 + 31];
		    DOP[0] <= mem[16384 + ADDR * 4 + 0];
		    DOP[1] <= mem[16384 + ADDR * 4 + 1];
		    DOP[2] <= mem[16384 + ADDR * 4 + 2];
		    DOP[3] <= mem[16384 + ADDR * 4 + 3];
		end
	    end
	end
    end

    always @(posedge CLK) begin
	if (EN == 1'b1 && WE == 1'b1) begin
	    mem[ADDR * 32 + 0] <= DI[0];
	    mem[ADDR * 32 + 1] <= DI[1];
	    mem[ADDR * 32 + 2] <= DI[2];
	    mem[ADDR * 32 + 3] <= DI[3];
	    mem[ADDR * 32 + 4] <= DI[4];
	    mem[ADDR * 32 + 5] <= DI[5];
	    mem[ADDR * 32 + 6] <= DI[6];
	    mem[ADDR * 32 + 7] <= DI[7];
	    mem[ADDR * 32 + 8] <= DI[8];
	    mem[ADDR * 32 + 9] <= DI[9];
	    mem[ADDR * 32 + 10] <= DI[10];
	    mem[ADDR * 32 + 11] <= DI[11];
	    mem[ADDR * 32 + 12] <= DI[12];
	    mem[ADDR * 32 + 13] <= DI[13];
	    mem[ADDR * 32 + 14] <= DI[14];
	    mem[ADDR * 32 + 15] <= DI[15];
	    mem[ADDR * 32 + 16] <= DI[16];
	    mem[ADDR * 32 + 17] <= DI[17];
	    mem[ADDR * 32 + 18] <= DI[18];
	    mem[ADDR * 32 + 19] <= DI[19];
	    mem[ADDR * 32 + 20] <= DI[20];
	    mem[ADDR * 32 + 21] <= DI[21];
	    mem[ADDR * 32 + 22] <= DI[22];
	    mem[ADDR * 32 + 23] <= DI[23];
	    mem[ADDR * 32 + 24] <= DI[24];
	    mem[ADDR * 32 + 25] <= DI[25];
	    mem[ADDR * 32 + 26] <= DI[26];
	    mem[ADDR * 32 + 27] <= DI[27];
	    mem[ADDR * 32 + 28] <= DI[28];
	    mem[ADDR * 32 + 29] <= DI[29];
	    mem[ADDR * 32 + 30] <= DI[30];
	    mem[ADDR * 32 + 31] <= DI[31];
	    mem[16384 + ADDR * 4 + 0] <= DIP[0];
	    mem[16384 + ADDR * 4 + 1] <= DIP[1];
	    mem[16384 + ADDR * 4 + 2] <= DIP[2];
	    mem[16384 + ADDR * 4 + 3] <= DIP[3];
	end
    end
// synopsys translate_on

endmodule
