// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/DSP48E.v,v 1.3 2010/02/11 22:01:09 vandanad Exp $

module DSP48E (ACOUT, BCOUT, CARRYCASCOUT, CARRYOUT, MULTSIGNOUT, OVERFLOW, P, PATTERNBDETECT, PATTERNDETECT, PCOUT, UNDERFLOW, A, ACIN, ALUMODE, B, BCIN, C, CARRYCASCIN, CARRYIN, CARRYINSEL, CEA1, CEA2, CEALUMODE, CEB1, CEB2, CEC, CECARRYIN, CECTRL, CEM, CEMULTCARRYIN, CEP, CLK, MULTSIGNIN, OPMODE, PCIN, RSTA, RSTALLCARRYIN, RSTALUMODE, RSTB, RSTC, RSTCTRL, RSTM, RSTP); 

    parameter SIM_MODE = "SAFE";
    parameter ACASCREG = 1;
    parameter ALUMODEREG = 1;
    parameter AREG = 1;
    parameter AUTORESET_PATTERN_DETECT = "FALSE"; 
    parameter AUTORESET_PATTERN_DETECT_OPTINV = "MATCH";
    parameter A_INPUT = "DIRECT";
    parameter BCASCREG = 1;
    parameter BREG = 1;
    parameter B_INPUT = "DIRECT";
    parameter CARRYINREG = 1;
    parameter CARRYINSELREG = 1;
    parameter CREG = 1;
    parameter MASK =  48'h3FFFFFFFFFFF;
    parameter MREG = 1;
    parameter MULTCARRYINREG = 1;
    parameter OPMODEREG = 1;
    parameter PATTERN =  48'h000000000000;
    parameter PREG = 1;
    parameter SEL_MASK = "MASK";
    parameter SEL_PATTERN = "PATTERN";
    parameter SEL_ROUNDING_MASK = "SEL_MASK";
    parameter USE_MULT = "MULT_S";
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
    input CEALUMODE;
    input CEB1;
    input CEB2;
    input CEC;
    input CECARRYIN;
    input CECTRL;
    input CEM;
    input CEMULTCARRYIN;
    input CEP;
    input CLK;
    input MULTSIGNIN;
    input [6:0] OPMODE;
    input [47:0] PCIN;
    input RSTA;
    input RSTALLCARRYIN;
    input RSTALUMODE;
    input RSTB;
    input RSTC;
    input RSTCTRL;
    input RSTM;  
    input RSTP;


//------------------- constants -------------------------
   parameter MAX_ACOUT      = 30;
   parameter MAX_BCOUT      = 18;
   parameter MAX_CARRYOUT   = 4;
   parameter MAX_P          = 48;
   parameter MAX_PCOUT      = 48;

   parameter MAX_A          = 30;
   parameter MAX_ACIN       = 30;
   parameter MAX_ALUMODE    = 4;
   parameter MAX_A_MULT     = 25;
   parameter MAX_B          = 18;
   parameter MAX_B_MULT     = 18;
   parameter MAX_BCIN       = 18;
   parameter MAX_C          = 48;
   parameter MAX_CARRYINSEL = 3;
   parameter MAX_OPMODE     = 7;
   parameter MAX_PCIN       = 48;

   parameter MAX_ALU_FULL   = 48;
   parameter MAX_ALU_HALF   = 24;
   parameter MAX_ALU_QUART  = 12;

   parameter MSB_ACOUT      = MAX_ACOUT - 1;
   parameter MSB_BCOUT      = MAX_BCOUT - 1;
   parameter MSB_CARRYOUT   = MAX_CARRYOUT - 1;
   parameter MSB_P          = MAX_P - 1;
   parameter MSB_PCOUT      = MAX_PCOUT - 1;
 
   parameter MSB_A          = MAX_A - 1;
   parameter MSB_ACIN       = MAX_ACIN - 1;
   parameter MSB_ALUMODE    = MAX_ALUMODE - 1;
   parameter MSB_A_MULT     = MAX_A_MULT - 1;
   parameter MSB_B          = MAX_B - 1;
   parameter MSB_B_MULT     = MAX_B_MULT - 1;
   parameter MSB_BCIN       = MAX_BCIN - 1;
   parameter MSB_C          = MAX_C - 1;
   parameter MSB_CARRYINSEL = MAX_CARRYINSEL - 1;
   parameter MSB_OPMODE     = MAX_OPMODE - 1;
   parameter MSB_PCIN       = MAX_PCIN - 1;

   parameter MSB_ALU_FULL   = MAX_ALU_FULL  - 1;
   parameter MSB_ALU_HALF   = MAX_ALU_HALF  - 1;
   parameter MSB_ALU_QUART  = MAX_ALU_QUART - 1;

   parameter SHIFT_MUXZ     = 17;

    reg [29:0] a_o_mux, qa_o_mux, qa_o_reg1, qa_o_reg2, qacout_o_mux;
    reg [17:0] b_o_mux, qb_o_mux, qb_o_reg1, qb_o_reg2, qbcout_o_mux;
    reg [2:0] qcarryinsel_o_mux, qcarryinsel_o_reg1;
    reg [(MSB_A_MULT+MSB_B_MULT+1):0] qmult_o_mux, qmult_o_reg;
    reg [47:0] qc_o_mux, qc_o_reg1;
    reg [47:0] qp_o_mux, qp_o_reg1;
    reg [47:0] qx_o_mux, qy_o_mux, qz_o_mux;
    reg [6:0]  qopmode_o_mux, qopmode_o_reg1;

    

    reg qcarryin_o_mux0, qcarryin_o_reg0, qcarryin_o_mux7, qcarryin_o_reg7;
    reg qcarryin_o_mux, qcarryin_o_reg;

    reg [3:0]  qalumode_o_mux, qalumode_o_reg1;

    reg invalid_opmode, alumode_valid_flag, ping_opmode_drc_check;
    wire opmode_valid_flag;
    reg [47:0] alu_o;

    reg qmultsignout_o_reg, multsignout_o_mux, multsignout_o_opmode;

    reg [MAX_ALU_FULL:0]  alu_full_tmp;
    reg [MAX_ALU_HALF:0]  alu_hlf1_tmp, alu_hlf2_tmp;
    reg [MAX_ALU_QUART:0] alu_qrt1_tmp,  alu_qrt2_tmp, alu_qrt3_tmp, alu_qrt4_tmp;
    
    wire [29:0] acin_in, a_in;
    wire [17:0] bcin_in, b_in;
    wire [2:0] carryinsel_in;
    wire [(MSB_A_MULT+MSB_B_MULT+1):0] mult_o;
    wire [47:0] pcin_in, c_in;
    wire [6:0] opmode_in;
    wire [3:0] alumode_in;
    wire pdet_o_mux, detb_o_mux;

    reg [47:0] pattern_qp, mask_qp;
    reg carrycascout_o;
    reg carrycascout_o_reg;
    reg carrycascout_o_mux;

    reg [3:0] carryout_o;
    reg [3:0] carryout_o_reg;
    reg [3:0] carryout_o_mux;
    wire [3:0] carryout_x_o;

    reg pdet_o, pdetb_o, pdet_o_reg1, pdet_o_reg2, pdetb_o_reg1, pdetb_o_reg2;
    reg overflow_o, underflow_o;

