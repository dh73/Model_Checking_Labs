// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/ramb16_s1_s18_int.v,v 1.1 2005/05/10 01:20:09 wloo Exp $

/*

FUNCTION	: 16x1x18 Block RAM with synchronous write capability

*/

`celldefine
`timescale  100 ps / 10 ps

module ramb16_s1_s18_int (DOA, DOB, DOPB, ADDRA, ADDRB, CLKA, CLKB, DIA, DIB, DIPB, ENA, ENB, SSRA, SSRB, WEA, WEB);

    parameter INIT_A = 1'h0;
    parameter INIT_B = 18'h0;
    parameter SRVAL_A = 1'h0;
    parameter SRVAL_B = 18'h0;
    parameter WRITE_MODE_A = "WRITE_FIRST";
    parameter WRITE_MODE_B = "WRITE_FIRST";
//    parameter SETUP_ALL = 10;
//    parameter SETUP_READ_FIRST = 30;

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

    output [0:0] DOA;
    reg [0:0] DOA;

    input [13:0] ADDRA;
    input [0:0] DIA;
    input ENA, CLKA, WEA, SSRA;

    output [15:0] DOB;
    output [1:0] DOPB;
    reg [15:0] DOB;
    reg [1:0] DOPB;

    input [9:0] ADDRB;
    input [15:0] DIB;
    input [1:0] DIPB;
    input ENB, CLKB, WEB, SSRB;

