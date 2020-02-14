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
// /___/   /\     Filename : DSP48A1.v
// \   \  /  \    Timestamp : Thu Aug 16 14:46:39 PDT 2007
//  \___\/\___\
//
// Revision:
//    08/16/07 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module DSP48A1 (BCOUT, CARRYOUT, CARRYOUTF, M, P, PCOUT, A, B, C, CARRYIN, CEA, CEB, CEC, CECARRYIN, CED, CEM, CEOPMODE, CEP, CLK, D, OPMODE, PCIN, RSTA, RSTB, RSTC, RSTCARRYIN, RSTD, RSTM, RSTOPMODE, RSTP); 

    parameter integer A0REG = 0;
    parameter integer A1REG = 1;
    parameter integer B0REG = 0;
    parameter integer B1REG = 1;
    parameter integer CARRYINREG = 1;
    parameter integer CARRYOUTREG = 1;
    parameter CARRYINSEL = "OPMODE5";
    parameter integer CREG = 1;
    parameter integer DREG = 1;
    parameter integer MREG = 1;
    parameter integer OPMODEREG = 1;
    parameter integer PREG = 1;
    parameter RSTTYPE = "SYNC";


    output [17:0] BCOUT; 
    output CARRYOUT; 
    output CARRYOUTF; 
    output [35:0] M; 
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

    pulldown BCIN_tmp[17:0] (BCIN);
    pulldown(CARRYIN);
    pulldown PCIN_tmp[47:0] (PCIN);


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
    localparam MSB_M          = MAX_MULT_AB - 1;
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
    reg carryout_o = 1'b0;
    reg qcarryout_o_mux = 1'b0; 
    reg qcarryout_o_reg1 = 1'b0;

    reg [MSB_MULT_AB:0] qmult_o_mux, qmult_o_reg1;

    reg [MSB_D:0] qd_o_mux, qd_o_reg1;

    reg [MSB_P:0] qp_o_mux = 48'b0, qp_o_reg1;

    reg [(MAX_MUX_XZ-1):0] qx_o_mux, qz_o_mux;
    reg [MSB_OPMODE:0]  qopmode_o_mux, qopmode_o_reg1;

    wire add_flag; 
    assign add_flag =1;

    reg B_INPUT_flag;

    reg [(MAX_MUX_XZ-1):0] add_o;

    wire [MSB_MULT_AB:0] mult_o;

    wire carryout_x_o;

    localparam rst_async_flag = (RSTTYPE == "SYNC") ? 0 :1 ;

//---------------------------------------------------- 
//*** Input register A with 2 level deep of registers
//---------------------------------------------------- 
// Asynchronous Operation
    always @(posedge CLK, posedge RSTA) begin
      if(rst_async_flag) begin
         if(RSTA) begin
            qa_o_reg1 <= 18'b0;
            qa_o_reg2 <= 18'b0;
         end // if RSTA
         else if(CEA) begin
            qa_o_reg1 <= A;
            qa_o_reg2 <= qa_o_reg1;
         end // CEA 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge CLK) begin
      if(!rst_async_flag) begin
         if(RSTA) begin
            qa_o_reg1 <= 18'b0;
            qa_o_reg2 <= 18'b0;
         end // if RSTA
         else if(CEA) begin
            qa_o_reg1 <= A;
            qa_o_reg2 <= qa_o_reg1;
         end // CEA 
      end // if rst_async_flg
    end // always

    always @(A or qa_o_reg1 or qa_o_reg2) begin
        if((A0REG==0) && (A1REG==0))
            qa_o_mux <= A;
        else if(((A0REG==0) && (A1REG==1)) || ((A0REG==1) && (A1REG==0)))
            qa_o_mux <= qa_o_reg1;
        else if((A0REG==1) && (A1REG==1))
            qa_o_mux <= qa_o_reg2;  
    end


//---------------------------------------------------- 
//*** Input register B with 2 level deep of registers
//---------------------------------------------------- 
// Asynchronous Operation 
    always @(posedge CLK, posedge RSTB) begin
      if(rst_async_flag) begin
         if(RSTB) begin
            qb_o_reg1 <= 18'b0;
            qb_o_reg2 <= 18'b0;
         end // if RSTB
         else if(CEB) begin
            qb_o_reg1 <= B;
            qb_o_reg2 <= mux_preadd;
         end // CEB 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge CLK) begin
      if(!rst_async_flag) begin
         if(RSTB) begin
            qb_o_reg1 <= 18'b0;
            qb_o_reg2 <= 18'b0;
         end // if RSTB
         else if(CEB) begin
            qb_o_reg1 <= B;
            qb_o_reg2 <= mux_preadd;
         end // CEB 
      end // if rst_async_flg
    end // always

   
//*** PRE_ADD 
    always @(qopmode_o_mux, B, qd_o_mux, qb_o_reg1) begin
       if(((B0REG==0) && (B1REG==0)) || ((B0REG==0) && (B1REG==1))) begin
          qb_o_mux0 = B; 
          if(qopmode_o_mux[6] == 0) 
               preadd = (qd_o_mux + B);
          else if(qopmode_o_mux[6] == 1) 
               preadd = (qd_o_mux - B);
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
    always @(posedge CLK, posedge RSTC) begin
      if(rst_async_flag) begin
         if(RSTC) begin
            qc_o_reg1 <= 18'b0;
         end // if RSTC
         else if(CEC) begin
            qc_o_reg1 <= C;
         end // CEC 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge CLK) begin
      if(!rst_async_flag) begin
         if(RSTC) begin
            qc_o_reg1 <= 18'b0;
         end // if RSTC
         else if(CEC) begin
            qc_o_reg1 <= C;
         end // CEC 
      end // if rst_async_flg
    end // always

    always @(C or qc_o_reg1) begin
	case (CREG)
                  0 : qc_o_mux <= C;
                  1 : qc_o_mux <= qc_o_reg1;
	endcase
    end

