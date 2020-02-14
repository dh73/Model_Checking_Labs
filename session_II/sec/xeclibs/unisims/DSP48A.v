///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Multifunctional, Cascadable, 48-bit Output Arithmetic Block
// /___/   /\     Filename : DSP48A.v
// \   \  /  \    Timestamp : Thu Feb 23 17:09:20 PST 2006
//  \___\/\___\
//
// Revision:
//    04/21/06 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module DSP48A (BCOUT, CARRYOUT, P, PCOUT, A, B, C, CARRYIN, CEA, CEB, CEC, CECARRYIN, CED, CEM, CEOPMODE, CEP, CLK, D, OPMODE, PCIN, RSTA, RSTB, RSTC, RSTCARRYIN, RSTD, RSTM, RSTOPMODE, RSTP); 

    parameter integer A0REG = 0;
    parameter integer A1REG = 1;
    parameter integer B0REG = 0;
    parameter integer B1REG = 1;
    parameter integer CARRYINREG = 1;
    parameter CARRYINSEL = "CARRYIN";
    parameter integer CREG = 1;
    parameter integer DREG = 1;
    parameter integer MREG = 1;
    parameter integer OPMODEREG = 1;
    parameter integer PREG = 1;
    parameter RSTTYPE = "SYNC";


    output [17:0] BCOUT; 
    output CARRYOUT; 
    output [47:0] P; 
    output [47:0] PCOUT;

    input [17:0] A;
    input [17:0] B;

    input [47:0] C;
    input CARRYIN;
    input CEA;
    input CEB;
    input CEC;
    input CECARRYIN;
    input CED;
    input CEM;
    input CEOPMODE;
    input CEP;
    input CLK;
    input [17:0] D;
    input [7:0] OPMODE;
    input [47:0] PCIN;
    input RSTA;
    input RSTB;
    input RSTC;
    input RSTCARRYIN;
    input RSTD;
    input RSTM;  
    input RSTOPMODE;
    input RSTP;

//------------------- constants -------------------------
    localparam MAX_BCOUT      = 18;
    localparam MAX_P          = 48;
    localparam MAX_PCOUT      = 48;
 
    localparam MAX_A          = 18;
    localparam MAX_B          = 18;
    localparam MAX_BCIN       = 18;
    localparam MAX_C          = 48;
    localparam MAX_D          = 18;
    localparam MAX_OPMODE     = 8;
    localparam MAX_PCIN       = 48;


    localparam MAX_MULT_A     = 18;
    localparam MAX_MULT_B     = 18;
    localparam MAX_MULT_AB    = 36;
    localparam MAX_MUX_XZ     = 48;

    localparam MSB_BCOUT      = MAX_BCOUT - 1;
    localparam MSB_P          = MAX_P - 1;
    localparam MSB_PCOUT      = MAX_PCOUT - 1;

    localparam MSB_A          = MAX_A - 1;
    localparam MSB_B          = MAX_B - 1;
    localparam MSB_BCIN       = MAX_BCIN - 1;
    localparam MSB_C          = MAX_C - 1;
    localparam MSB_D          = MAX_D - 1;
    localparam MSB_OPMODE     = MAX_OPMODE - 1;
    localparam MSB_PCIN       = MAX_PCIN - 1;

    localparam MSB_MULT_A     = MAX_MULT_A - 1;
    localparam MSB_MULT_B     = MAX_MULT_B - 1;

    localparam MSB_MULT_AB    = MAX_MULT_AB - 1;