//----------------------------------------------------------------------
//------------------------  Output Ports  ------------------------------
//----------------------------------------------------------------------
    buf b_acout_o[MSB_ACOUT:0] (ACOUT, qacout_o_mux);
    buf b_bcout_o[MSB_BCOUT:0] (BCOUT, qbcout_o_mux);
    buf b_carrycascout (CARRYCASCOUT, carrycascout_o_mux);
    buf b_carryout[MSB_CARRYOUT:0] (CARRYOUT, carryout_x_o);
    buf b_multsignout (MULTSIGNOUT,  multsignout_o_mux);
    buf b_overflow (OVERFLOW,  overflow_o);
    buf b_p_o[MSB_P:0] (P, qp_o_mux);
    buf b_pcout_o[MSB_PCOUT:0] (PCOUT, qp_o_mux);
    buf b_patterndetect (PATTERNDETECT,  pdet_o_mux);
    buf b_patternbdetect (PATTERNBDETECT, pdetb_o_mux);
    buf b_underflow (UNDERFLOW, underflow_o);

//-----------------------------------------------------
//-----------   Inputs --------------------------------
//-----------------------------------------------------
    buf b_a[MSB_A:0] (a_in, A);
    buf b_acin[MSB_ACIN:0] (acin_in, ACIN);
    buf b_alumode[MSB_ALUMODE:0] (alumode_in, ALUMODE);

    buf b_b[MSB_B:0] (b_in, B);
    buf b_bcin[MSB_BCIN:0] (bcin_in, BCIN);

    buf b_c[MSB_C:0] (c_in, C);

    buf b_carryin (carryin_in, CARRYIN);
    buf b_carrycascin (carrycascin_in, CARRYCASCIN);
    buf b_carryinsel[MSB_CARRYINSEL:0] (carryinsel_in, CARRYINSEL);
    buf b_cep (cep_in, CEP);
    buf b_cea1 (cea1_in, CEA1);
    buf b_cea2 (cea2_in, CEA2);
    buf b_cealumode (cealumode_in, CEALUMODE);
    buf b_ceb1 (ceb1_in, CEB1);
    buf b_ceb2 (ceb2_in, CEB2);
    buf b_cec (cec_in, CEC);
    buf b_cecarryin (cecarryin_in, CECARRYIN);
    buf b_cectrl (cectrl_in, CECTRL);
    buf b_cem (cem_in, CEM);
    buf b_cemultcarryin (cemultcarryin_in, CEMULTCARRYIN);
    buf b_clk (clk_in, CLK);

    buf b_multsignin (multsignin_in, MULTSIGNIN);
    buf b_opmode[MSB_OPMODE:0] (opmode_in, OPMODE);
    buf b_pcin[MSB_PCIN:0] (pcin_in, PCIN);
    buf b_rstp (rstp_in, RSTP);
    buf b_rsta (rsta_in, RSTA);
    buf b_rstalumode (rstalumode_in, RSTALUMODE);
    buf b_rstb (rstb_in, RSTB);
    buf b_rstallcarryin (rstallcarryin_in, RSTALLCARRYIN);
    buf b_rstc (rstc_in, RSTC);
    buf b_rstctrl (rstctrl_in, RSTCTRL);
    buf b_rstm (rstm_in, RSTM);

 
//*********************************************************
//*** Input register A with 2 level deep of registers
//*********************************************************

    always @(acin_in or a_in) begin
	case (A_INPUT)
             "DIRECT" : a_o_mux <= a_in;
            "CASCADE" : a_o_mux <= acin_in;
	endcase
    end

    always @(posedge clk_in) begin
	if (rsta_in) begin
            qa_o_reg1 <= 30'b0;
            qa_o_reg2 <= 30'b0;
        end
	else begin
               case (AREG)
                  0 :  qa_o_reg2 <=  qa_o_reg2;
                  1 :  if (cea2_in)
                           qa_o_reg2 <= a_o_mux;

                  2 : begin
                         if (cea1_in)
                            qa_o_reg1 <= a_o_mux;
                         if (cea2_in)
                            qa_o_reg2 <= qa_o_reg1;
                      end
                  default : ;
               endcase
        end
    end

    always @(a_o_mux or qa_o_reg1 or qa_o_reg2) begin
	case (AREG)
                  0   : qa_o_mux <= a_o_mux;
                  1,2 : qa_o_mux <= qa_o_reg2;
	endcase
    end

    always @(qa_o_mux or qa_o_reg1 or qa_o_reg2) begin
        case (ACASCREG)
                  1 : if(AREG == 2)
                           qacout_o_mux <= qa_o_reg1;
                       else
                           qacout_o_mux <= qa_o_mux;
            default : qacout_o_mux <= qa_o_mux;
        endcase
    end