//---------------------------------------------------- 
//*** Input register D with 1 level deep of registers
//---------------------------------------------------- 
// Asynchronous Operation
    always @(posedge CLK, posedge RSTD) begin
      if(rst_async_flag) begin
         if(RSTD) begin
            qd_o_reg1 <= 18'b0;
         end // if RSTD
         else if(CED) begin
            qd_o_reg1 <= D;
         end // CED 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge CLK) begin
      if(!rst_async_flag) begin
         if(RSTD) begin
            qd_o_reg1 <= 18'b0;
         end // if RSTD
         else if(CED) begin
            qd_o_reg1 <= D;
         end // CED 
      end // if rst_async_flg
    end // always

    always @(D or qd_o_reg1) begin
	case (DREG)
                  0 : qd_o_mux <= D;
                  1 : qd_o_mux <= qd_o_reg1;
	endcase
    end


//---------------------------------------------------- 
//*** 18x18 Multiplier
//---------------------------------------------------- 
    assign mult_o = {{MAX_MULT_A{qa_o_mux[MSB_MULT_A]}}, qa_o_mux} * {{MAX_MULT_B{qb_o_mux[MSB_MULT_B]}}, qb_o_mux};

// Asynchronous Operation
    always @(posedge CLK, posedge RSTM) begin
      if(rst_async_flag) begin
         if(RSTM) begin
            qmult_o_reg1 <= 36'b0;
         end // if RSTM
         else if(CEM) begin
            qmult_o_reg1 <= mult_o;
         end // CEM 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge CLK) begin
      if(!rst_async_flag) begin
         if(RSTM) begin
            qmult_o_reg1 <= 36'b0;
         end // if RSTM
         else if(CEM) begin
            qmult_o_reg1 <= mult_o;
         end // CEM 
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

    always @(qp_o_mux or qc_o_mux or PCIN or qopmode_o_mux) begin
	case (qopmode_o_mux[3:2])
             3'b00 : qz_o_mux <= 48'b0;
             3'b01 : qz_o_mux <= PCIN;
             3'b10 : qz_o_mux <= qp_o_mux;
             3'b11 : qz_o_mux <= qc_o_mux;
            default : begin
	              end
	endcase
    end


//---------------------------------------------------- 
//*** CarryIn 1 level of register
//---------------------------------------------------- 
    always @(qopmode_o_mux[5], CARRYIN) begin
	case (CARRYINSEL)
                  "CARRYIN" : carryinsel_o_mux <= CARRYIN;
                  "OPMODE5" : carryinsel_o_mux <= qopmode_o_mux[5];
	endcase
    end

// Asynchronous Operation
    always @(posedge CLK, posedge RSTCARRYIN) begin
      if(rst_async_flag) begin
         if(RSTCARRYIN) begin
            qcarryin_o_reg1  <= 1'b0;
            qcarryout_o_reg1 <= 1'b0;
         end // if RSTCARRYIN
         else if(CECARRYIN) begin
            qcarryin_o_reg1  <= carryinsel_o_mux;
            qcarryout_o_reg1 <= carryout_o;
         end // CECARRYIN 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge CLK) begin
	if (RSTCARRYIN) begin
            qcarryin_o_reg1  <= 1'b0;
            qcarryout_o_reg1 <= 1'b0;
	end  
	else if (CECARRYIN) begin
            qcarryin_o_reg1  <= carryinsel_o_mux;
            qcarryout_o_reg1 <= carryout_o;
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
    always @(posedge CLK, posedge RSTOPMODE) begin
      if(rst_async_flag) begin
         if(RSTOPMODE) begin
            qopmode_o_reg1 <= 8'b0;
         end // if RSTOPMODE
         else if(CEOPMODE) begin
            qopmode_o_reg1 <= OPMODE;
         end // CEOPMODE 
      end // if rst_async_flg
    end // always

// Synchronous Operation
    always @(posedge CLK) begin
	if (RSTOPMODE) begin
            qopmode_o_reg1 <= 8'b0;
	end  
	else if (CEOPMODE) begin
            qopmode_o_reg1 <= OPMODE;
	end
    end


    always @(OPMODE or qopmode_o_reg1) begin
	case (OPMODEREG)
                  0 : qopmode_o_mux <= OPMODE;
                  1 : qopmode_o_mux <= qopmode_o_reg1;
	endcase
    end



//---------------------------------------------------- 
//*** CarryOut/CarryOutF 1 level of register
//---------------------------------------------------- 

    always @(carryout_o or qcarryout_o_reg1) begin
	case (CARRYOUTREG)
                  0 : qcarryout_o_mux <= carryout_o;
                  1 : qcarryout_o_mux <= qcarryout_o_reg1;
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
    always @(posedge CLK, posedge RSTP) begin
      if(rst_async_flag) begin
         if(RSTP) begin
            qp_o_reg1 <= 48'b0;
         end // if RSTP
         else if(CEP) begin
            qp_o_reg1 <= add_o;
         end // CEP 
      end // if rst_async_flg
    end

// Synchronous Operation
    always @(posedge CLK) begin
	if (RSTP)
            qp_o_reg1 <= 48'b0;
	else if (CEP)
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
assign carryout_x_o = qcarryout_o_mux;



    assign BCOUT     = qb_o_mux;
    assign CARRYOUT  = carryout_x_o;
    assign CARRYOUTF = carryout_x_o;
    assign M         = qmult_o_mux;
    assign P         = qp_o_mux;
    assign PCOUT     = qp_o_mux;

endmodule // DSP48A1