//--------------------------------------------------------------
    reg [MSB_A:0] qa_o_mux, qa_o_reg1, qa_o_reg2;
    reg [MSB_B:0] b_o_mux, qb_o_mux0 = 18'b0, qb_o_mux = 18'b0, qb_o_reg1, qb_o_reg2, preadd, mux_preadd;
    reg [MSB_C:0] qc_o_mux, qc_o_reg1;

    reg carryinsel_attr, carryinsel_o_mux;
    reg qcarryin_o_mux, qcarryin_o_reg1;
    reg carryout_o;

    reg [MSB_MULT_AB:0] qmult_o_mux, qmult_o_reg1;

    reg [MSB_D:0] qd_o_mux, qd_o_reg1;

    reg [MSB_P:0] qp_o_mux = 48'b0, qp_o_reg1;
    reg [(MAX_MUX_XZ-1):0] qx_o_mux, qz_o_mux;
    reg [MSB_OPMODE:0]  qopmode_o_mux, qopmode_o_reg1;

    
    wire add_flag ;
    assign add_flag = 1;
    reg [(MAX_MUX_XZ-1):0] add_o;
    
    wire [MSB_A:0] a_in;
    wire [MSB_B:0] b_in;
    wire [MSB_BCIN:0] bcin_in;
    wire [MSB_C:0] c_in;
    wire [MSB_D:0] d_in;
    wire [MSB_MULT_AB:0] mult_o;
    wire [MSB_OPMODE:0] opmode_in;
    wire [MSB_PCIN:0] pcin_in;

    wire carryout_x_o;
    wire carryin_in;
    wire cea_in;
    wire ceb_in;
    wire cec_in;
    wire cecarryin_in;
    wire ced_in;
    wire cem_in;
    wire ceopmode_in;
    wire cep_in;
    wire clk_in;
    wire rsta_in;
    wire rstb_in;
    wire rstc_in;
    wire rstcarryin_in;
    wire rstd_in;
    wire rstm_in;
    wire rstopmode_in;
    wire rstp_in;

//----------------------------------------------------------------------
//------------------------  Output Ports  ------------------------------
//----------------------------------------------------------------------
    buf b_bcout_o[MSB_BCOUT:0] (BCOUT, qb_o_mux);
    buf b_carryout (CARRYOUT, carryout_x_o);
    buf b_p_o[MSB_P:0] (P, qp_o_mux);
    buf b_pcout_o[MSB_PCOUT:0] (PCOUT, qp_o_mux);

//-----------------------------------------------------
//-----------   Inputs --------------------------------
//-----------------------------------------------------
    buf b_a[MSB_A:0] (a_in, A);
    buf b_b[MSB_B:0] (b_in, B);
    buf b_c[MSB_C:0] (c_in, C);
    buf b_carryin (carryin_in, CARRYIN);
    buf b_cea (cea_in, CEA);
    buf b_ceb (ceb_in, CEB);
    buf b_cec (cec_in, CEC);
    buf b_cecarryin (cecarryin_in, CECARRYIN);
    buf b_ced (ced_in, CED);
    buf b_cem (cem_in, CEM);
    buf b_ceopmode (ceopmode_in, CEOPMODE);
    buf b_cep (cep_in, CEP);
    buf b_clk (clk_in, CLK);
    buf b_d[MSB_D:0] (d_in, D);
    buf b_opmode[MSB_OPMODE:0] (opmode_in, OPMODE);
    buf b_pcin[MSB_PCIN:0] (pcin_in, PCIN);
    buf b_rsta (rsta_in, RSTA);
    buf b_rstb (rstb_in, RSTB);
    buf b_rstc (rstc_in, RSTC);
    buf b_rstcarryin (rstcarryin_in, RSTCARRYIN);
    buf b_rstd (rstd_in, RSTD);
    buf b_rstm (rstm_in, RSTM);
    buf b_rstopmode (rstopmode_in, RSTOPMODE);
    buf b_rstp (rstp_in, RSTP);

    localparam rst_async_flag = (RSTTYPE == "SYNC") ? 0 :1 ;