//*********************************************************
//*** Input register B with 2 level deep of registers
//*********************************************************

    always @(bcin_in or b_in) begin
	case (B_INPUT)
             "DIRECT" : b_o_mux <= b_in;
            "CASCADE" : b_o_mux <= bcin_in;
	endcase
    end

    always @(posedge clk_in) begin
	if (rstb_in) begin
            qb_o_reg1 <= 18'b0;
            qb_o_reg2 <= 18'b0;
        end
	else begin
               case (BREG)
                  0 : qb_o_reg2 <= qb_o_reg2;
                  1 : if (ceb2_in)
                           qb_o_reg2 <= b_o_mux;

                  2 : begin
                         if (ceb1_in)
                            qb_o_reg1 <= b_o_mux;
                         if (ceb2_in)
                            qb_o_reg2 <= qb_o_reg1;
                      end
                  default : ;
               endcase
        end
    end

    always @(b_o_mux or qb_o_reg1 or qb_o_reg2) begin
	case (BREG)
                  0   : qb_o_mux <= b_o_mux;
                  1,2 : qb_o_mux <= qb_o_reg2;
	endcase
    end

    always @(qb_o_mux or qb_o_reg1 or qb_o_reg2) begin
        case (BCASCREG)
                  1 : if(BREG == 2)
                           qbcout_o_mux <= qb_o_reg1;
                       else
                           qbcout_o_mux <= qb_o_mux;
            default : qbcout_o_mux <= qb_o_mux;
        endcase
    end

//*********************************************************
//*** Input register C with 1 level deep of register
//*********************************************************

    always @(posedge clk_in) begin
	if (rstc_in)
            qc_o_reg1 <= 48'b0;
	else if (cec_in)
            qc_o_reg1 <= c_in;
    end

    always @(c_in or qc_o_reg1) begin
	case (CREG)
                  0 : qc_o_mux <= c_in;
                  1 : qc_o_mux <= qc_o_reg1;
	endcase
    end

//*********************************************************
//***************      25x18 Multiplier     ***************
//*********************************************************

    assign mult_o = ((USE_MULT == "NONE") || (USE_SIMD == "TWO24") || (USE_SIMD == "FOUR12"))? 43'b0 : {{18{qa_o_mux[24]}}, qa_o_mux[24:0]} * {{25{qb_o_mux[17]}}, qb_o_mux};

    always @(posedge clk_in) begin
	if (rstm_in) begin
            qmult_o_reg <= 18'b0;
	end
	else if (cem_in) begin
            qmult_o_reg <= mult_o;
	end
    end

    always @(mult_o or qmult_o_reg) begin
	case (MREG)
                  0 : qmult_o_mux <= mult_o;
                  1 : qmult_o_mux <= qmult_o_reg;
	endcase
    end


//*** X mux
    
    always @(qp_o_mux or qa_o_mux or qb_o_mux or qmult_o_mux or qopmode_o_mux or qcarryinsel_o_mux) begin
	case (qopmode_o_mux[1:0])
              2'b00 : qx_o_mux <= 48'b0;
              2'b01 : qx_o_mux <= {{5{qmult_o_mux[MSB_A_MULT + MSB_B_MULT + 1]}}, qmult_o_mux};
              2'b10 : qx_o_mux <= qp_o_mux;
              2'b11 : qx_o_mux <= {qa_o_mux[MSB_A:0], qb_o_mux[MSB_B:0]};
            default : begin
	              end
	endcase
    end


//*** Y mux

    always @(qc_o_mux or qopmode_o_mux or qcarryinsel_o_mux or multsignin_in) begin
	case (qopmode_o_mux[3:2])
              2'b00 : qy_o_mux <= 48'b0;
              2'b01 : qy_o_mux <= 48'b0;

              2'b10 : if((qopmode_o_mux[6:4]) == 3'b100) 
                          qy_o_mux <= {48{multsignin_in}};
                      else
                          qy_o_mux <= 48'hFFFFFFFFFFFF;

              2'b11 : qy_o_mux <= qc_o_mux;
            default : begin
	              end
	endcase
    end


//*** Z mux

    always @(qp_o_mux or qc_o_mux or pcin_in or qopmode_o_mux or qcarryinsel_o_mux) 
    begin
	case (qopmode_o_mux[6:4]) //synopsys full_case
             3'b000 : qz_o_mux <= 48'b0;
             3'b001 : qz_o_mux <= pcin_in;
             3'b010 : qz_o_mux <= qp_o_mux;
             3'b011 : qz_o_mux <= qc_o_mux;
             3'b100 : qz_o_mux <= qp_o_mux; // Use for MACC extend -- multsignin
             3'b101 : qz_o_mux <= {{17{pcin_in[47]}}, pcin_in[47:17]};
             3'b110 : qz_o_mux <= {{17{qp_o_mux[47]}}, qp_o_mux[47:17]};
            //default : begin
	    //          end
	endcase
    end



