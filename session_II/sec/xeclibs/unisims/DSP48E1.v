// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/DSP48E1.v,v 1.5 2011/02/23 23:55:23 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 12.1
//  \   \         Description : Xilinx Formal Verification Library Component DSP48E1
//  /   /                  
// /___/   /\     Filename : DSP48E1.v
// \   \  /  \    Timestamp : Wed Jan  6 16:13:41 PDT 2010
//  \___\/\___\
//
// Revision:
//    01/06/10 - Initial version.
// End Revision

module DSP48E1 (ACOUT, BCOUT, CARRYCASCOUT, CARRYOUT, MULTSIGNOUT, OVERFLOW, P, PATTERNBDETECT, PATTERNDETECT, PCOUT, UNDERFLOW, A, ACIN, ALUMODE, B, BCIN, C, CARRYCASCIN, CARRYIN, CARRYINSEL, CEA1, CEA2, CEAD, CEALUMODE, CEB1, CEB2, CEC, CECARRYIN, CECTRL, CED, CEINMODE, CEM, CEP, CLK, D, INMODE, MULTSIGNIN, OPMODE, PCIN, RSTA, RSTALLCARRYIN, RSTALUMODE, RSTB, RSTC, RSTCTRL, RSTD, RSTINMODE, RSTM, RSTP); 


    parameter integer ACASCREG = 1;
    parameter integer ADREG = 1;
    parameter integer ALUMODEREG = 1;
    parameter integer AREG = 1;
    parameter AUTORESET_PATDET = "NO_RESET";  // {NO_RESET, RESET_MATCH, RESET_NOT_MATCH}
    parameter A_INPUT = "DIRECT";
    parameter integer BCASCREG = 1;
    parameter integer BREG = 1;
    parameter B_INPUT = "DIRECT";
    parameter integer CARRYINREG = 1;
    parameter integer CARRYINSELREG = 1;
    parameter integer CREG = 1;
    parameter integer DREG = 1;
    parameter integer INMODEREG = 1;
    parameter MASK =  48'h3FFFFFFFFFFF;
    parameter integer MREG = 1;
    parameter integer OPMODEREG = 1;
    parameter PATTERN =  48'h000000000000;
    parameter integer PREG = 1;
    parameter SEL_MASK = "MASK";
    parameter SEL_PATTERN = "PATTERN";
    parameter USE_DPORT = "FALSE";
    parameter USE_MULT = "MULTIPLY";
    parameter USE_PATTERN_DETECT = "NO_PATDET";
    parameter USE_SIMD = "ONE48";

    output [29:0] ACOUT; 
    output [17:0] BCOUT; 
    output CARRYCASCOUT;
    output [3:0] CARRYOUT;
    output MULTSIGNOUT;
    output OVERFLOW;
    output [47:0] P; 
    output PATTERNBDETECT;
    output PATTERNDETECT;
    output [47:0] PCOUT;
    output UNDERFLOW;

    input [29:0] A;
    input [29:0] ACIN;
    input [3:0] ALUMODE;
    input [17:0] B;
    input [17:0] BCIN;
    input [47:0] C;
    input CARRYCASCIN;
    input CARRYIN;
    input [2:0] CARRYINSEL;
    input CEA1;
    input CEA2;
    input CEAD;         // new
    input CEALUMODE;
    input CEB1;
    input CEB2;
    input CEC;
    input CECARRYIN;
    input CECTRL;
    input CED;          // new
    input CEINMODE;     // new
    input CEM; 
    input CEP;
    input CLK;
    input [24:0] D; // new
    input [4:0] INMODE; // new
    input MULTSIGNIN;
    input [6:0] OPMODE;
    input [47:0] PCIN;
    input RSTA;
    input RSTALLCARRYIN;
    input RSTALUMODE;
    input RSTB;
    input RSTC;
    input RSTCTRL;
    input RSTD;          // new
    input RSTINMODE;     // new 
    input RSTM;  
    input RSTP;