//---------------------------------------------------- 
//*** Input register A with 2 level deep of registers
//---------------------------------------------------- 
// Asynchronous Operation
    always @(posedge clk_in, posedge rsta_in) begin
      if(rst_async_flag) begin
         if(rsta_in) begin
            qa_o_reg1 <= 18'b0;
            qa_o_reg2 <= 18'b0;
         end // if rsta_in
         else if(cea_in) begin
            qa_o_reg1 <= a_in;
            qa_o_reg2 <= qa_o_reg1;
         end // cea_in 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge clk_in) begin
      if(!rst_async_flag) begin
         if(rsta_in) begin
            qa_o_reg1 <= 18'b0;
            qa_o_reg2 <= 18'b0;
         end // if rsta_in
         else if(cea_in) begin
            qa_o_reg1 <= a_in;
            qa_o_reg2 <= qa_o_reg1;
         end // cea_in 
      end // if rst_async_flg
    end // always

    always @(a_in or qa_o_reg1 or qa_o_reg2) begin
        if((A0REG==0) && (A1REG==0))
            qa_o_mux <= a_in;
        else if(((A0REG==0) && (A1REG==1)) || ((A0REG==1) && (A1REG==0)))
            qa_o_mux <= qa_o_reg1;
        else if((A0REG==1) && (A1REG==1))
            qa_o_mux <= qa_o_reg2;  
    end


//---------------------------------------------------- 
//*** Input register B with 2 level deep of registers
//---------------------------------------------------- 
// Asynchronous Operation 
    always @(posedge clk_in, posedge rstb_in) begin
      if(rst_async_flag) begin
         if(rstb_in) begin
            qb_o_reg1 <= 18'b0;
            qb_o_reg2 <= 18'b0;
         end // if rstb_in
         else if(ceb_in) begin
            qb_o_reg1 <= b_in;
            qb_o_reg2 <= mux_preadd;
         end // ceb_in 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge clk_in) begin
      if(!rst_async_flag) begin
         if(rstb_in) begin
            qb_o_reg1 <= 18'b0;
            qb_o_reg2 <= 18'b0;
         end // if rstb_in
         else if(ceb_in) begin
            qb_o_reg1 <= b_in;
            qb_o_reg2 <= mux_preadd;
         end // ceb_in 
      end // if rst_async_flg
    end // always

   
//*** PRE_ADD 
    always @(qopmode_o_mux, b_in, qd_o_mux, qb_o_reg1) begin
       if(((B0REG==0) && (B1REG==0)) || ((B0REG==0) && (B1REG==1))) begin
          qb_o_mux0 = b_in; 
          if(qopmode_o_mux[6] == 0) 
               preadd = (qd_o_mux + b_in);
          else if(qopmode_o_mux[6] == 1) 
               preadd = (qd_o_mux - b_in);
       end
       else if(((B0REG==1) && (B1REG==1)) || ((B0REG==1) && (B1REG==0))) begin
          qb_o_mux0 = qb_o_reg1; 
          if(qopmode_o_mux[6] == 0) 
               preadd = (qd_o_mux + qb_o_reg1);
          else if(qopmode_o_mux[6] == 1) 
                preadd = (qd_o_mux - qb_o_reg1);
       end
    end
                             
    always @(qopmode_o_mux[4], preadd, qb_o_mux0) begin
       if(qopmode_o_mux[4] == 1) 
           mux_preadd = preadd;
       else if(qopmode_o_mux[4] == 0)
           mux_preadd = qb_o_mux0;
    end
   
    always @(mux_preadd, qb_o_reg2) begin
       if(((B0REG==0) && (B1REG==0)) || ((B0REG==1) && (B1REG==0)))
           qb_o_mux = mux_preadd;
       else if(((B0REG==1) && (B1REG==1)) || ((B0REG==0) && (B1REG==1)))
           qb_o_mux = qb_o_reg2;
    end