//*** CarryInSel and OpMode with 1 level of register
    always @(posedge clk_in) begin
	if (rstctrl_in) begin
            qcarryinsel_o_reg1 <= 3'b0;
            qopmode_o_reg1 <= 7'b0;
	end  
	else if (cectrl_in) begin
            qcarryinsel_o_reg1 <= carryinsel_in;
            qopmode_o_reg1 <= opmode_in;
	end
    end


    always @(carryinsel_in or qcarryinsel_o_reg1) begin
	case (CARRYINSELREG)
                  0 : qcarryinsel_o_mux <= carryinsel_in;
                  1 : qcarryinsel_o_mux <= qcarryinsel_o_reg1;
	endcase
    end

    always @(opmode_in or qopmode_o_reg1) begin
	case (OPMODEREG)
                  0 : qopmode_o_mux <= opmode_in;
                  1 : qopmode_o_mux <= qopmode_o_reg1;
	endcase
    end



//*** ALUMODE with 1 level of register
    always @(posedge clk_in) begin
	if (rstalumode_in)
            qalumode_o_reg1 <= 4'b0;
	else if (cealumode_in)
            qalumode_o_reg1 <= alumode_in;
    end


    always @(alumode_in or qalumode_o_reg1) begin
	case (ALUMODEREG)
                  0 : qalumode_o_mux <= alumode_in;
                  1 : qalumode_o_mux <= qalumode_o_reg1;
	endcase
    end

    