//------------------- constants -------------------------
   localparam MAX_ACOUT      = 30;
   localparam MAX_BCOUT      = 18;
   localparam MAX_CARRYOUT   = 4;
   localparam MAX_P          = 48;
   localparam MAX_PCOUT      = 48;

   localparam MAX_A          = 30;
   localparam MAX_ACIN       = 30;
   localparam MAX_ALUMODE    = 4;
   localparam MAX_A_MULT     = 25;
   localparam MAX_B          = 18;
   localparam MAX_B_MULT     = 18;
   localparam MAX_BCIN       = 18;
   localparam MAX_C          = 48;
   localparam MAX_CARRYINSEL = 3;
   localparam MAX_D          = 25;
   localparam MAX_INMODE     = 5;
   localparam MAX_OPMODE     = 7;
   localparam MAX_PCIN       = 48;

   localparam MAX_ALU_FULL   = 48;
   localparam MAX_ALU_HALF   = 24;
   localparam MAX_ALU_QUART  = 12;

   localparam MSB_ACOUT      = MAX_ACOUT - 1;
   localparam MSB_BCOUT      = MAX_BCOUT - 1;
   localparam MSB_CARRYOUT   = MAX_CARRYOUT - 1;
   localparam MSB_P          = MAX_P - 1;
   localparam MSB_PCOUT      = MAX_PCOUT - 1;
 
   localparam MSB_A          = MAX_A - 1;
   localparam MSB_ACIN       = MAX_ACIN - 1;
   localparam MSB_ALUMODE    = MAX_ALUMODE - 1;
   localparam MSB_A_MULT     = MAX_A_MULT - 1;
   localparam MSB_B          = MAX_B - 1;
   localparam MSB_B_MULT     = MAX_B_MULT - 1;
   localparam MSB_BCIN       = MAX_BCIN - 1;
   localparam MSB_C          = MAX_C - 1;
   localparam MSB_CARRYINSEL = MAX_CARRYINSEL - 1;
   localparam MSB_D          = MAX_D - 1;
   localparam MSB_INMODE     = MAX_INMODE - 1;
   localparam MSB_OPMODE     = MAX_OPMODE - 1;
   localparam MSB_PCIN       = MAX_PCIN - 1;

   localparam MSB_ALU_FULL   = MAX_ALU_FULL  - 1;
   localparam MSB_ALU_HALF   = MAX_ALU_HALF  - 1;
   localparam MSB_ALU_QUART  = MAX_ALU_QUART - 1;

   localparam SHIFT_MUXZ     = 17;

    reg [29:0] a_o_mux, qa_o_mux, qa_o_reg1, qa_o_reg2, qacout_o_mux;

// new
    reg [4:0]  qinmode_o_mux, qinmode_o_reg;
// new
    wire [24:0] a_preaddsub;

    reg [17:0] b_o_mux, qb_o_mux, qb_o_reg1, qb_o_reg2, qbcout_o_mux;
    reg [2:0] qcarryinsel_o_mux, qcarryinsel_o_reg1;

// new  
    reg [MSB_D:0] d_o_mux, qd_o_mux, qd_o_reg1;

    reg [(MSB_A_MULT+MSB_B_MULT+1):0] qmult_o_mux, qmult_o_reg;
    reg [47:0] qc_o_mux, qc_o_reg1;
    reg [47:0] qp_o_mux, qp_o_reg1;
    reg [47:0] qx_o_mux, qy_o_mux, qz_o_mux;
    reg [6:0]  qopmode_o_mux, qopmode_o_reg1;

    

    reg qcarryin_o_mux0, qcarryin_o_reg0, qcarryin_o_mux7, qcarryin_o_reg7;
    reg qcarryin_o_mux, qcarryin_o_reg;

    reg [3:0]  qalumode_o_mux, qalumode_o_reg1;

    reg invalid_opmode, opmode_valid_flag=1, ping_opmode_drc_check = 0;

//    reg [47:0] alu_o;
    wire [47:0] alu_o;

    reg qmultsignout_o_reg, multsignout_o_mux; 
    wire multsignout_o_opmode;

    reg [MAX_ALU_FULL:0]  alu_full_tmp;
    reg [MAX_ALU_HALF:0]  alu_hlf1_tmp, alu_hlf2_tmp;
    reg [MAX_ALU_QUART:0] alu_qrt1_tmp,  alu_qrt2_tmp, alu_qrt3_tmp, alu_qrt4_tmp;
    
    wire pdet_o_mux, pdetb_o_mux;

    wire [47:0] the_pattern; 
    reg [47:0] the_mask = 0;
    wire carrycascout_o;
    reg carrycascout_o_reg = 0;
    reg carrycascout_o_mux = 0;

//    reg [3:0] carryout_o = 0;
    reg [3:0] carryout_o_reg = 0;
    reg [3:0] carryout_o_mux = 0;
    wire [3:0] carryout_x_o;

    wire pdet_o, pdetb_o;
    reg  pdet_o_reg1, pdet_o_reg2, pdetb_o_reg1, pdetb_o_reg2;
    wire overflow_o, underflow_o;

    wire [(MSB_A_MULT+MSB_B_MULT+1):0] mult_o;
// new 
    wire [MSB_A_MULT:0] ad_addsub, ad_mult;
    reg  [MSB_A_MULT:0] qad_o_reg1, qad_o_mux;
    wire [MSB_B_MULT:0] b_mult;