//---------------------------------------------------- 
//*** Input register C with 1 level deep of registers
//---------------------------------------------------- 
// Asynchronous Operation
    always @(posedge clk_in, posedge rstc_in) begin
      if(rst_async_flag) begin
         if(rstc_in) begin
            qc_o_reg1 <= 18'b0;
         end // if rstc_in
         else if(cec_in) begin
            qc_o_reg1 <= c_in;
         end // cec_in 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge clk_in) begin
      if(!rst_async_flag) begin
         if(rstc_in) begin
            qc_o_reg1 <= 18'b0;
         end // if rstc_in
         else if(cec_in) begin
            qc_o_reg1 <= c_in;
         end // cec_in 
      end // if rst_async_flg
    end // always

    always @(c_in or qc_o_reg1) begin
	case (CREG)
                  0 : qc_o_mux <= c_in;
                  1 : qc_o_mux <= qc_o_reg1;
	endcase
    end

//---------------------------------------------------- 
//*** Input register D with 1 level deep of registers
//---------------------------------------------------- 
// Asynchronous Operation
    always @(posedge clk_in, posedge rstd_in) begin
      if(rst_async_flag) begin
         if(rstd_in) begin
            qd_o_reg1 <= 18'b0;
         end // if rstd_in
         else if(ced_in) begin
            qd_o_reg1 <= d_in;
         end // ced_in 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge clk_in) begin
      if(!rst_async_flag) begin
         if(rstd_in) begin
            qd_o_reg1 <= 18'b0;
         end // if rstd_in
         else if(ced_in) begin
            qd_o_reg1 <= d_in;
         end // ced_in 
      end // if rst_async_flg
    end // always

    always @(d_in or qd_o_reg1) begin
	case (DREG)
                  0 : qd_o_mux <= d_in;
                  1 : qd_o_mux <= qd_o_reg1;
	endcase
    end


//---------------------------------------------------- 
//*** 18x18 Multiplier
//---------------------------------------------------- 
    assign mult_o = {{MAX_MULT_A{qa_o_mux[MSB_MULT_A]}}, qa_o_mux} * {{MAX_MULT_B{qb_o_mux[MSB_MULT_B]}}, qb_o_mux};

// Asynchronous Operation
    always @(posedge clk_in, posedge rstm_in) begin
      if(rst_async_flag) begin
         if(rstm_in) begin
            qmult_o_reg1 <= 36'b0;
         end // if rstm_in
         else if(cem_in) begin
            qmult_o_reg1 <= mult_o;
         end // cem_in 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge clk_in) begin
      if(!rst_async_flag) begin
         if(rstm_in) begin
            qmult_o_reg1 <= 36'b0;
         end // if rstm_in
         else if(cem_in) begin
            qmult_o_reg1 <= mult_o;
         end // cem_in 
      end // if rst_async_flg
    end // always

    always @(mult_o or qmult_o_reg1) begin
	case (MREG)
                  0 : qmult_o_mux <= mult_o;
                  1 : qmult_o_mux <= qmult_o_reg1;
	endcase
    end


//*** X mux
    
    always @(qp_o_mux or qa_o_mux or qd_o_mux or qb_o_mux or qmult_o_mux or qopmode_o_mux) begin
	case (qopmode_o_mux[1:0])
              2'b00 : qx_o_mux <= 48'b0;
              2'b01 : qx_o_mux <= {{12{qmult_o_mux[MSB_MULT_AB]}}, qmult_o_mux};
              2'b10 : qx_o_mux <= qp_o_mux;
              2'b11 : qx_o_mux <= {qd_o_mux[11:0], qa_o_mux[17:0], qb_o_mux[17:0]};
            default : begin
	              end
	endcase
    end


//*** Z mux

    always @(qp_o_mux or qc_o_mux or pcin_in or qopmode_o_mux) begin
	case (qopmode_o_mux[3:2])
             3'b00 : qz_o_mux <= 48'b0;
             3'b01 : qz_o_mux <= pcin_in;
             3'b10 : qz_o_mux <= qp_o_mux;
             3'b11 : qz_o_mux <= qc_o_mux;
            default : begin
	              end
	endcase
    end