//--####################################################################
//--#####                         ALU                              #####
//--####################################################################
 
    always @(qx_o_mux or qy_o_mux or qz_o_mux or qalumode_o_mux, qopmode_o_mux or qcarryin_o_mux) 
    begin
	//if (opmode_valid_flag) begin

           casex ({qopmode_o_mux[3:2], qalumode_o_mux}) //synopsys full_case 
              //---------  ADD --------------
              6'bXX0000 : begin

                 alumode_valid_flag = 1;

                 case (USE_SIMD) 
                    "ONE48", "one48" : begin
                        // verilog will zero_pad qx, qy and qz before addition
	                alu_full_tmp = qz_o_mux + (qx_o_mux + qy_o_mux + qcarryin_o_mux);
                        alu_o = alu_full_tmp[MSB_ALU_FULL:0];
                        carrycascout_o = alu_full_tmp[MAX_ALU_FULL];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = alu_full_tmp[MAX_ALU_FULL];
                           carryout_o[2]  = 1'bx;
                           carryout_o[1]  = 1'bx;
                           carryout_o[0]  = 1'bx;
                        end
                    end
                    "TWO24", "two24" : begin
		        alu_hlf1_tmp = qz_o_mux[((1*MAX_ALU_HALF)-1):0] + (qx_o_mux[((1*MAX_ALU_HALF)-1):0] +
                                       qy_o_mux[((1*MAX_ALU_HALF)-1):0] + qcarryin_o_mux);

		        alu_hlf2_tmp = qz_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] + 
                                       (qx_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] + 
                                       qy_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] );

                        alu_o = { alu_hlf2_tmp[MSB_ALU_HALF:0], alu_hlf1_tmp[MSB_ALU_HALF:0]};

                        carrycascout_o = alu_hlf2_tmp[MAX_ALU_HALF];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = alu_hlf2_tmp[MAX_ALU_HALF];
                           carryout_o[2]  = 1'bx;
                           carryout_o[1]  = alu_hlf1_tmp[MAX_ALU_HALF];
                           carryout_o[0]  = 1'bx;
                        end
                    end
                    "FOUR12", "four12" : begin
		        alu_qrt1_tmp = qz_o_mux[((1*MAX_ALU_QUART)-1):0] + (qx_o_mux[((1*MAX_ALU_QUART)-1):0] +
                                       qy_o_mux[((1*MAX_ALU_QUART)-1):0] + qcarryin_o_mux);

		        alu_qrt2_tmp = qz_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] + 
                                       (qx_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] + 
                                       qy_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] );

		        alu_qrt3_tmp = qz_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] + 
                                       (qx_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] + 
                                       qy_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] );

		        alu_qrt4_tmp = qz_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] + 
                                       (qx_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] + 
                                       qy_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] );

                        alu_o = { alu_qrt4_tmp[MSB_ALU_QUART:0], alu_qrt3_tmp[MSB_ALU_QUART:0], 
                                  alu_qrt2_tmp[MSB_ALU_QUART:0], alu_qrt1_tmp[MSB_ALU_QUART:0]};

                        carrycascout_o = alu_qrt4_tmp[MAX_ALU_QUART];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = alu_qrt4_tmp[MAX_ALU_QUART];
                           carryout_o[2]  = alu_qrt3_tmp[MAX_ALU_QUART];
                           carryout_o[1]  = alu_qrt2_tmp[MAX_ALU_QUART];
                           carryout_o[0]  = alu_qrt1_tmp[MAX_ALU_QUART];
                        end

                    end
                 endcase
              end
              //----------------- SUBTRACT (X + ~Z ) carryin must be 1 ---------------
              6'bXX0001 : begin

                 alumode_valid_flag = 1;

                 case (USE_SIMD) 
                    "ONE48", "one48" : begin
                        // verilog will zero_pad qx, qy and qz before inversing/addition
	                alu_full_tmp = ~qz_o_mux + (qx_o_mux + qy_o_mux + qcarryin_o_mux);
                        alu_o = alu_full_tmp[MSB_ALU_FULL:0];
                        carrycascout_o = ~alu_full_tmp[MAX_ALU_FULL];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = ~alu_full_tmp[MAX_ALU_FULL];
                           carryout_o[2]  = 1'bx;
                           carryout_o[1]  = 1'bx;
                           carryout_o[0]  = 1'bx;
                        end
                    end
                    "TWO24", "two24" : begin
		        alu_hlf1_tmp = ~qz_o_mux[((1*MAX_ALU_HALF)-1):0] + (qx_o_mux[((1*MAX_ALU_HALF)-1):0] +
                                       qy_o_mux[((1*MAX_ALU_HALF)-1):0] + qcarryin_o_mux);

		        alu_hlf2_tmp = ~qz_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] + 
                                       (qx_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] + 
                                       qy_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] );

                        alu_o = { alu_hlf2_tmp[MSB_ALU_HALF:0], alu_hlf1_tmp[MSB_ALU_HALF:0]};

                        carrycascout_o = ~alu_hlf2_tmp[MAX_ALU_HALF];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = ~alu_hlf2_tmp[MAX_ALU_HALF];
                           carryout_o[2]  = 1'bx;
                           carryout_o[1]  = ~alu_hlf1_tmp[MAX_ALU_HALF];
                           carryout_o[0]  = 1'bx;
                        end
                    end
                    "FOUR12", "four12" : begin
		        alu_qrt1_tmp = ~qz_o_mux[((1*MAX_ALU_QUART)-1):0] + (qx_o_mux[((1*MAX_ALU_QUART)-1):0] +
                                       qy_o_mux[((1*MAX_ALU_QUART)-1):0] + qcarryin_o_mux);

		        alu_qrt2_tmp = ~qz_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] + 
                                       (qx_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] + 
                                       qy_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] );

		        alu_qrt3_tmp = ~qz_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] + 
                                       (qx_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] + 
                                       qy_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] );

		        alu_qrt4_tmp = ~qz_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] + 
                                       (qx_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] + 
                                       qy_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] );

                        alu_o = { alu_qrt4_tmp[MSB_ALU_QUART:0], alu_qrt3_tmp[MSB_ALU_QUART:0], 
                                  alu_qrt2_tmp[MSB_ALU_QUART:0], alu_qrt1_tmp[MSB_ALU_QUART:0]};

                        carrycascout_o = ~alu_qrt4_tmp[MAX_ALU_QUART];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = ~alu_qrt4_tmp[MAX_ALU_QUART];
                           carryout_o[2]  = ~alu_qrt3_tmp[MAX_ALU_QUART];
                           carryout_o[1]  = ~alu_qrt2_tmp[MAX_ALU_QUART];
                           carryout_o[0]  = ~alu_qrt1_tmp[MAX_ALU_QUART];
                        end

                    end
                 endcase
              end

              //----------------- NOT (X + Z) ----------------------------------------
              6'bXX0010 : begin

                 alumode_valid_flag = 1;

                 case (USE_SIMD) 
                    "ONE48", "one48" : begin
	                alu_full_tmp = ~(qz_o_mux + (qx_o_mux + qy_o_mux + qcarryin_o_mux));
                        alu_o = alu_full_tmp[MSB_ALU_FULL:0];
                        carrycascout_o = ~alu_full_tmp[MAX_ALU_FULL];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = ~alu_full_tmp[MAX_ALU_FULL];
                           carryout_o[2]  = 1'bx;
                           carryout_o[1]  = 1'bx;
                           carryout_o[0]  = 1'bx;
                        end
                    end
                    "TWO24", "two24" : begin
		        alu_hlf1_tmp = ~(qz_o_mux[((1*MAX_ALU_HALF)-1):0] + (qx_o_mux[((1*MAX_ALU_HALF)-1):0] +
                                       qy_o_mux[((1*MAX_ALU_HALF)-1):0] + qcarryin_o_mux));

		        alu_hlf2_tmp = ~(qz_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] + 
                                       (qx_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] + 
                                       qy_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] ));

                        alu_o = { alu_hlf2_tmp[MSB_ALU_HALF:0], alu_hlf1_tmp[MSB_ALU_HALF:0]};

                        carrycascout_o = ~alu_hlf2_tmp[MAX_ALU_HALF];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = ~alu_hlf2_tmp[MAX_ALU_HALF];
                           carryout_o[2]  = 1'bx;
                           carryout_o[1]  = ~alu_hlf1_tmp[MAX_ALU_HALF];
                           carryout_o[0]  = 1'bx;
                        end
                    end
                    "FOUR12", "four12" : begin
		        alu_qrt1_tmp = ~(qz_o_mux[((1*MAX_ALU_QUART)-1):0] + (qx_o_mux[((1*MAX_ALU_QUART)-1):0] +
                                       qy_o_mux[((1*MAX_ALU_QUART)-1):0] + qcarryin_o_mux));

		        alu_qrt2_tmp = ~(qz_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] + 
                                       (qx_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] + 
                                       qy_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] ));

		        alu_qrt3_tmp = ~(qz_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] + 
                                       (qx_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] + 
                                       qy_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] ));

		        alu_qrt4_tmp = ~(qz_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] + 
                                       (qx_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] + 
                                       qy_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] ));

                        alu_o = { alu_qrt4_tmp[MSB_ALU_QUART:0], alu_qrt3_tmp[MSB_ALU_QUART:0], 
                                  alu_qrt2_tmp[MSB_ALU_QUART:0], alu_qrt1_tmp[MSB_ALU_QUART:0]};

                        carrycascout_o = ~alu_qrt4_tmp[MAX_ALU_QUART];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = ~alu_qrt4_tmp[MAX_ALU_QUART];
                           carryout_o[2]  = ~alu_qrt3_tmp[MAX_ALU_QUART];
                           carryout_o[1]  = ~alu_qrt2_tmp[MAX_ALU_QUART];
                           carryout_o[0]  = ~alu_qrt1_tmp[MAX_ALU_QUART];
                        end

                    end
                 endcase
              end
              //----------------- SUBTRACT (Z - X)  ----------------------------------
              6'bXX0011 : begin

                 alumode_valid_flag = 1;

                 case (USE_SIMD) 
                    "ONE48", "one48" : begin
		        alu_full_tmp = qz_o_mux - (qx_o_mux + qy_o_mux + qcarryin_o_mux);
                        alu_o = alu_full_tmp[MSB_ALU_FULL:0];
                        carrycascout_o = alu_full_tmp[MAX_ALU_FULL];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = ~alu_full_tmp[MAX_ALU_FULL];
                           carryout_o[2]  = 1'bx;
                           carryout_o[1]  = 1'bx;
                           carryout_o[0]  = 1'bx;
                        end
                    end
                    "TWO24", "two24" : begin
		        alu_hlf1_tmp = qz_o_mux[((1*MAX_ALU_HALF)-1):0] - (qx_o_mux[((1*MAX_ALU_HALF)-1):0] +
                                       qy_o_mux[((1*MAX_ALU_HALF)-1):0] + qcarryin_o_mux);

		        alu_hlf2_tmp = qz_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] - 
                                       (qx_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] + 
                                       qy_o_mux[((2*MAX_ALU_HALF)-1):(1*MAX_ALU_HALF)] );

                        alu_o = { alu_hlf2_tmp[MSB_ALU_HALF:0], alu_hlf1_tmp[MSB_ALU_HALF:0]};

                        carrycascout_o = alu_hlf2_tmp[MAX_ALU_HALF];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = ~alu_hlf2_tmp[MAX_ALU_HALF];
                           carryout_o[2]  = 1'bx;
                           carryout_o[1]  = ~alu_hlf1_tmp[MAX_ALU_HALF];
                           carryout_o[0]  = 1'bx;
                        end
                    end
                    "FOUR12", "four12" : begin
	      	        alu_qrt1_tmp = qz_o_mux[((1*MAX_ALU_QUART)-1):0] - (qx_o_mux[((1*MAX_ALU_QUART)-1):0] +
                                       qy_o_mux[((1*MAX_ALU_QUART)-1):0] + qcarryin_o_mux);

		        alu_qrt2_tmp = qz_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] - 
                                       (qx_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] + 
                                       qy_o_mux[((2*MAX_ALU_QUART)-1):(1*MAX_ALU_QUART)] );

		        alu_qrt3_tmp = qz_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] - 
                                       (qx_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] + 
                                       qy_o_mux[((3*MAX_ALU_QUART)-1):(2*MAX_ALU_QUART)] );

		        alu_qrt4_tmp = qz_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] - 
                                       (qx_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] + 
                                       qy_o_mux[((4*MAX_ALU_QUART)-1):(3*MAX_ALU_QUART)] );

                        alu_o = { alu_qrt4_tmp[MSB_ALU_QUART:0], alu_qrt3_tmp[MSB_ALU_QUART:0], 
                                  alu_qrt2_tmp[MSB_ALU_QUART:0], alu_qrt1_tmp[MSB_ALU_QUART:0]};

                        carrycascout_o = alu_qrt4_tmp[MAX_ALU_QUART];
                        // -- if multiply operation then "X"out the carryout 
                        if((qopmode_o_mux[1:0] == 2'b01) || (qopmode_o_mux[3:2] == 2'b01))
                           carryout_o = 4'bx;
                        else begin
                           carryout_o[3]  = ~alu_qrt4_tmp[MAX_ALU_QUART];
                           carryout_o[2]  = ~alu_qrt3_tmp[MAX_ALU_QUART];
                           carryout_o[1]  = ~alu_qrt2_tmp[MAX_ALU_QUART];
                           carryout_o[0]  = ~alu_qrt1_tmp[MAX_ALU_QUART];
                        end

                    end
                 endcase
              end