//*********************************************************
//**********  INMODE signal registering        ************
//*********************************************************
// new 
    always @(posedge CLK) begin
       if (RSTINMODE)
          qinmode_o_reg <= 5'b0;
       else if (CEINMODE)
          qinmode_o_reg <= INMODE;
    end

    generate 
       case (INMODEREG)
          0: begin 
             always @(INMODE)
                qinmode_o_mux <= INMODE;
	  end

          1: begin 
             always @(qinmode_o_reg)
                qinmode_o_mux <= qinmode_o_reg;
	  end
       endcase
    endgenerate 

//*********************************************************
//*** Input register A with 2 level deep of registers
//*********************************************************

    generate 
       case (A_INPUT)
          "DIRECT"  : always @(A)    a_o_mux <= A;
          "CASCADE" : always @(ACIN) a_o_mux <= ACIN;
       endcase
    endgenerate 

    generate 
       case (AREG)
          1 : begin
              always @(posedge CLK) begin
	         if (RSTA) begin
                    qa_o_reg1 <= 30'b0;
                    qa_o_reg2 <= 30'b0;
                 end
                 else begin
                      if (CEA1)
                          qa_o_reg1 <= a_o_mux;
                      if (CEA2)
                          qa_o_reg2 <= a_o_mux;
                 end
              end
          end

          2 : begin
              always @(posedge CLK) begin
	         if (RSTA) begin
                    qa_o_reg1 <= 30'b0;
                    qa_o_reg2 <= 30'b0;
                 end
                 else begin
                      if (CEA1)
                          qa_o_reg1 <= a_o_mux;
                      if (CEA2)
                          qa_o_reg2 <= qa_o_reg1;
                 end
              end
          end
       endcase
    endgenerate 

    generate 
       case (AREG)
          0: always @(a_o_mux) qa_o_mux <= a_o_mux;
          1,2 : always @(qa_o_reg2) qa_o_mux <= qa_o_reg2;
       endcase
    endgenerate 

    generate 
       case (ACASCREG)
          1: always @(qa_o_mux or qa_o_reg1) begin
                 if(AREG == 2)
                    qacout_o_mux <= qa_o_reg1;
                 else
                    qacout_o_mux <= qa_o_mux;
             end
          0,2 : always @(qa_o_mux) qacout_o_mux <= qa_o_mux;
       endcase
    endgenerate 

// new  
    
   assign a_preaddsub = qinmode_o_mux[1]? 25'b0:(qinmode_o_mux[0]?qa_o_reg1[24:0]:qa_o_mux[24:0]);

//*********************************************************
//*** Input register B with 2 level deep of registers
//*********************************************************

    generate 
       case (B_INPUT)
          "DIRECT"  : always @(B)    b_o_mux <= B;
          "CASCADE" : always @(BCIN) b_o_mux <= BCIN;
       endcase
    endgenerate 

    generate 
       case (BREG)
          1 : begin
              always @(posedge CLK) begin
	         if (RSTB) begin
                      qb_o_reg1 <= 18'b0;
                      qb_o_reg2 <= 18'b0;
                 end
                 else begin
                      if (CEB1)
                          qb_o_reg1 <= b_o_mux;
                      if (CEB2)
                          qb_o_reg2 <= b_o_mux;
                 end
              end
          end

          2 : begin
              always @(posedge CLK) begin
	         if (RSTB) begin
                    qb_o_reg1 <= 18'b0;
                    qb_o_reg2 <= 18'b0;
                 end
                 else begin
                      if (CEB1)
                          qb_o_reg1 <= b_o_mux;
                      if (CEB2)
                          qb_o_reg2 <= qb_o_reg1;
                 end
              end
          end
       endcase
    endgenerate 

    generate 
       case (BREG)
          0: always @(b_o_mux) qb_o_mux <= b_o_mux;
          1,2 : always @(qb_o_reg2) qb_o_mux <= qb_o_reg2;
       endcase
    endgenerate 

    generate
       case (BCASCREG)
          1: always @(qb_o_mux or qb_o_reg1) begin
                 if(BREG == 2)
                    qbcout_o_mux <= qb_o_reg1;
                 else
                    qbcout_o_mux <= qb_o_mux;
             end
          0,2 : always @(qb_o_mux) qbcout_o_mux <= qb_o_mux;
       endcase
    endgenerate


// new
    
   assign b_mult = qinmode_o_mux[4]?qb_o_reg1:qb_o_mux;

