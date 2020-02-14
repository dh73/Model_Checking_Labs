// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/MULT18X18SIO.v,v 1.3 2008/10/02 19:04:12 vandanad Exp $

`timescale  1 ps / 1 ps

module MULT18X18SIO (BCOUT, P, A, B, BCIN, CEA, CEB, CEP, CLK, RSTA, RSTB, RSTP); 

    output [17:0] BCOUT; 
    output [35:0] P; 

    input [17:0] A;
    input [17:0] B;
    input [17:0] BCIN;
    input CEA;
    input CEB;
    input CEP;
    input CLK;
    input RSTA;
    input RSTB;
    input RSTP;

    parameter integer AREG = 1;
    parameter integer BREG = 1;
    parameter B_INPUT = "DIRECT";
    parameter integer PREG = 1;

    reg [17:0] b_o_mux, qb_o_mux, qb_o_reg1;
    reg [17:0] qa_o_mux, qa_o_reg1;
    reg [35:0] qp_o_mux, qp_o_reg1;

    wire [17:0] bcin_in, a_in, b_in;
    wire [35:0] mult_o;

    wire cep_in;
    wire cea_in;
    wire ceb_in;
    wire clk_in;
    wire gsr_in;
    wire rstp_in;
    wire rsta_in;
    wire rstb_in;

    buf b_p_o[35:0] (P, qp_o_mux);
    buf b_bcout[17:0] (BCOUT, qb_o_mux);

    buf b_bcin[17:0] (bcin_in, BCIN);
    buf b_a[17:0] (a_in, A);
    buf b_b[17:0] (b_in, B);
    
    buf b_cep (cep_in, CEP);
    buf b_cea (cea_in, CEA);
    buf b_ceb (ceb_in, CEB);
    buf b_clk (clk_in, CLK);
//    buf b_gsr (gsr_in, GSR);
    buf b_rstp (rstp_in, RSTP);
    buf b_rsta (rsta_in, RSTA);
    buf b_rstb (rstb_in, RSTB);


//*** Input register B

    always @(bcin_in or b_in) begin

	case (B_INPUT)
	    
             "DIRECT" : b_o_mux <= b_in;
            "CASCADE" : b_o_mux <= bcin_in;
              default : begin

	       	            $display("Attribute Syntax Error : The attribute B_INPUT on MULT18X18SIO instance %m is set to %s.  Legal values for this attribute are DIRECT or CASCADE.", B_INPUT);
		            $finish;

                        end

	endcase
    end

    always @(posedge clk_in) begin

	if (rstb_in)
            qb_o_reg1 <= 18'b0;

	else if (ceb_in)
            qb_o_reg1 <= b_o_mux;

    end

    always @(b_o_mux or qb_o_reg1) begin

	case (BREG)

                  0 : qb_o_mux <= b_o_mux;
                  1 : qb_o_mux <= qb_o_reg1;
            default : begin
	                  $display("Attribute Syntax Error : The attribute BREG on MULT18X18SIO instance %m is set to %d.  Legal values for this attribute are 0 or 1.", BREG);
	                  $finish;
	              end

	endcase
    end


//*** Input register A
    always @(posedge clk_in) begin

	if (rsta_in)
            qa_o_reg1 <= 18'b0;

	else if (cea_in)
            qa_o_reg1 <= a_in;

    end

    always @(a_in or qa_o_reg1) begin

	case (AREG)

                  0 : qa_o_mux <= a_in;
                  1 : qa_o_mux <= qa_o_reg1;
            default : begin
	                  $display("Attribute Syntax Error : The attribute AREG on MULT18X18SIO instance %m is set to %d.  Legal values for this attribute are 0 or 1.", AREG);
	                  $finish;
	              end
	endcase
    end


//*** 18x18 Multiplier
//    assign mult_o = qa_o_mux * qb_o_mux;
    assign mult_o = {{18{qa_o_mux[17]}}, qa_o_mux} * {{18{qb_o_mux[17]}}, qb_o_mux};

//*** Output register P
    always @(posedge clk_in) begin

	if (rstp_in)
            qp_o_reg1 <= 36'b0;

	else if (cep_in)
            qp_o_reg1 <= mult_o;

    end
 
    always @(qp_o_reg1 or mult_o) begin

	case (PREG)

                  0 : qp_o_mux <= mult_o;
                  1 : qp_o_mux <= qp_o_reg1;
            default : begin
	                  $display("Attribute Syntax Error : The attribute PREG on MULT18X18SIO instance %m is set to %d.  Legal values for this attribute are 0 or 1.", PREG);
	                  $finish;
	              end

	endcase
    end

endmodule // MULT18X18SIO