//----------------------------------------------------------
              //--------------- XOR ------------------
              6'b000100, 6'b000111, 6'b100101, 6'b100110 : begin
                    alu_o = qx_o_mux ^ qz_o_mux;
                    carryout_o = 4'bx;
                    carrycascout_o = 1'bx; 
                    alumode_valid_flag = 1;
              end

              //--------------- XNOR ------------------
              6'b000101, 6'b000110, 6'b100100, 6'b100111 : begin
                    alu_o = qx_o_mux ~^ qz_o_mux;
                    carryout_o = 4'bx;
                    carrycascout_o = 1'bx; 
                    alumode_valid_flag = 1;
              end
//----------------------------------------------------------

           //--------------- AND ------------------
              6'b001100 : begin
                    alu_o = qx_o_mux & qz_o_mux;
                    carryout_o = 4'bx;
                    carrycascout_o = 1'bx; 
                    alumode_valid_flag = 1;
              end

              //--------------- X AND (NOT Z) ------------------
              6'b001101 : begin
                    alu_o = qx_o_mux & (~qz_o_mux);
                    carryout_o = 4'bx;
                    carrycascout_o = 1'bx; 
                    alumode_valid_flag = 1;
              end

              //--------------- X NAND Z ------------------
              6'b001110 : begin
                    alu_o = ~(qx_o_mux & qz_o_mux);
                    carryout_o = 4'bx;
                    carrycascout_o = 1'bx; 
                    alumode_valid_flag = 1;
              end

              //--------------- (NOT X) OR Z ------------------
              6'b001111 : begin
                    alu_o = (~qx_o_mux) | (qz_o_mux);
                    carryout_o = 4'bx;
                    carrycascout_o = 1'bx; 
                    alumode_valid_flag = 1;
              end