//*********************************************************
//*** Input register C with 1 level deep of register
//*********************************************************

    always @(posedge CLK) begin
	if (RSTC)
            qc_o_reg1 <= 48'b0;
	else if (CEC)
            qc_o_reg1 <= C;
    end


    generate
       case (CREG)
          0 : always @(C) qc_o_mux <= C;
          1 : always @(qc_o_reg1) qc_o_mux <= qc_o_reg1;
       endcase
    endgenerate


// new

//*********************************************************
//*** Input register D with 1 level deep of register
//*********************************************************
    always @(posedge CLK) begin
	if (RSTD)
            qd_o_reg1 <= 25'b0;
	else if (CED)
            qd_o_reg1 <= D;
    end

    generate
       case (DREG)
          0 : always @(D) qd_o_mux <= D;
          1 : always @(qd_o_reg1) qd_o_mux <= qd_o_reg1;
       endcase
    endgenerate




//*********************************************************
//*** Preaddsub AD register with 1 level deep of register
//*********************************************************
// new  
      assign ad_addsub = qinmode_o_mux[3]?(-a_preaddsub + (qinmode_o_mux[2]?qd_o_mux:25'b0)):(a_preaddsub + (qinmode_o_mux[2]?qd_o_mux:25'b0));

    always @(posedge CLK) begin
	if (RSTD)
            qad_o_reg1 <= 25'b0;
	else if (CEAD)
            qad_o_reg1 <= ad_addsub;
    end

    generate
       case (ADREG)
          0 : always @(ad_addsub) qad_o_mux <= ad_addsub;
          1 : always @(qad_o_reg1) qad_o_mux <= qad_o_reg1;
       endcase
    endgenerate

/*------------------------------------------------- */
/*------------------------------------------------- */

   assign ad_mult = (USE_DPORT=="TRUE")? qad_o_mux : a_preaddsub;
//*********************************************************

//*********************************************************
//***************      25x18 Multiplier     ***************
//*********************************************************
// 05/26/05 -- FP -- Added warning for invalid mult when USE_MULT=NONE
// SIMD=FOUR12 and SIMD=TWO24
// Made mult_o to be "X"

    always @(qopmode_o_mux) begin
       if(qopmode_o_mux[3:0] == 4'b0101)
          if((USE_MULT == "NONE") || (USE_SIMD == "TWO24") || (USE_SIMD == "FOUR12")) 
               $display("OPMODE Input Warning : The OPMODE[3:0] %b to DSP48E1 instance %m is invalid when using attributes USE_MULT = NONE, or USE_SIMD = TWO24 or FOUR12 at %.3f ns.", qopmode_o_mux[3:0], $time/1000.0);
    end

    assign mult_o = ((USE_MULT == "NONE") || (USE_SIMD == "TWO24") || (USE_SIMD == "FOUR12"))? 43'b0 : {{18{ad_mult[24]}}, ad_mult[24:0]} * {{25{b_mult[17]}}, b_mult};

    always @(posedge CLK) begin
	if (RSTM) begin
            qmult_o_reg <= 18'b0;
	end
	else if (CEM) begin
            qmult_o_reg <= mult_o;
	end
    end

    generate
       case (MREG)
          0 : always @(mult_o) qmult_o_mux <= mult_o;
          1 : always @(qmult_o_reg) qmult_o_mux <= qmult_o_reg;
       endcase
    endgenerate


//*** X mux
// ask jmt

    always @(qp_o_mux or qa_o_mux or qb_o_mux or qmult_o_mux or qopmode_o_mux[1:0] or qcarryinsel_o_mux) begin
	case (qopmode_o_mux[1:0])
              2'b00 : qx_o_mux <= 48'b0;
              2'b01 : qx_o_mux <= {{5{qmult_o_mux[MSB_A_MULT + MSB_B_MULT + 1]}}, qmult_o_mux};
              2'b10 : qx_o_mux <= qp_o_mux;
// new DRC 
              2'b11 : begin
                         if((USE_MULT == "MULTIPLY") && (
                                  (AREG==0 && BREG==0 && MREG==0) ||
                                  (AREG==0 && BREG==0 && PREG==0) ||
                                  (MREG==0 && PREG==0)))
                               $display("OPMODE Input Warning : The OPMODE[1:0] %b to DSP48E1 instance %m is invalid when using attributes USE_MULT = MULTIPLY at %.3f ns. Please set USE_MULT to either NONE or DYNAMIC.", qopmode_o_mux[1:0], $time/1000.0);
	                 else
                            qx_o_mux <=  {qa_o_mux[MSB_A:0], qb_o_mux[MSB_B:0]};
	              end

            default : begin
	              end
	endcase
    end


//*** Y mux

// 08-06-08  
// IR 478378
    wire [47:0] y_mac_cascd = (qopmode_o_mux[6:4] == 3'b100) ? {48{MULTSIGNIN}} : {48{1'b1}};

    always @(qc_o_mux or qopmode_o_mux[3:2] or qcarryinsel_o_mux or y_mac_cascd) begin
	case (qopmode_o_mux[3:2])
              2'b00 : qy_o_mux <= 48'b0;
              2'b01 : qy_o_mux <= 48'b0;