//---------------------------------------------------- 
//*** CarryIn 1 level of register
//---------------------------------------------------- 
    always @(qopmode_o_mux[5], carryin_in) begin
	case (CARRYINSEL)
                  "CARRYIN" : carryinsel_o_mux <= carryin_in;
                  "OPMODE5" : carryinsel_o_mux <= qopmode_o_mux[5];
	endcase
    end

// Asynchronous Operation
    always @(posedge clk_in, posedge rstcarryin_in) begin
      if(rst_async_flag) begin
         if(rstcarryin_in) begin
            qcarryin_o_reg1 <= 1'b0;
         end // if rstcarryin_in
         else if(cecarryin_in) begin
            qcarryin_o_reg1 <= carryinsel_o_mux;
         end // cecarryin_in 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge clk_in) begin
	if (rstcarryin_in) begin
            qcarryin_o_reg1 <= 1'b0;
	end  
	else if (cecarryin_in) begin
            qcarryin_o_reg1 <= carryinsel_o_mux;
	end
    end


    always @(carryinsel_o_mux or qcarryin_o_reg1) begin
	case (CARRYINREG)
                  0 : qcarryin_o_mux <= carryinsel_o_mux;
                  1 : qcarryin_o_mux <= qcarryin_o_reg1;
	endcase
    end


//---------------------------------------------------- 
//*** Opmode 1 level of register
//---------------------------------------------------- 
// Asynchronous Operation
    always @(posedge clk_in, posedge rstopmode_in) begin
      if(rst_async_flag) begin
         if(rstopmode_in) begin
            qopmode_o_reg1 <= 8'b0;
         end // if rstopmode_in
         else if(ceopmode_in) begin
            qopmode_o_reg1 <= opmode_in;
         end // ceopmode_in 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge clk_in) begin
	if (rstopmode_in) begin
            qopmode_o_reg1 <= 8'b0;
	end  
	else if (ceopmode_in) begin
            qopmode_o_reg1 <= opmode_in;
	end
    end


    always @(opmode_in or qopmode_o_reg1) begin
	case (OPMODEREG)
                  0 : qopmode_o_mux <= opmode_in;
                  1 : qopmode_o_mux <= qopmode_o_reg1;
	endcase
    end


  always @(qopmode_o_mux or carryinsel_attr or qz_o_mux or qx_o_mux or qcarryin_o_mux or add_flag) begin
// ***  Add/Subtract
        if (add_flag) begin
            if (qopmode_o_mux[7] == 1'b1)
                {carryout_o, add_o} = qz_o_mux - qx_o_mux - qcarryin_o_mux;
            else if (qopmode_o_mux[7] == 1'b0)
                {carryout_o, add_o} = qz_o_mux + qx_o_mux  + qcarryin_o_mux;
        end // if (add_flag = 1)

    end // always @ (qopmode_o_mux)

//---------------------------------------------------- 
//*** Output register P with 1 level of register
//---------------------------------------------------- 
// Asynchronous Operation
    always @(posedge clk_in, posedge rstp_in) begin
      if(rst_async_flag) begin
         if(rstp_in) begin
            qp_o_reg1 <= 48'b0;
         end // if rstp_in
         else if(cep_in) begin
            qp_o_reg1 <= add_o;
         end // cep_in 
      end // if rst_async_flg
    end

// Synchronous Operation
    always @(posedge clk_in) begin
	if (rstp_in)
            qp_o_reg1 <= 48'b0;
	else if (cep_in)
            qp_o_reg1 <= add_o;
    end
 
    always @(qp_o_reg1 or add_o) begin
	case (PREG)
                  0 : qp_o_mux <= add_o;
                  1 : qp_o_mux <= qp_o_reg1;
	endcase
    end

//---------------------------------------------------- 
//*** CARRYOUT
//---------------------------------------------------- 
assign carryout_x_o = carryout_o;


endmodule // DSP48A