//----------------------------------------------------------

              //--------------- X OR Z ------------------
              6'b101100 : begin
                    alu_o = qx_o_mux | qz_o_mux;
                    carryout_o = 4'bx;
                    carrycascout_o = 1'bx; 
                    alumode_valid_flag = 1;
              end

              //--------------- X OR ~Z ------------------
              6'b101101 : begin
                    alu_o = (qx_o_mux) |  (~qz_o_mux);
                    carryout_o = 4'bx;
                    carrycascout_o = 1'bx; 
                    alumode_valid_flag = 1;
              end

              //--------------- X NOR Z ------------------
              6'b101110 : begin
                    alu_o = ~((qx_o_mux) | (qz_o_mux));
                    carryout_o = 4'bx;
                    carrycascout_o = 1'bx; 
                    alumode_valid_flag = 1;
              end

              //--------------- (NOT X) and Z ------------------
              6'b101111 : begin
                    alu_o = (~qx_o_mux) & (qz_o_mux);
                    carryout_o = 4'bx;
                    carrycascout_o = 1'bx; 
                    alumode_valid_flag = 1;
              end

//----------------------------------------------------------
//----------------------------------------------------------

             /* default : begin 
                    alu_o = 48'bx;
                    carryout_o = 4'bx;
                    carrycascout_o = 1'bx; 

                    alumode_valid_flag = 0;

//                    $display("ALUMODE Input Warning : The ALUMODE %b to DSP48E instance %m is either invalid or the OPMODE %b for that specific ALUMODE is invalid at %.3f ns.", qalumode_o_mux, qopmode_o_mux, $time/1000.0);
              end*/
           endcase

        //end

    end // always @ (qalumode_o_mux)
    
//*** CarryIn Mux and Register

//-------  input 0
    always @(posedge clk_in) begin
	if (rstallcarryin_in)
            qcarryin_o_reg0 <= 1'b0;
	else if (cecarryin_in)
            qcarryin_o_reg0 <= carryin_in;
    end

    always @(carryin_in or qcarryin_o_reg0) begin
	case (CARRYINREG)
                  0 : qcarryin_o_mux0 <= carryin_in;
                  1 : qcarryin_o_mux0 <= qcarryin_o_reg0;
	endcase
    end

//-------  input 7
    always @(posedge clk_in) begin
	if (rstallcarryin_in)
            qcarryin_o_reg7 <= 1'b0;
	else if (cemultcarryin_in)
            qcarryin_o_reg7 <=  qa_o_mux[24] ~^ qb_o_mux[17];  // xnor
    end

    always @(qa_o_mux[24] or qb_o_mux[17] or qcarryin_o_reg7) begin
	case (MULTCARRYINREG)
                  0 : qcarryin_o_mux7 <= qa_o_mux[24] ~^ qb_o_mux[17];
                  1 : qcarryin_o_mux7 <= qcarryin_o_reg7;
	endcase
    end
   

    always @(qcarryin_o_mux0 or pcin_in[47] or carrycascin_in or carrycascout_o_mux or qp_o_mux[47], qcarryin_o_mux7, qcarryinsel_o_mux) begin
	case (qcarryinsel_o_mux)
              3'b000 : qcarryin_o_mux <= qcarryin_o_mux0;
              3'b001 : qcarryin_o_mux <= ~pcin_in[47];
              3'b010 : qcarryin_o_mux <= carrycascin_in;
              3'b011 : qcarryin_o_mux <= pcin_in[47];
              3'b100 : qcarryin_o_mux <= carrycascout_o_mux;
              3'b101 : qcarryin_o_mux <= ~qp_o_mux[47];
              3'b110 : qcarryin_o_mux <= qcarryin_o_mux7;
              3'b111 : qcarryin_o_mux <= qp_o_mux[47];
            default : begin
	              end
	endcase
    end
//--####################################################################
//--#####             CARRYOUT and CARRYCASCOUT                    #####
//--####################################################################
//*** register with 1 level of register
    always @(posedge clk_in) begin
        if ((rstp_in) ||
            ((AUTORESET_PATTERN_DETECT == "TRUE") && (
              ((AUTORESET_PATTERN_DETECT_OPTINV == "MATCH") && pdet_o_reg1) ||
              ((AUTORESET_PATTERN_DETECT_OPTINV == "NOT_MATCH") && (pdet_o_reg2 && !pdet_o_reg1)))
            )
           ) begin
               carrycascout_o_reg <= 1'b0;
               carryout_o_reg     <= 4'b0;
             end
        else if (cep_in) begin
                   carrycascout_o_reg <= carrycascout_o;
                   carryout_o_reg     <= carryout_o;
             end
    end

    always @(carryout_o or carryout_o_reg) begin
        case (PREG)
                  0 : carryout_o_mux <= carryout_o;
                  1 : carryout_o_mux <= carryout_o_reg;
            default : begin
//                          $display("Attribute Syntax Error : The attribute PREG on DSP48E instance %m is set to %d.  Legal values for this attribute are 0 or 1.", PREG);
//                          $finish;
                      end
        endcase
    end

    always @(carrycascout_o or carrycascout_o_reg) begin
        case (PREG)
                  0 : carrycascout_o_mux <= carrycascout_o;
                  1 : carrycascout_o_mux <= carrycascout_o_reg;
            default : begin
//                          $display("Attribute Syntax Error : The attribute PREG on DSP48E instance %m is set to %d.  Legal values for this attribute are 0 or 1.", PREG);
//                          $finish;
                      end
        endcase
    end