// 08-06-08  
              2'b10 : qy_o_mux <= y_mac_cascd;                // choose all ones or mult-sign-extend
              2'b11 : qy_o_mux <= qc_o_mux;
            default : begin
	              end
	endcase
    end


//*** Z mux

    always @(qp_o_mux or qc_o_mux or PCIN or qopmode_o_mux[6:4] or qcarryinsel_o_mux) begin
// ask jmt
	casex (qopmode_o_mux[6:4])
             3'b000 : qz_o_mux <= 48'b0;
             3'b001 : qz_o_mux <= PCIN;
             3'b010 : qz_o_mux <= qp_o_mux;
             3'b011 : qz_o_mux <= qc_o_mux;
             3'b100 : qz_o_mux <= qp_o_mux;
             3'b101 : qz_o_mux <= {{17{PCIN[47]}}, PCIN[47:17]};
// ask jmt 
             3'b11x : qz_o_mux <= {{17{qp_o_mux[47]}}, qp_o_mux[47:17]};
            default : begin
	              end
	endcase
    end



//*** CarryInSel and OpMode with 1 level of register
    always @(posedge CLK) begin
	if (RSTCTRL) begin
            qcarryinsel_o_reg1 <= 3'b0;
            qopmode_o_reg1 <= 7'b0;
	end  
	else if (CECTRL) begin
            qcarryinsel_o_reg1 <= CARRYINSEL;
            qopmode_o_reg1 <= OPMODE;
	end
    end

    generate
       case (CARRYINSELREG)
          0 : always @(CARRYINSEL) qcarryinsel_o_mux <= CARRYINSEL;
          1 : always @(qcarryinsel_o_reg1) qcarryinsel_o_mux <= qcarryinsel_o_reg1;
       endcase
    endgenerate


//CR 219047 (3) 