// synopsys translate_off
    reg [18431:0] mem;
    reg [8:0] count;
    reg [1:0] wr_mode_a, wr_mode_b;

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
	case (WRITE_MODE_A)
	    "WRITE_FIRST" : wr_mode_a <= 2'b00;
	    "READ_FIRST"  : wr_mode_a <= 2'b01;
	    "NO_CHANGE"   : wr_mode_a <= 2'b10;
	    default       : begin
				$display("Error : WRITE_MODE_A = %s is not WRITE_FIRST, READ_FIRST or NO_CHANGE.", WRITE_MODE_A);
				$finish;
			    end
	endcase
    end

    initial begin
	case (WRITE_MODE_B)
	    "WRITE_FIRST" : wr_mode_b <= 2'b00;
	    "READ_FIRST"  : wr_mode_b <= 2'b01;
	    "NO_CHANGE"   : wr_mode_b <= 2'b10;
	    default       : begin
				$display("Error : WRITE_MODE_B = %s is not WRITE_FIRST, READ_FIRST or NO_CHANGE.", WRITE_MODE_B);
				$finish;
			    end
	endcase
    end

    // Port A
    always @(posedge CLKA) begin
	if (ENA == 1'b1) begin
	    if (SSRA == 1'b1) begin
		DOA[0] <= SRVAL_A[0];
	    end
	    else begin
		if (WEA == 1'b1) begin
		    if (wr_mode_a == 2'b00) begin
			DOA[0] <= DIA[0];
		    end
		    else if (wr_mode_a == 2'b01) begin
			DOA[0] <= mem[ADDRA * 1 + 0];
		    end
		end
		else begin
		    DOA[0] <= mem[ADDRA * 1 + 0];
		end
	    end
	end
    end

    always @(posedge CLKA) begin
	if (ENA == 1'b1 && WEA == 1'b1) begin
	    mem[ADDRA * 1 + 0] <= DIA[0];
	end
    end

    // Port B
    always @(posedge CLKB) begin
	if (ENB == 1'b1) begin
	    if (SSRB == 1'b1) begin
		DOB[0] <= SRVAL_B[0];
		DOB[1] <= SRVAL_B[1];
		DOB[2] <= SRVAL_B[2];
		DOB[3] <= SRVAL_B[3];
		DOB[4] <= SRVAL_B[4];
		DOB[5] <= SRVAL_B[5];
		DOB[6] <= SRVAL_B[6];
		DOB[7] <= SRVAL_B[7];
		DOB[8] <= SRVAL_B[8];
		DOB[9] <= SRVAL_B[9];
		DOB[10] <= SRVAL_B[10];
		DOB[11] <= SRVAL_B[11];
		DOB[12] <= SRVAL_B[12];
		DOB[13] <= SRVAL_B[13];
		DOB[14] <= SRVAL_B[14];
		DOB[15] <= SRVAL_B[15];
		DOPB[0] <= SRVAL_B[16];
		DOPB[1] <= SRVAL_B[17];
	    end
	    else begin
		if (WEB == 1'b1) begin
		    if (wr_mode_b == 2'b00) begin
			DOB[0] <= DIB[0];
			DOB[1] <= DIB[1];
			DOB[2] <= DIB[2];
			DOB[3] <= DIB[3];
			DOB[4] <= DIB[4];
			DOB[5] <= DIB[5];
			DOB[6] <= DIB[6];
			DOB[7] <= DIB[7];
			DOB[8] <= DIB[8];
			DOB[9] <= DIB[9];
			DOB[10] <= DIB[10];
			DOB[11] <= DIB[11];
			DOB[12] <= DIB[12];
			DOB[13] <= DIB[13];
			DOB[14] <= DIB[14];
			DOB[15] <= DIB[15];
			DOPB[0] <= DIPB[0];
			DOPB[1] <= DIPB[1];
		    end
		    else if (wr_mode_b == 2'b01) begin
			DOB[0] <= mem[ADDRB * 16 + 0];
			DOB[1] <= mem[ADDRB * 16 + 1];
			DOB[2] <= mem[ADDRB * 16 + 2];
			DOB[3] <= mem[ADDRB * 16 + 3];
			DOB[4] <= mem[ADDRB * 16 + 4];
			DOB[5] <= mem[ADDRB * 16 + 5];
			DOB[6] <= mem[ADDRB * 16 + 6];
			DOB[7] <= mem[ADDRB * 16 + 7];
			DOB[8] <= mem[ADDRB * 16 + 8];
			DOB[9] <= mem[ADDRB * 16 + 9];
			DOB[10] <= mem[ADDRB * 16 + 10];
			DOB[11] <= mem[ADDRB * 16 + 11];
			DOB[12] <= mem[ADDRB * 16 + 12];
			DOB[13] <= mem[ADDRB * 16 + 13];
			DOB[14] <= mem[ADDRB * 16 + 14];
			DOB[15] <= mem[ADDRB * 16 + 15];
			DOPB[0] <= mem[16384 + ADDRB * 2 + 0];
			DOPB[1] <= mem[16384 + ADDRB * 2 + 1];
		    end
		end
		else begin
		    DOB[0] <= mem[ADDRB * 16 + 0];
		    DOB[1] <= mem[ADDRB * 16 + 1];
		    DOB[2] <= mem[ADDRB * 16 + 2];
		    DOB[3] <= mem[ADDRB * 16 + 3];
		    DOB[4] <= mem[ADDRB * 16 + 4];
		    DOB[5] <= mem[ADDRB * 16 + 5];
		    DOB[6] <= mem[ADDRB * 16 + 6];
		    DOB[7] <= mem[ADDRB * 16 + 7];
		    DOB[8] <= mem[ADDRB * 16 + 8];
		    DOB[9] <= mem[ADDRB * 16 + 9];
		    DOB[10] <= mem[ADDRB * 16 + 10];
		    DOB[11] <= mem[ADDRB * 16 + 11];
		    DOB[12] <= mem[ADDRB * 16 + 12];
		    DOB[13] <= mem[ADDRB * 16 + 13];
		    DOB[14] <= mem[ADDRB * 16 + 14];
		    DOB[15] <= mem[ADDRB * 16 + 15];
		    DOPB[0] <= mem[16384 + ADDRB * 2 + 0];
		    DOPB[1] <= mem[16384 + ADDRB * 2 + 1];
		end
	    end
	end
    end

    always @(posedge CLKB) begin
	if (ENB == 1'b1 && WEB == 1'b1) begin
	    mem[ADDRB * 16 + 0] <= DIB[0];
	    mem[ADDRB * 16 + 1] <= DIB[1];
	    mem[ADDRB * 16 + 2] <= DIB[2];
	    mem[ADDRB * 16 + 3] <= DIB[3];
	    mem[ADDRB * 16 + 4] <= DIB[4];
	    mem[ADDRB * 16 + 5] <= DIB[5];
	    mem[ADDRB * 16 + 6] <= DIB[6];
	    mem[ADDRB * 16 + 7] <= DIB[7];
	    mem[ADDRB * 16 + 8] <= DIB[8];
	    mem[ADDRB * 16 + 9] <= DIB[9];
	    mem[ADDRB * 16 + 10] <= DIB[10];
	    mem[ADDRB * 16 + 11] <= DIB[11];
	    mem[ADDRB * 16 + 12] <= DIB[12];
	    mem[ADDRB * 16 + 13] <= DIB[13];
	    mem[ADDRB * 16 + 14] <= DIB[14];
	    mem[ADDRB * 16 + 15] <= DIB[15];
	    mem[16384 + ADDRB * 2 + 0] <= DIPB[0];
	    mem[16384 + ADDRB * 2 + 1] <= DIPB[1];
	end
    end
// synopsys translate_on

endmodule
