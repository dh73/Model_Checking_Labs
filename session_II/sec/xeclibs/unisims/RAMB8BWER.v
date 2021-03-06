// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAMB8BWER.v,v 1.5 2011/09/07 23:47:49 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2008 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
 //  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component 8K-Bit Data and
//  /   /                       1K-Bit Parity Dual Port Block RAM.
// /___/   /\     Filename : RAMB8BWER.v
// \   \  /  \    Timestamp : Tue Apr 29 17:59:57 PDT 2008
//  \___\/\___\
//
// Revision:
//    04/29/08 - Initial version.
// End Revision

`timescale 1 ps/1 ps

module RAMB8BWER (DOADO, DOBDO, DOPADOP, DOPBDOP, 
		  ADDRAWRADDR, ADDRBRDADDR, CLKAWRCLK, CLKBRDCLK, DIADI, DIBDI, DIPADIP, DIPBDIP, ENAWREN, ENBRDEN, REGCEA, REGCEBREGCE, RSTA, RSTBRST, WEAWEL, WEBWEU);

    output [15:0] DOADO;
    output [15:0] DOBDO;
    output [1:0] DOPADOP;
    output [1:0] DOPBDOP;
  
    input [12:0] ADDRAWRADDR;
    input [12:0] ADDRBRDADDR;
    input CLKAWRCLK;
    input CLKBRDCLK;
    input [15:0] DIADI;
    input [15:0] DIBDI;
    input [1:0] DIPADIP;
    input [1:0] DIPBDIP;
    input ENAWREN;
    input ENBRDEN;
    input REGCEA;
    input REGCEBREGCE;
    input RSTA;
    input RSTBRST;
    input [1:0] WEAWEL;
    input [1:0] WEBWEU;

    parameter integer DATA_WIDTH_A = 0;
    parameter integer DATA_WIDTH_B = 0;
    parameter integer DOA_REG = 0;
    parameter integer DOB_REG = 0;
    parameter EN_RSTRAM_A = "TRUE";
    parameter EN_RSTRAM_B = "TRUE";
    parameter INITP_00 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
    parameter INITP_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
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
    parameter INIT_A = 18'h0;
    parameter INIT_B = 18'h0;
    parameter INIT_FILE = "NONE";
    parameter RAM_MODE = "TDP";
    parameter RSTTYPE = "SYNC";
    parameter RST_PRIORITY_A = "CE";
    parameter RST_PRIORITY_B = "CE";
    parameter SETUP_ALL = 1000;
    parameter SETUP_READ_FIRST = 3000;
    parameter SIM_COLLISION_CHECK = "ALL";
    parameter SRVAL_A = 18'h0;
    parameter SRVAL_B = 18'h0;
    parameter WRITE_MODE_A = "WRITE_FIRST";
    parameter WRITE_MODE_B = "WRITE_FIRST";

    
    wire [15:0] addrawraddr_in, addrbrdaddr_in;
    wire [12:0] col_addra_reconstruct, col_addrb_reconstruct;
    reg [12:0] 	col_addra_reconstruct_reg, col_addrb_reconstruct_reg;
    
    localparam widest_width = (DATA_WIDTH_A >= DATA_WIDTH_B) ? DATA_WIDTH_A : DATA_WIDTH_B;

    localparam a_width = (DATA_WIDTH_A == 1) ? 1 : (DATA_WIDTH_A == 2) ? 2 : (DATA_WIDTH_A == 4) ? 4 :
			 (DATA_WIDTH_A == 9) ? 8 : (DATA_WIDTH_A == 18) ? 16 : (DATA_WIDTH_A == 36) ? 32 : 32;
    
    localparam b_width = (DATA_WIDTH_B == 1) ? 1 : (DATA_WIDTH_B == 2) ? 2 : (DATA_WIDTH_B == 4) ? 4 :
			 (DATA_WIDTH_B == 9) ? 8 : (DATA_WIDTH_B == 18) ? 16 : (DATA_WIDTH_B == 36) ? 32 : 32;

    localparam a_widthp = (DATA_WIDTH_A == 9) ? 1 : (DATA_WIDTH_A == 18) ? 2 : (DATA_WIDTH_A == 36) ? 4 : 4;
    
    localparam b_widthp = (DATA_WIDTH_B == 9) ? 1 : (DATA_WIDTH_B == 18) ? 2 : (DATA_WIDTH_B == 36) ? 4 : 4;
    
    localparam col_addr_lsb = (widest_width == 1) ? 0 : (widest_width == 2) ? 1 : (widest_width == 4) ? 2 :
			      (widest_width == 9) ? 3 : (widest_width == 18) ? 4 : (widest_width == 36) ? 5 : 0;

    assign col_addra_reconstruct[12:0] = (WRITE_MODE_A == "READ_FIRST" || WRITE_MODE_B == "READ_FIRST") ? 
					 ({addrawraddr_in[12:6],1'b0,addrawraddr_in[4],4'b0}) : addrawraddr_in[12:0];

    assign col_addrb_reconstruct[12:0] = (WRITE_MODE_A == "READ_FIRST" || WRITE_MODE_B == "READ_FIRST") ?
					 ({addrbrdaddr_in[12:6],1'b0,addrbrdaddr_in[4],4'b0}) : addrbrdaddr_in[12:0];
 
    localparam width = (widest_width == 1) ? 1 : (widest_width == 2) ? 2 : (widest_width == 4) ? 4 :
		       (widest_width == 9) ? 8 : (widest_width == 18) ? 16 : (widest_width == 36) ? 32 : 32;
    
    localparam widthp = (widest_width == 9) ? 1 : (widest_width == 18) ? 2 : (widest_width == 36) ? 4 : 4;

    localparam addrawraddr_lbit_124 = (DATA_WIDTH_A == 1) ? 0 : (DATA_WIDTH_A == 2) ? 1 : 
				(DATA_WIDTH_A == 4) ? 2 : (DATA_WIDTH_A == 9) ? 3 : 
				(DATA_WIDTH_A == 18) ? 4 : (DATA_WIDTH_A == 36) ? 5 : 5;
    
    localparam addrbrdaddr_lbit_124 = (DATA_WIDTH_B == 1) ? 0 : (DATA_WIDTH_B == 2) ? 1 : 
				(DATA_WIDTH_B == 4) ? 2 : (DATA_WIDTH_B == 9) ? 3 : 
				(DATA_WIDTH_B == 18) ? 4 : (DATA_WIDTH_B == 36) ? 5 : 5;

    localparam addrawraddr_bit_124 = (DATA_WIDTH_A == 1 && widest_width == 2) ? 0 : (DATA_WIDTH_A == 1 && widest_width == 4) ? 1 : 
			       (DATA_WIDTH_A == 1 && widest_width == 9) ? 2 : (DATA_WIDTH_A == 1 && widest_width == 18) ? 3 :
			       (DATA_WIDTH_A == 1 && widest_width == 36) ? 4 : (DATA_WIDTH_A == 2 && widest_width == 4) ? 1 : 
			       (DATA_WIDTH_A == 2 && widest_width == 9) ? 2 : (DATA_WIDTH_A == 2 && widest_width == 18) ? 3 : 
			       (DATA_WIDTH_A == 2 && widest_width == 36) ? 4 : (DATA_WIDTH_A == 4 && widest_width == 9) ? 2 :
			       (DATA_WIDTH_A == 4 && widest_width == 18) ? 3 : (DATA_WIDTH_A == 4 && widest_width == 36) ? 4 : 5;
    
    localparam addrbrdaddr_bit_124 = (DATA_WIDTH_B == 1 && widest_width == 2) ? 0 : (DATA_WIDTH_B == 1 && widest_width == 4) ? 1 : 
			       (DATA_WIDTH_B == 1 && widest_width == 9) ? 2 : (DATA_WIDTH_B == 1 && widest_width == 18) ? 3 :
			       (DATA_WIDTH_B == 1 && widest_width == 36) ? 4 : (DATA_WIDTH_B == 2 && widest_width == 4) ? 1 : 
			       (DATA_WIDTH_B == 2 && widest_width == 9) ? 2 : (DATA_WIDTH_B == 2 && widest_width == 18) ? 3 : 
			       (DATA_WIDTH_B == 2 && widest_width == 36) ? 4 : (DATA_WIDTH_B == 4 && widest_width == 9) ? 2 :
			       (DATA_WIDTH_B == 4 && widest_width == 18) ? 3 : (DATA_WIDTH_B == 4 && widest_width == 36) ? 4 : 5;
    
    localparam addrawraddr_bit_8 = (DATA_WIDTH_A == 9 && widest_width == 18) ? 3 : (DATA_WIDTH_A == 9 && widest_width == 36) ? 4 : 4;
    
    localparam addrawraddr_bit_16 = 4; // There is only 36 larger than 18

    localparam addrbrdaddr_bit_8 = (DATA_WIDTH_B == 9 && widest_width == 18) ? 3 : (DATA_WIDTH_B == 9 && widest_width == 36) ? 4 : 4;
    
    localparam addrbrdaddr_bit_16 = 4; // There is only 36 larger than 18


    localparam mem_depth = (widest_width == 1) ? 8192 : (widest_width == 2) ? 4096 : (widest_width == 4) ? 2048 : 
			   (widest_width == 9) ? 1024 :(widest_width == 18) ? 512 : (widest_width == 36) ? 256 : 8192;
		
    localparam memp_depth = (widest_width == 9) ? 1024 :(widest_width == 18) ? 512 : (widest_width == 36) ? 256 : 1024;

    localparam INIT_A_int = (RAM_MODE == "SDP" && DATA_WIDTH_A == 36) ? 
			    {INIT_B[17:16],INIT_A[17:16],INIT_B[15:0],INIT_A[15:0]} : INIT_A;
    localparam INIT_B_int = (RAM_MODE == "SDP" && DATA_WIDTH_B == 36) ? 
			    {INIT_B[17:16],INIT_A[17:16],INIT_B[15:0],INIT_A[15:0]} : INIT_B;
    localparam SRVAL_A_int = (RAM_MODE == "SDP" && DATA_WIDTH_A == 36) ? 
			     {SRVAL_B[17:16],SRVAL_A[17:16],SRVAL_B[15:0],SRVAL_A[15:0]} : SRVAL_A;
    localparam SRVAL_B_int = (RAM_MODE == "SDP" && DATA_WIDTH_B == 36) ? 
			     {SRVAL_B[17:16],SRVAL_A[17:16],SRVAL_B[15:0],SRVAL_A[15:0]} : SRVAL_B;
    
    reg [widest_width-1:0] tmp_mem [mem_depth-1:0];
    
    reg [width-1:0] mem [mem_depth-1:0];
    reg [widthp-1:0] memp [memp_depth-1:0];

    integer count, countp, init_mult, initp_mult, large_width;
    integer count1, countp1, i, i1, i_p, i_mem, init_offset, initp_offset;

    reg tmp1;

    reg [31:0] doado_out, doado_buf, doado_outreg, doado_out_out;
    reg [31:0] dobdo_out, dobdo_buf, dobdo_outreg, dobdo_out_out;
    reg [3:0] dopbdop_out, dopbdop_buf, dopbdop_outreg, dopbdop_out_out;
    reg [3:0] dopadop_out, dopadop_buf, dopadop_outreg, dopadop_out_out;

    reg [63:0] di_x = 64'bx;

    reg [7:0] weawel_reg;
    reg enbrden_reg;
    reg [7:0] webweu_reg, webweu_tmp;
    reg rising_clkawrclk = 1'b0, rising_clkbrdclk = 1'b0;
    reg [15:0] addrawraddr_reg, addrbrdaddr_reg, addrawraddr_tmp, addrbrdaddr_tmp;

    reg [63:0] diadi_reg, dibdi_reg;
    reg [3:0] dipadip_reg;
    reg [7:0] dipbdip_reg;
    reg [15:0] addr_tmp;
    reg [7:0] we_tmp;
    reg col_wr_wr_msg = 1, col_wra_rdb_msg = 1, col_wrb_rda_msg = 1;
    

    wire [15:0] dibdi_in;
    wire [15:0] diadi_in;
    wire clkawrclk_in, clkbrdclk_in;

    wire [1:0] dipbdip_in;
    wire [1:0] dipadip_in;
    wire enawren_in, enbrden_in, regcea_in, regcebregce_in, rsta_in, rstbrst_in;
    wire [1:0] weawel_in;
    wire [1:0] webweu_in;

    wire [a_width-1:0] diadi_int;
    wire [b_width-1:0] dibdi_int;
    wire [a_widthp-1:0] dipadip_int;
    wire [b_widthp-1:0] dipbdip_int;
    wire [3:0] weawel_int, webweu_int;
    
    wire [15:0] doado_out_port, dobdo_out_port;
    wire [1:0] dopadop_out_port, dopbdop_out_port;
    
    
    
    assign addrawraddr_in = {3'b000, ADDRAWRADDR};
    assign addrbrdaddr_in = {3'b000, ADDRBRDADDR};
    assign clkawrclk_in = CLKAWRCLK;
    assign clkbrdclk_in = CLKBRDCLK;
    
    assign diadi_in = DIADI;
    assign dibdi_in = DIBDI;
    assign dipadip_in = DIPADIP;
    assign dipbdip_in = DIPBDIP;
    assign DOADO = doado_out_port;
    assign DOPADOP = dopadop_out_port;
    assign DOBDO = dobdo_out_port;
    assign DOPBDOP = dopbdop_out_port;

    assign enawren_in = ENAWREN;
    assign enbrden_in = ENBRDEN;
    assign regcea_in = REGCEA;
    assign regcebregce_in = REGCEBREGCE;
    assign rsta_in = RSTA;
    assign rstbrst_in = RSTBRST;
    assign weawel_in = WEAWEL;
    assign webweu_in = WEBWEU;

    
    generate
        case (RAM_MODE)
	    "TDP" : begin
		        assign dibdi_int = dibdi_in;
		        assign diadi_int = diadi_in;  // 16
		        assign dipbdip_int = dipbdip_in; // 2
		        assign dipadip_int = dipadip_in;
		        assign doado_out_port = doado_out_out;
		        assign dobdo_out_port = dobdo_out_out;
		        assign dopadop_out_port = dopadop_out_out;
		        assign dopbdop_out_port = dopbdop_out_out;
		        assign webweu_int = webweu_in;
		        assign weawel_int = weawel_in;  //2
	            end
	    "SDP" : begin
		        assign dibdi_int = 32'b0;
		        assign diadi_int = {dibdi_in, diadi_in};  // 32
		        assign dipbdip_int = 4'b0;
		        assign dipadip_int = {dipbdip_in, dipadip_in}; // 4
		        assign doado_out_port = dobdo_out_out[15:0];
		        assign dobdo_out_port = dobdo_out_out[31:16];
		        assign dopadop_out_port = dopbdop_out_out[1:0];
		        assign dopbdop_out_port = dopbdop_out_out[3:2];
		        assign webweu_int = 4'b0;
		        assign weawel_int = {webweu_in, weawel_in}; // 4
	            end

	endcase
    endgenerate

   localparam wr_mode_a = (WRITE_MODE_A == "WRITE_FIRST") ? 2'b00 : ((WRITE_MODE_A == "READ_FIRST") ? 2'b01 : 2'b10); //NO_CHANGE = 2'b10
   localparam wr_mode_b = (WRITE_MODE_B == "WRITE_FIRST") ? 2'b00 : ((WRITE_MODE_B == "READ_FIRST") ? 2'b01 : 2'b10); //NO_CHANGE = 2'b10
   localparam ram_mode_int = (RAM_MODE == "TDP") ? 1 : 0;  // tdp = 1, sdp = 0
   localparam rsttype_int = ( RSTTYPE == "SYNC") ? 1 : 0;

	

    always @(rsta_in or enawren_in or regcea_in) begin

	if (rsttype_int == 1 && rsta_in === 1'b1) begin // async reset

	    // reset latch regardless DOA_REG
	    if (((enawren_in == 1'b1 && RST_PRIORITY_A == "CE") || RST_PRIORITY_A == "SR") && EN_RSTRAM_A == "TRUE") begin		    
		    
		doado_buf = SRVAL_A_int[0 +: a_width];
		doado_out = SRVAL_A_int[0 +: a_width];
		    
		if (a_width >= 8) begin
		    dopadop_buf = SRVAL_A_int[a_width +: a_widthp];
		    dopadop_out = SRVAL_A_int[a_width +: a_widthp];
		end
	    end


	    if (DOA_REG == 1) begin

		if ((regcea_in == 1'b1 && RST_PRIORITY_A == "CE") || RST_PRIORITY_A == "SR") begin
		    doado_outreg = SRVAL_A_int[0 +: a_width];
		    
		    if (a_width >= 8)
			dopadop_outreg = SRVAL_A_int[a_width +: a_widthp];
		    
		end
	    end
	end // if (rsttype_int == 1 && rsta_in === 1'b1)

    end // always @ (rsta_in or enawren_in or regcea_in)
    
	    
    always @(rstbrst_in or enbrden_in or regcebregce_in) begin

	if (rsttype_int == 1 && rstbrst_in === 1'b1) begin

	    // reset latch regardless DOB_REG
	    if (((enbrden_in == 1'b1 && RST_PRIORITY_B == "CE") || RST_PRIORITY_B == "SR") && EN_RSTRAM_B == "TRUE") begin		    
		
		dobdo_buf = SRVAL_B_int[0 +: b_width];
		dobdo_out = SRVAL_B_int[0 +: b_width];
		
		if (b_width >= 8) begin
		    dopbdop_buf = SRVAL_B_int[b_width +: b_widthp];
		    dopbdop_out = SRVAL_B_int[b_width +: b_widthp];
		end
	    end
		

	    if (DOB_REG == 1) begin

		if ((regcebregce_in == 1'b1 && RST_PRIORITY_B == "CE") || RST_PRIORITY_B == "SR") begin
		     	   dobdo_outreg = SRVAL_B_int[0 +: b_width];
		    
		    if (b_width >= 8)
		           dopbdop_outreg = SRVAL_B_int[b_width +: b_widthp];
		    
		end
	    end
	end // if (rsttype_int == 1 && rstbrst_in === 1'b1)
    end // always @ (rstbrst_in or enbrden_in or regcebregce_in)
    

    always @(posedge clkawrclk_in) begin

	rising_clkawrclk = 1;
	
	if (enawren_in === 1'b1) begin
	    addrawraddr_reg = addrawraddr_in;
	    weawel_reg = weawel_int;
	    diadi_reg = diadi_int;
	    dipadip_reg = dipadip_int;
	    col_addra_reconstruct_reg = col_addra_reconstruct;
	end

    end

    always @(posedge clkbrdclk_in) begin

	rising_clkbrdclk = 1;
	
	if (enbrden_in === 1'b1) begin
	    addrbrdaddr_reg = addrbrdaddr_in;
	    webweu_reg = webweu_int;
	    enbrden_reg = enbrden_in;
	    dibdi_reg = dibdi_int;
	    dipbdip_reg = dipbdip_int;
	    col_addrb_reconstruct_reg = col_addrb_reconstruct;
	end

    end // always @ (posedge clkbrdclk_in)
    

    always @(posedge rising_clkawrclk) begin

	
/************************************* Collision starts *****************************************/
/*************************************** end collision ********************************/

	
	
/**************************** Port A ****************************************/
	    if (rising_clkawrclk) begin

		if ((enawren_in == 1'b1 && RST_PRIORITY_A == "CE") || RST_PRIORITY_A == "SR") begin
		
		    if (rsta_in == 1'b1 && EN_RSTRAM_A == "TRUE") begin // sync reset
			doado_buf = SRVAL_A_int[0 +: a_width];
			doado_out = SRVAL_A_int[0 +: a_width];
			
			if (a_width >= 8) begin
			    dopadop_buf = SRVAL_A_int[a_width +: a_widthp];
			    dopadop_out = SRVAL_A_int[a_width +: a_widthp];
			end
		    end
		    
			
			if (wr_mode_a == 2'b01 && (rsta_in === 1'b0 || EN_RSTRAM_A == "FALSE")) // read_first
			    task_rd_ram_a (addrawraddr_in, doado_buf, dopadop_buf);
			
			
			if (enawren_in == 1'b1)
			    task_wr_ram_a (weawel_int, diadi_int, dipadip_int, addrawraddr_in); // write
			
			
			if (wr_mode_a != 2'b01 && (rsta_in === 1'b0 || EN_RSTRAM_A == "FALSE")) // !read_first
			    task_rd_ram_a (addrawraddr_in, doado_buf, dopadop_buf);
		    
		end // if ((enawren_in == 1'b1 && RST_PRIORITY_A == "CE") || RST_PRIORITY_A == "SR")

	    end // if (rising_clkawrclk)
	    // end of port A
	   
            // writing outputs of port A	
	    if (enawren_in && (rising_clkawrclk )) begin
	    
		if ((rsta_in === 1'b0 || EN_RSTRAM_A == "FALSE") && (wr_mode_a != 2'b10 || (DATA_WIDTH_A <= 9 && weawel_int[0] === 1'b0) || (DATA_WIDTH_A == 18 && weawel_int[1:0] === 2'b00) || (DATA_WIDTH_A == 36 && weawel_int[3:0] === 4'b0000))) begin
		    
		    doado_out = doado_buf;
		    
		    if (a_width >= 8)
			dopadop_out = dopadop_buf;
		    
		end
		
	    end
	    
	rising_clkawrclk = 0;
    end // always @ (posedge rising_clkawrclk)
/************************************** port B ***************************************************************/	
    always @( posedge rising_clkbrdclk) begin
	    if (rising_clkbrdclk) begin

		if ((enbrden_in == 1'b1 && RST_PRIORITY_B == "CE") || RST_PRIORITY_B == "SR") begin
		    if (rstbrst_in == 1'b1 && EN_RSTRAM_B == "TRUE") begin
			
			dobdo_buf = SRVAL_B_int[0 +: b_width];
			dobdo_out = SRVAL_B_int[0 +: b_width];
			
			if (b_width >= 8) begin
			    dopbdop_buf = SRVAL_B_int[b_width +: b_widthp];
			    dopbdop_out = SRVAL_B_int[b_width +: b_widthp];
			end
			
		    end
		    
			if (wr_mode_b == 2'b01 && (rstbrst_in === 1'b0 || EN_RSTRAM_B == "FALSE")) // read_first
			    task_rd_ram_b (addrbrdaddr_in, dobdo_buf, dopbdop_buf);		
			
			
			if (enbrden_in == 1'b1)
			    task_wr_ram_b (webweu_int, dibdi_int, dipbdip_int, addrbrdaddr_in); // write
			
			
			if (wr_mode_b != 2'b01 && (rstbrst_in === 1'b0 || EN_RSTRAM_B == "FALSE")) // !read_first
			    task_rd_ram_b (addrbrdaddr_in, dobdo_buf, dopbdop_buf);
			
		end // if ((enbrden_in == 1'b1 && RST_PRIORITY_B == "CE") || RST_PRIORITY_B == "SR")
	    
	    end // if (rising_clkbrdclk)
	    // end of port B
	
	    // writing outputs of port B	
	    if (enbrden_in && (rising_clkbrdclk )) begin
		
		if ((rstbrst_in === 1'b0 || EN_RSTRAM_B == "FALSE") && (wr_mode_b != 2'b10 || (DATA_WIDTH_B <= 9 && webweu_int[0] === 1'b0) || (DATA_WIDTH_B == 18 && webweu_int[1:0] === 2'b00) || (DATA_WIDTH_B == 36 && webweu_int[3:0] === 4'b0000))) begin
		    
		    dobdo_out = dobdo_buf;
		    
		    if (b_width >= 8)
			dopbdop_out = dopbdop_buf;
		    
		end
		
	    end

	    
	rising_clkbrdclk = 0;
	
    end // always @ (posedge rising_clkbrdclk)

    
    // ***** Output Registers **** Port A *****
    always @(posedge rising_clkawrclk) begin
	
	if (DOA_REG == 1) begin

		if (RST_PRIORITY_A == "CE") begin
		    if (regcea_in == 1'b1) begin
		    
 			if (rsta_in === 1'b1) begin
			    
			    doado_outreg = SRVAL_A_int[0 +: a_width];
			    
			    if (a_width >= 8)
				dopadop_outreg = SRVAL_A_int[a_width +: a_widthp];
			    
			end
			else if (rsta_in === 1'b0) begin
			
			    doado_outreg = doado_out;

			    if (a_width >= 8)
				dopadop_outreg = dopadop_out;
			    
			end
			
		    end
		end // if (RST_PRIORITY_A == "CE")
		else begin

 		    if (rsta_in === 1'b1) begin
			
			doado_outreg = SRVAL_A_int[0 +: a_width];
			
			if (a_width >= 8)
			    dopadop_outreg = SRVAL_A_int[a_width +: a_widthp];
			
		    end
		    else if (rsta_in === 1'b0) begin
			
			if (regcea_in == 1'b1) begin
			    
			    doado_outreg = doado_out;

			    if (a_width >= 8)
				dopadop_outreg = dopadop_out;
			    
			end
			
		    end
		    
		end
		
	end // if (DOA_REG == 1)

    end // always @ (posedge clkawrclk_in or posedge gsr_in)
    

    always @(doado_out or dopadop_out or doado_outreg or dopadop_outreg) begin

	case (DOA_REG)

	    0 : begin
	            doado_out_out[0 +: a_width] = doado_out[0 +: a_width];

		    if (a_width >= 8)
			dopadop_out_out[0 +: a_widthp] = dopadop_out[0 +: a_widthp];
		
	        end
	    1 : begin
	            doado_out_out[0 +: a_width] = doado_outreg[0 +: a_width];

		    if (a_width >= 8)
			dopadop_out_out[0 +: a_widthp] = dopadop_outreg[0 +: a_widthp];
		
	        end
	endcase

    end // always @ (doado_out or dopadop_out or doado_outreg or dopadop_outreg)
    
    
// ***** Output Registers **** Port B *****
    always @(posedge rising_clkbrdclk ) begin

	if (DOB_REG == 1) begin
	
		if (RST_PRIORITY_B == "CE") begin

		    if (regcebregce_in == 1'b1) begin		 		    
			if (rstbrst_in === 1'b1) begin
			    
			    dobdo_outreg = SRVAL_B_int[0 +: b_width];
			    
			    if (b_width >= 8)
				dopbdop_outreg = SRVAL_B_int[b_width +: b_widthp];
			    
			end
			else if (rstbrst_in === 1'b0) begin
		
			    dobdo_outreg = dobdo_out;

			    if (b_width >= 8)
				dopbdop_outreg = dopbdop_out;
			    
			end
			
		    end

		end // if (RST_PRIORITY_B == "CE")
		else begin
		    
 		    if (rstbrst_in === 1'b1) begin
			
			dobdo_outreg = SRVAL_B_int[0 +: b_width];
			
			if (b_width >= 8)
			    dopbdop_outreg = SRVAL_B_int[b_width +: b_widthp];
			
		    end
		    else if (rstbrst_in === 1'b0) begin
			
			if (regcebregce_in == 1'b1) begin		
			    
			    dobdo_outreg = dobdo_out;

			    if (b_width >= 8)
				dopbdop_outreg = dopbdop_out;
			    
			end
			
		    end

		end // else: !if(RST_PRIORITY_B == "CE")
		
	end // if (DOB_REG == 1)

    end // always @ (posedge clkbrdclk_in or posedge gsr_in)
    

    always @(dobdo_out or dopbdop_out or dobdo_outreg or dopbdop_outreg) begin

	case (DOB_REG)

	    0 : begin
                    dobdo_out_out[0 +: b_width] = dobdo_out[0 +: b_width];

		    if (b_width >= 8) 
			dopbdop_out_out[0 +: b_widthp] = dopbdop_out[0 +: b_widthp];
		
	        end
	    1 : begin
	            dobdo_out_out[0 +: b_width] = dobdo_outreg[0 +: b_width];

		    if (b_width >= 8)
			dopbdop_out_out[0 +: b_widthp] = dopbdop_outreg[0 +: b_widthp];
		
	        end

	endcase

    end // always @ (dobdo_out or dopbdop_out or dobdo_outreg or dopbdop_outreg)

    
/******************************************** task and function **************************************/
	
    task task_ram;

	input we;
	input [7:0] di;
	input dip;
	inout [7:0] mem_task;
	inout memp_task;

	begin

	    if (we == 1'b1) begin

		mem_task = di;
		
		if (width >= 8)
		    memp_task = dip;
	    end
	end

    endtask // task_ram

    
    task task_x_buf;
	input [1:0] wr_rd_mode;
	input integer do_uindex;
	input integer do_lindex;
	input integer dop_index;	
	input [63:0] do_ltmp;
	inout [63:0] do_tmp;
	input [7:0] dop_ltmp;
	inout [7:0] dop_tmp;
	integer i;

	begin

	    if (wr_rd_mode == 2'b01) begin
		for (i = do_lindex; i <= do_uindex; i = i + 1) begin
		    if (do_ltmp[i] === 1'bx)
			do_tmp[i] = 1'bx;
		end
		
		if (dop_ltmp[dop_index] === 1'bx)
		    dop_tmp[dop_index] = 1'bx;
		
	    end // if (wr_rd_mode == 2'b01)
	    else begin
		do_tmp[do_lindex +: 8] = do_ltmp[do_lindex +: 8];
		dop_tmp[dop_index] = dop_ltmp[dop_index];

	    end // else: !if(wr_rd_mode == 2'b01)
	end
	
    endtask // task_x_buf
    
    
    task task_wr_ram_a;

	input [7:0] weawel_tmp;
	input [63:0] diadi_tmp;
	input [7:0] dipadip_tmp;
	input [15:0] addrawraddr_tmp;

	begin
	    
	    case (a_width)

		1, 2, 4 : begin

		              if (a_width >= width)
				  task_ram (weawel_tmp[0], diadi_tmp[a_width-1:0], 1'b0, mem[addrawraddr_tmp[14:addrawraddr_lbit_124]], tmp1);
			      else
				  task_ram (weawel_tmp[0], diadi_tmp[a_width-1:0], 1'b0, mem[addrawraddr_tmp[14:addrawraddr_bit_124+1]][(addrawraddr_tmp[addrawraddr_bit_124:addrawraddr_lbit_124] * a_width) +: a_width], tmp1);

		          end
		8 : begin

		        if (a_width >= width)
			    task_ram (weawel_tmp[0], diadi_tmp[7:0], dipadip_tmp[0], mem[addrawraddr_tmp[14:3]], memp[addrawraddr_tmp[14:3]]);
			else
			    task_ram (weawel_tmp[0], diadi_tmp[7:0], dipadip_tmp[0], mem[addrawraddr_tmp[14:addrawraddr_bit_8+1]][(addrawraddr_tmp[addrawraddr_bit_8:3] * 8) +: 8], memp[addrawraddr_tmp[14:addrawraddr_bit_8+1]][(addrawraddr_tmp[addrawraddr_bit_8:3] * 1) +: 1]);

		    end
		16 : begin

		         if (a_width >= width) begin
				 task_ram (weawel_tmp[0], diadi_tmp[7:0], dipadip_tmp[0], mem[addrawraddr_tmp[14:4]][0 +: 8], memp[addrawraddr_tmp[14:4]][0:0]);
				 task_ram (weawel_tmp[1], diadi_tmp[15:8], dipadip_tmp[1], mem[addrawraddr_tmp[14:4]][8 +: 8], memp[addrawraddr_tmp[14:4]][1:1]);
			 end 
			 else begin
				 task_ram (weawel_tmp[0], diadi_tmp[7:0], dipadip_tmp[0], mem[addrawraddr_tmp[14:addrawraddr_bit_16+1]][(addrawraddr_tmp[addrawraddr_bit_16:4] * 16) +: 8], memp[addrawraddr_tmp[14:addrawraddr_bit_16+1]][(addrawraddr_tmp[addrawraddr_bit_16:4] * 2) +: 1]);
				 task_ram (weawel_tmp[1], diadi_tmp[15:8], dipadip_tmp[1], mem[addrawraddr_tmp[14:addrawraddr_bit_16+1]][((addrawraddr_tmp[addrawraddr_bit_16:4] * 16) + 8) +: 8], memp[addrawraddr_tmp[14:addrawraddr_bit_16+1]][((addrawraddr_tmp[addrawraddr_bit_16:4] * 2) + 1) +: 1]);
			 end // else: !if(a_width >= b_width)

		    end // case: 16
		32 : begin

		         task_ram (weawel_tmp[0], diadi_tmp[7:0], dipadip_tmp[0], mem[addrawraddr_tmp[14:5]][0 +: 8], memp[addrawraddr_tmp[14:5]][0:0]);
		         task_ram (weawel_tmp[1], diadi_tmp[15:8], dipadip_tmp[1], mem[addrawraddr_tmp[14:5]][8 +: 8], memp[addrawraddr_tmp[14:5]][1:1]);
		         task_ram (weawel_tmp[2], diadi_tmp[23:16], dipadip_tmp[2], mem[addrawraddr_tmp[14:5]][16 +: 8], memp[addrawraddr_tmp[14:5]][2:2]);
		         task_ram (weawel_tmp[3], diadi_tmp[31:24], dipadip_tmp[3], mem[addrawraddr_tmp[14:5]][24 +: 8], memp[addrawraddr_tmp[14:5]][3:3]);
		    
		     end // case: 32
	    endcase // case(a_width)
	end
	
    endtask // task_wr_ram_a
    
    
    task task_wr_ram_b;

	input [7:0] webweu_tmp;
	input [63:0] dibdi_tmp;
	input [7:0] dipbdip_tmp;
	input [15:0] addrbrdaddr_tmp;

	begin
	    
	    case (b_width)

		1, 2, 4 : begin

		              if (b_width >= width)
				  task_ram (webweu_tmp[0], dibdi_tmp[b_width-1:0], 1'b0, mem[addrbrdaddr_tmp[14:addrbrdaddr_lbit_124]], tmp1);
			      else
				  task_ram (webweu_tmp[0], dibdi_tmp[b_width-1:0], 1'b0, mem[addrbrdaddr_tmp[14:addrbrdaddr_bit_124+1]][(addrbrdaddr_tmp[addrbrdaddr_bit_124:addrbrdaddr_lbit_124] * b_width) +: b_width], tmp1);
		          end
		8 : begin

		        if (b_width >= width)
			    task_ram (webweu_tmp[0], dibdi_tmp[7:0], dipbdip_tmp[0], mem[addrbrdaddr_tmp[14:3]], memp[addrbrdaddr_tmp[14:3]]);
			else
			    task_ram (webweu_tmp[0], dibdi_tmp[7:0], dipbdip_tmp[0], mem[addrbrdaddr_tmp[14:addrbrdaddr_bit_8+1]][(addrbrdaddr_tmp[addrbrdaddr_bit_8:3] * 8) +: 8], memp[addrbrdaddr_tmp[14:addrbrdaddr_bit_8+1]][(addrbrdaddr_tmp[addrbrdaddr_bit_8:3] * 1) +: 1]);

		    end
		16 : begin

		         if (b_width >= width) begin
			     task_ram (webweu_tmp[0], dibdi_tmp[7:0], dipbdip_tmp[0], mem[addrbrdaddr_tmp[14:4]][0 +: 8], memp[addrbrdaddr_tmp[14:4]][0:0]);
			     task_ram (webweu_tmp[1], dibdi_tmp[15:8], dipbdip_tmp[1], mem[addrbrdaddr_tmp[14:4]][8 +: 8], memp[addrbrdaddr_tmp[14:4]][1:1]);
			 end 
			 else begin
			     task_ram (webweu_tmp[0], dibdi_tmp[7:0], dipbdip_tmp[0], mem[addrbrdaddr_tmp[14:addrbrdaddr_bit_16+1]][(addrbrdaddr_tmp[addrbrdaddr_bit_16:4] * 16) +: 8], memp[addrbrdaddr_tmp[14:addrbrdaddr_bit_16+1]][(addrbrdaddr_tmp[addrbrdaddr_bit_16:4] * 2) +: 1]);
			     task_ram (webweu_tmp[1], dibdi_tmp[15:8], dipbdip_tmp[1], mem[addrbrdaddr_tmp[14:addrbrdaddr_bit_16+1]][((addrbrdaddr_tmp[addrbrdaddr_bit_16:4] * 16) + 8) +: 8], memp[addrbrdaddr_tmp[14:addrbrdaddr_bit_16+1]][((addrbrdaddr_tmp[addrbrdaddr_bit_16:4] * 2) + 1) +: 1]);
			 end

 		     end // case: 16
		32 : begin

		         task_ram (webweu_tmp[0], dibdi_tmp[7:0], dipbdip_tmp[0], mem[addrbrdaddr_tmp[14:5]][0 +: 8], memp[addrbrdaddr_tmp[14:5]][0:0]);
		         task_ram (webweu_tmp[1], dibdi_tmp[15:8], dipbdip_tmp[1], mem[addrbrdaddr_tmp[14:5]][8 +: 8], memp[addrbrdaddr_tmp[14:5]][1:1]);
		         task_ram (webweu_tmp[2], dibdi_tmp[23:16], dipbdip_tmp[2], mem[addrbrdaddr_tmp[14:5]][16 +: 8], memp[addrbrdaddr_tmp[14:5]][2:2]);
		         task_ram (webweu_tmp[3], dibdi_tmp[31:24], dipbdip_tmp[3], mem[addrbrdaddr_tmp[14:5]][24 +: 8], memp[addrbrdaddr_tmp[14:5]][3:3]);
		    
		     end // case: 32
	    endcase // case(b_width)
	end
	
    endtask // task_wr_ram_b

    
    task task_rd_ram_a;

	input [15:0] addrawraddr_tmp;
	inout [63:0] doado_tmp;
	inout [7:0] dopadop_tmp;

	begin

	    case (a_width)
		1, 2, 4 : begin
		              if (a_width >= width)
				  doado_tmp = mem[addrawraddr_tmp[14:addrawraddr_lbit_124]];

			      else
				  doado_tmp = mem[addrawraddr_tmp[14:addrawraddr_bit_124+1]][(addrawraddr_tmp[addrawraddr_bit_124:addrawraddr_lbit_124] * a_width) +: a_width];
		          end
		8 : begin
		        if (a_width >= width) begin
			    doado_tmp = mem[addrawraddr_tmp[14:3]];
			    dopadop_tmp =  memp[addrawraddr_tmp[14:3]];
			end
			else begin
			    doado_tmp = mem[addrawraddr_tmp[14:addrawraddr_bit_8+1]][(addrawraddr_tmp[addrawraddr_bit_8:3] * 8) +: 8];
			    dopadop_tmp = memp[addrawraddr_tmp[14:addrawraddr_bit_8+1]][(addrawraddr_tmp[addrawraddr_bit_8:3] * 1) +: 1];
			end
		    end
		16 : begin
		         if (a_width >= width) begin
			     doado_tmp = mem[addrawraddr_tmp[14:4]];
			     dopadop_tmp = memp[addrawraddr_tmp[14:4]];
			 end 
			 else begin
			     doado_tmp = mem[addrawraddr_tmp[14:addrawraddr_bit_16+1]][(addrawraddr_tmp[addrawraddr_bit_16:4] * 16) +: 16];
			     dopadop_tmp = memp[addrawraddr_tmp[14:addrawraddr_bit_16+1]][(addrawraddr_tmp[addrawraddr_bit_16:4] * 2) +: 2];
			 end
		     end
		32 : begin
		         if (a_width >= width) begin
			     doado_tmp = mem[addrawraddr_tmp[14:5]];
			     dopadop_tmp = memp[addrawraddr_tmp[14:5]];
			 end 
		     end

	    endcase // case(a_width)

	end
    endtask // task_rd_ram_a
    

    task task_rd_ram_b;

	input [15:0] addrbrdaddr_tmp;
	inout [31:0] dobdo_tmp;
	inout [3:0] dopbdop_tmp;

	begin
	    
	    case (b_width)
		1, 2, 4 : begin
		              if (b_width >= width)
				  dobdo_tmp = mem[addrbrdaddr_tmp[14:addrbrdaddr_lbit_124]];
			      else
				  dobdo_tmp = mem[addrbrdaddr_tmp[14:addrbrdaddr_bit_124+1]][(addrbrdaddr_tmp[addrbrdaddr_bit_124:addrbrdaddr_lbit_124] * b_width) +: b_width];
               	          end
		8 : begin
		        if (b_width >= width) begin
			    dobdo_tmp = mem[addrbrdaddr_tmp[14:3]];
			    dopbdop_tmp =  memp[addrbrdaddr_tmp[14:3]];
			end
			else begin
			    dobdo_tmp = mem[addrbrdaddr_tmp[14:addrbrdaddr_bit_8+1]][(addrbrdaddr_tmp[addrbrdaddr_bit_8:3] * 8) +: 8];
			    dopbdop_tmp = memp[addrbrdaddr_tmp[14:addrbrdaddr_bit_8+1]][(addrbrdaddr_tmp[addrbrdaddr_bit_8:3] * 1) +: 1];
			end
		    end
		16 : begin
		         if (b_width >= width) begin
			     dobdo_tmp = mem[addrbrdaddr_tmp[14:4]];
			     dopbdop_tmp = memp[addrbrdaddr_tmp[14:4]];
			 end 
			 else begin
			     dobdo_tmp = mem[addrbrdaddr_tmp[14:addrbrdaddr_bit_16+1]][(addrbrdaddr_tmp[addrbrdaddr_bit_16:4] * 16) +: 16];
			     dopbdop_tmp = memp[addrbrdaddr_tmp[14:addrbrdaddr_bit_16+1]][(addrbrdaddr_tmp[addrbrdaddr_bit_16:4] * 2) +: 2];
			 end
		      end
		32 : begin
		         dobdo_tmp = mem[addrbrdaddr_tmp[14:5]];
		         dopbdop_tmp = memp[addrbrdaddr_tmp[14:5]];
		     end
		
	    endcase
	end
    endtask // task_rd_ram_b    

 endmodule // RAMB8BWER