//    always @(qcarryinsel_o_mux or MULTSIGNIN or qopmode_o_mux) begin
//    always @(CARRYCASCIN or MULTSIGNIN or qopmode_o_mux) begin
    always @(qcarryinsel_o_mux or CARRYCASCIN or MULTSIGNIN or qopmode_o_mux) begin
        if(qcarryinsel_o_mux == 3'b010) begin 
           if(!((MULTSIGNIN === 1'bx) || ((qopmode_o_mux == 7'b1001000) && !(MULTSIGNIN === 1'bx)) 
                                 || ((MULTSIGNIN == 1'b0) && (CARRYCASCIN == 1'b0)))) begin
	      $display("DRC warning : CARRYCASCIN can only be used in the current DSP48E1 instance %m if the previous DSP48E1_FORMAL is performing a two input ADD operation, or the current DSP48E1_FORMAL is configured in the MAC extend opmode 7'b1001000 at %.3f ns.", $time);
            end  
        end  
    end 
/*
// old
// ask jmt
//CR 219047 (4) 
    always @(qcarryinsel_o_mux) begin
       if((qcarryinsel_o_mux == 3'b110) && (MULTCARRYINREG != MREG)) begin
	  $display("Attribute Syntax Warning : It is recommended that MREG and MULTCARRYINREG on DSP48E1 instance %m be set to the same value when using CARRYINSEL = 110 for multiply rounding.");
       end
    end
*/

    generate
       case (OPMODEREG)
          0 : always @(OPMODE) qopmode_o_mux <= OPMODE;
          1 : always @(qopmode_o_reg1) qopmode_o_mux <= qopmode_o_reg1;
       endcase
    endgenerate


//*** ALUMODE with 1 level of register
    always @(posedge CLK) begin
	if (RSTALUMODE)
            qalumode_o_reg1 <= 4'b0;
	else if (CEALUMODE)
            qalumode_o_reg1 <= ALUMODE;
    end


    generate
       case (ALUMODEREG)
          0 : always @(ALUMODE) qalumode_o_mux <= ALUMODE;
          1 : always @(qalumode_o_reg1) qalumode_o_mux <= qalumode_o_reg1;
       endcase
    endgenerate


//--####################################################################
//--#####                         ALU                              #####
//--####################################################################

  wire mult_cout = ~qp_o_mux[42];
  reg  [MSB_ALU_FULL:0] co;
  reg  [MSB_ALU_FULL:0] s;
  wire [MSB_ALU_FULL:0] comux,smux;
  wire [MSB_CARRYOUT:0] carryout_o_hw;
  wire [MSB_CARRYOUT:0] carryout_o;
  wire tmp_carrycascout_in;

  always @ (qx_o_mux or qy_o_mux or qz_o_mux or qalumode_o_mux[0]) begin
    if (qalumode_o_mux[0]) begin
       co = ((qx_o_mux & qy_o_mux)|((~qz_o_mux) & qy_o_mux)|(qx_o_mux & (~qz_o_mux)));
       s  = (~qz_o_mux) ^ qx_o_mux ^ qy_o_mux;
    end
    else begin
       co = ((qx_o_mux & qy_o_mux)|(qz_o_mux & qy_o_mux)|(qx_o_mux & qz_o_mux));
       s  =  qz_o_mux ^ qx_o_mux ^ qy_o_mux;
    end
  end

  assign comux = qalumode_o_mux[2] ? 0 : co;
  assign smux = qalumode_o_mux[3] ? co : s;

  // FINAL ADDER
  wire [12:0] s0 = {comux[10:0],qcarryin_o_mux}+smux[11:0];
  wire cout0 = (comux[11] + s0[12]);
  assign carryout_o_hw[0] = (qalumode_o_mux[0] & qalumode_o_mux[1]) ? ~cout0 : cout0;
  wire C1 = (USE_SIMD == "FOUR12") ? 1'b0 : s0[12];

  wire co11_lsb = (USE_SIMD == "FOUR12") ? 1'b0 : comux[11];
  wire [12:0] s1 = {comux[22:12],co11_lsb}+smux[23:12]+C1;
  wire cout1 = (comux[23] + s1[12]);
  assign carryout_o_hw[1] = (qalumode_o_mux[0] & qalumode_o_mux[1]) ? ~cout1 : cout1;
  wire C2 = ((USE_SIMD == "TWO24") || (USE_SIMD == "FOUR12")) ? 1'b0 : s1[12];

  wire co23_lsb = ((USE_SIMD == "TWO24") || (USE_SIMD == "FOUR12")) ? 
       1'b0 : comux[23];

  wire [12:0] s2 = {comux[34:24],co23_lsb}+smux[35:24]+C2;
  wire cout2 = (comux[35] + s2[12]);
  assign carryout_o_hw[2] = (qalumode_o_mux[0] & qalumode_o_mux[1]) ? ~cout2 : cout2;
  wire C3 = (USE_SIMD == "FOUR12") ? 1'b0 : s2[12];

  wire co35_lsb = (USE_SIMD == "FOUR12") ? 1'b0 : comux[35];
  wire [13:0] s3 = {comux[47:36],co35_lsb}+smux[47:36]+C3;
  wire cout3 = s3[12];

  assign carryout_o_hw[3] = (qalumode_o_mux[0] & qalumode_o_mux[1]) ? ~cout3 : cout3;

  wire   cout4 = s3[13];
//  assign carryout_o_hw[4] = (qalumode_o_mux[0] & qalumode_o_mux[1]) ? ~cout4 : cout4;

  assign alu_o  = qalumode_o_mux[1] ? ~{s3[11:0],s2[11:0],s1[11:0],s0[11:0]} :
                                {s3[11:0],s2[11:0],s1[11:0],s0[11:0]};
  // COMPUTE CARRYCASCOUT
  assign carrycascout_o = cout3;
  
  // COMPUTE MULTSIGNOUT
  // 08-06-08  assign  multsignout_o_opmode = (qopmode_o_mux[3:0] === 4'b100) ? MULTSIGNIN  : ~qp_o_mux[42];
  // IR 478378 
  assign  multsignout_o_opmode = (qopmode_o_mux[6:4] === 3'b100) ? MULTSIGNIN  : qmult_o_mux[42];

  // CR 523600 -- "X" carryout for multiply and logic operations
    assign carryout_o[3] = ((qopmode_o_mux[3:0] == 4'b0101) || (qalumode_o_mux[3:2] != 2'b00))? 1'bx : carryout_o_hw[3];
    assign carryout_o[2] = ((qopmode_o_mux[3:0] == 4'b0101) || (qalumode_o_mux[3:2] != 2'b00))? 1'bx : (USE_SIMD == "FOUR12") ? carryout_o_hw[2] : 1'bx;
    assign carryout_o[1] = ((qopmode_o_mux[3:0] == 4'b0101) || (qalumode_o_mux[3:2] != 2'b00))? 1'bx : ((USE_SIMD == "TWO24") ||  (USE_SIMD == "FOUR12")) ? carryout_o_hw[1] : 1'bx;
    assign carryout_o[0] = ((qopmode_o_mux[3:0] == 4'b0101) || (qalumode_o_mux[3:2] != 2'b00))? 1'bx : (USE_SIMD == "FOUR12") ? carryout_o_hw[0] : 1'bx;

//--########################### END ALU ################################
 
    
//*** CarryIn Mux and Register

//-------  input 0
    always @(posedge CLK) begin
	if (RSTALLCARRYIN)
            qcarryin_o_reg0 <= 1'b0;
	else if (CECARRYIN)
            qcarryin_o_reg0 <= CARRYIN;
    end

    generate
       case (CARRYINREG)
          0 : always @(CARRYIN) qcarryin_o_mux0 <= CARRYIN;
          1 : always @(qcarryin_o_reg0) qcarryin_o_mux0 <= qcarryin_o_reg0;
       endcase
    endgenerate

//-------  input 7
    always @(posedge CLK) begin
	if (RSTALLCARRYIN)
            qcarryin_o_reg7 <= 1'b0;
// old	else if (CEMULTCARRYIN)
// new
	else if (CEM)
// IR 478377 
            qcarryin_o_reg7 <=  ad_mult[24] ~^ b_mult[17];  // xnor
    end

//    always @(qa_o_mux[24] or qb_o_mux[17] or qcarryin_o_reg7) begin
    always @(ad_mult[24] or b_mult[17] or qcarryin_o_reg7) begin
// old	case (MULTCARRYINREG)
// new 
	case (MREG)
// IR 478377 
                  0 : qcarryin_o_mux7 <= ad_mult[24] ~^ b_mult[17];
                  1 : qcarryin_o_mux7 <= qcarryin_o_reg7;
            default : begin
	                  $display("Attribute Syntax Error : The attribute MREG on DSP48E1 instance %m is set to %d.  Legal values for this attribute are 0 or 1.", MREG);
	                  $finish;
	              end
	endcase
    end
   
    reg qcarryin_o_mux_tmp;
    always @(qcarryin_o_mux0 or PCIN[47] or CARRYCASCIN or carrycascout_o_mux or qp_o_mux[47] or qcarryin_o_mux7 or qcarryinsel_o_mux) begin
	case (qcarryinsel_o_mux)
              3'b000 : qcarryin_o_mux_tmp <= qcarryin_o_mux0;
              3'b001 : qcarryin_o_mux_tmp <= ~PCIN[47];
              3'b010 : qcarryin_o_mux_tmp <= CARRYCASCIN;
              3'b011 : qcarryin_o_mux_tmp <= PCIN[47];
              3'b100 : qcarryin_o_mux_tmp <= carrycascout_o_mux;
              3'b101 : qcarryin_o_mux_tmp <= ~qp_o_mux[47];
              3'b110 : qcarryin_o_mux_tmp <= qcarryin_o_mux7;
              3'b111 : qcarryin_o_mux_tmp <= qp_o_mux[47];
            default : begin
	              end
	endcase
    end
    // disable carryin when performing logic operation
    always @(qcarryin_o_mux_tmp or qalumode_o_mux[3:2]) begin
      qcarryin_o_mux <= (qalumode_o_mux[3] || qalumode_o_mux[2]) ? 1'b0 : qcarryin_o_mux_tmp;
    end
 

//--####################################################################
//--#####                     AUTORESET_PATDET                     #####
//--####################################################################
    wire the_auto_reset_patdet;
    assign the_auto_reset_patdet = ((AUTORESET_PATDET == "RESET_MATCH") &&  pdet_o_reg1) 
                                                   ||
                                   ((AUTORESET_PATDET == "RESET_NOT_MATCH") &&  (pdet_o_reg2 && !pdet_o_reg1));
//--####################################################################
//--#####      CARRYOUT, CARRYCASCOUT. MULTSIGNOUT and PCOUT      ###### 
//--####################################################################
//*** register with 1 level of register
    always @(posedge CLK) begin
        if(RSTP || the_auto_reset_patdet)
             begin
               carryout_o_reg     <= 4'b0;
               carrycascout_o_reg <= 1'b0;
               qmultsignout_o_reg <= 1'b0;
               qp_o_reg1 <= 48'b0;
             end
        else if (CEP) begin
                   carryout_o_reg     <= carryout_o;
                   carrycascout_o_reg <= carrycascout_o;
                   qmultsignout_o_reg <= multsignout_o_opmode;
                   qp_o_reg1 <= alu_o;
             end
    end

    generate 
       case (PREG)
          0: begin 
             always @(carryout_o)
                carryout_o_mux <= carryout_o;
             always @(carrycascout_o)
                carrycascout_o_mux <= carrycascout_o;
             always @(multsignout_o_opmode)
                 multsignout_o_mux <= multsignout_o_opmode;
             always @(alu_o)
                 qp_o_mux <= alu_o;
	  end

          1: begin 
             always @(carryout_o_reg)
                carryout_o_mux <= carryout_o_reg;
             always @(carrycascout_o_reg)
                carrycascout_o_mux <= carrycascout_o_reg;
             always @(qmultsignout_o_reg)
                 multsignout_o_mux <= qmultsignout_o_reg;
             always @(qp_o_reg1)
                 qp_o_mux <= qp_o_reg1;
	  end
       endcase
    endgenerate



//CR 219047 (2)
// ask jmt whether i should comment this out 
/*
    always @(qmult_o_mux[(MSB_A_MULT+MSB_B_MULT+1)] or qopmode_o_mux[3:0]) begin
        if(qopmode_o_mux[3:0] == 4'b0101)
           multsignout_o_opmode = qmult_o_mux[(MSB_A_MULT+MSB_B_MULT+1)];
        else
           multsignout_o_opmode = 1'bx;
    end 
*/



//    assign carryout_x_o[4] =  carryout_o_mux[4];
// CR 510304 output X during multiply operation

    assign carryout_x_o[3] =  carryout_o_mux[3];
    assign carryout_x_o[2] =  (USE_SIMD == "FOUR12") ? carryout_o_mux[2] : 1'bx;
    assign carryout_x_o[1] =  ((USE_SIMD == "TWO24") ||  (USE_SIMD == "FOUR12")) ? carryout_o_mux[1] : 1'bx;
    assign carryout_x_o[0] =  (USE_SIMD == "FOUR12") ? carryout_o_mux[0] : 1'bx;


//--####################################################################
//--#####                    Pattern Detector                      #####
//--####################################################################


// new
    // selet pattern
    assign the_pattern = (SEL_PATTERN == "PATTERN") ? PATTERN : qc_o_mux; 

    // selet mask
    always @(qc_o_mux) begin
        case(SEL_MASK)
              "MASK" : the_mask <= MASK;
              "C"    : the_mask <= qc_o_mux;
              "ROUNDING_MODE1" :  the_mask     <=   ~qc_o_mux << 1;
              "ROUNDING_MODE2" :  the_mask     <=   ~qc_o_mux << 2;
               default : ;
        endcase
    end

    //--  now do the pattern detection
       
    assign pdet_o = &(~(the_pattern ^ alu_o) | the_mask);  
    assign pdetb_o = &((the_pattern ^ alu_o) | the_mask);  

    assign pdet_o_mux  = (PREG == 1) ? pdet_o_reg1 : pdet_o;
    assign pdetb_o_mux = (PREG == 1) ? pdetb_o_reg1 : pdetb_o;

//*** Output register PATTERN DETECT and UNDERFLOW / OVERFLOW 

    always @(posedge CLK) begin
        if((RSTP) || the_auto_reset_patdet) 
          begin 
            pdet_o_reg1  <= 1'b0;
            pdet_o_reg2  <= 1'b0;
            pdetb_o_reg1 <= 1'b0;
            pdetb_o_reg2 <= 1'b0;
          end
	else if(CEP)
               begin
                 //-- the previous values are used in Underflow/Overflow
                 pdet_o_reg2  <= pdet_o_reg1;
                 pdet_o_reg1  <= pdet_o;
                 pdetb_o_reg2 <= pdetb_o_reg1;
                 pdetb_o_reg1 <= pdetb_o;
               end
    end

 
//--####################################################################
//--#####                    Underflow / Overflow                  #####
//--####################################################################
    generate if ((USE_PATTERN_DETECT == "PATDET") || (PREG == 1))
       begin         
          assign  overflow_o  = pdet_o_reg2 & !pdet_o_reg1 & !pdetb_o_reg1;
          assign  underflow_o = pdetb_o_reg2  & !pdet_o_reg1 & !pdetb_o_reg1;
       end
    else
       begin         
           assign overflow_o  = 1'bx;
           assign underflow_o = 1'bx;
       end
    endgenerate




    assign ACOUT = qacout_o_mux;
    assign BCOUT = qbcout_o_mux;
    assign CARRYCASCOUT = carrycascout_o_mux;
    assign CARRYOUT     = carryout_x_o;
    assign MULTSIGNOUT  = multsignout_o_mux;
    assign OVERFLOW     = overflow_o;
    assign P            = qp_o_mux;
    assign PCOUT        = qp_o_mux;
    assign PATTERNDETECT = pdet_o_mux;
    assign PATTERNBDETECT = pdetb_o_mux;
    assign UNDERFLOW     = underflow_o;

endmodule // DSP48E1