//CR 219047 (2)

    always @(qmult_o_mux[(MSB_A_MULT+MSB_B_MULT+1)] or qopmode_o_mux[3:0]) begin
        if(qopmode_o_mux[3:0] == 4'b0101)
           multsignout_o_opmode = qmult_o_mux[(MSB_A_MULT+MSB_B_MULT+1)];
        else
           multsignout_o_opmode = 1'bx;
    end 


    always @(multsignout_o_opmode or qmultsignout_o_reg) begin
        case (PREG)
                  0 : multsignout_o_mux <= multsignout_o_opmode;
                  1 : multsignout_o_mux <= qmultsignout_o_reg;

            default : begin
//                          $display("Attribute Syntax Error : The attribute PREG on DSP48E instance %m is set to %d.  Legal values for this attribute are 0 or 1.", PREG);
//                          $finish;
                      end
        endcase
    end

    assign carryout_x_o[3] =  carryout_o_mux[3];
    assign carryout_x_o[2] = (USE_SIMD == "FOUR12") ? carryout_o_mux[2] : 1'bx;
    assign carryout_x_o[1] = ((USE_SIMD == "TWO24") ||  (USE_SIMD == "FOUR12")) ? carryout_o_mux[1] : 1'bx;
    assign carryout_x_o[0] = (USE_SIMD == "FOUR12") ? carryout_o_mux[0] : 1'bx;

//--####################################################################
//--#####                    PCOUT and MULTSIGNOUT                 #####
//--####################################################################
//*** Output register P with 1 level of register
    always @(posedge clk_in) begin
	if ((rstp_in) || 
            ((AUTORESET_PATTERN_DETECT == "TRUE") && (
              ((AUTORESET_PATTERN_DETECT_OPTINV == "MATCH") && pdet_o_reg1) ||
              ((AUTORESET_PATTERN_DETECT_OPTINV == "NOT_MATCH") && (pdet_o_reg2 && !pdet_o_reg1))) 
            )
           )
         begin
           qp_o_reg1 <= 48'b0;
           qmultsignout_o_reg <= 1'b0;
        end 
	else if (cep_in) begin
                  qp_o_reg1 <= alu_o;
                  qmultsignout_o_reg <= multsignout_o_opmode;
             end
    end
 
    always @(qp_o_reg1 or alu_o) begin
	case (PREG)
                  0 : qp_o_mux <= alu_o;
                  1 : qp_o_mux <= qp_o_reg1;
	endcase
    end

//--####################################################################
//--#####                    Pattern Detector                      #####
//--####################################################################
    assign opmode_valid_flag = 1'b1;
    assign pdet_o_mux  = ((USE_PATTERN_DETECT == "NO_PATDET") | ~opmode_valid_flag | ~alumode_valid_flag) ? 1'bx : (PREG == 1) ? pdet_o_reg1 : pdet_o;
    //assign pdet_o_mux  = ((USE_PATTERN_DETECT == "NO_PATDET") | 1'b0 | ~alumode_valid_flag) ? 1'bx : (PREG == 1) ? pdet_o_reg1 : pdet_o;
    assign pdetb_o_mux = ((USE_PATTERN_DETECT == "NO_PATDET") | ~opmode_valid_flag | ~alumode_valid_flag) ? 1'bx : (PREG == 1) ? pdetb_o_reg1 : pdetb_o;
    //assign pdetb_o_mux = ((USE_PATTERN_DETECT == "NO_PATDET") | 1'b0 | ~alumode_valid_flag) ? 1'bx : (PREG == 1) ? pdetb_o_reg1 : pdetb_o;

    //always @(alu_o, qc_o_mux, negedge gsr_in) begin
    always @(alu_o, qc_o_mux) begin

        //-- Select the pattern
        case(SEL_PATTERN)
           "PATTERN" : pattern_qp <= PATTERN;
           "C"       : pattern_qp <= qc_o_mux;
	endcase

        //-- Select the mask  -- if ROUNDING MASK set, use rounding mode, else use SEL_MASK 
        case(SEL_ROUNDING_MASK)
           "SEL_MASK" : 
               case(SEL_MASK)
                  "MASK" : mask_qp <= MASK;
                  "C"    : mask_qp <= qc_o_mux;
       	       endcase
           "MODE1" :  mask_qp     <=   ~qc_o_mux << 1;
           "MODE2" :  mask_qp     <=   ~qc_o_mux << 2;
        endcase
                    
    end

        //--  now do the pattern detection
        
    //always @(alu_o, mask_qp, pattern_qp, gsr_in) begin
    always @(alu_o, mask_qp, pattern_qp) begin
        if((alu_o |  mask_qp) == (pattern_qp | mask_qp))
          pdet_o <= 1'b1;
        else 
          pdet_o <= 1'b0;
       
        if((alu_o |  mask_qp) == (~pattern_qp | mask_qp))
          pdetb_o <= 1'b1;
        else 
          pdetb_o <= 1'b0;
    end

//*** Output register PATTERN DETECT and UNDERFLOW / OVERFLOW 
    always @(posedge clk_in) begin
        if((rstp_in) ||
            ((AUTORESET_PATTERN_DETECT == "TRUE") && (
              ((AUTORESET_PATTERN_DETECT_OPTINV == "MATCH") && pdet_o_reg1) ||
              ((AUTORESET_PATTERN_DETECT_OPTINV == "NOT_MATCH") && (pdet_o_reg2 && !pdet_o_reg1)))
            )
          )
          begin 
            pdet_o_reg1  <= 1'b0;
            pdet_o_reg2  <= 1'b0;
            pdetb_o_reg1 <= 1'b0;
            pdetb_o_reg2 <= 1'b0;
          end
	else if(cep_in)
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
    always @(pdet_o_reg1 or pdet_o_reg2 or pdetb_o_reg1 or pdetb_o_reg2) begin
        case (USE_PATTERN_DETECT)
          "NO_PATDET" : begin
                          overflow_o  <= 1'bx;
                          underflow_o <= 1'bx;
                        end
           default    : begin
               case (PREG)

                   0 : begin
                          overflow_o  <= 1'bx;
                          underflow_o <= 1'bx;
                       end
                   default : begin

                               overflow_o  <= pdet_o_reg2 & !pdet_o_reg1 & !pdetb_o_reg1;
                               underflow_o <= pdetb_o_reg2  & !pdet_o_reg1 & !pdetb_o_reg1;
                             end
               endcase
           end
        endcase
    end

endmodule // DSP48E
