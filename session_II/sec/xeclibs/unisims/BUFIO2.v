///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2007 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  I/O Clock Buffer/Divider for the Spartan Series
// /___/   /\     Filename : BUFIO2.v
// \   \  /  \    Timestamp : Tue Feb 12 16:34:29 PST 2008
//  \___\/\___\
//
// Revision:
//    02/12/08 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module BUFIO2 (DIVCLK, IOCLK, SERDESSTROBE, I);



  parameter DIVIDE_BYPASS = "TRUE";    // TRUE, FALSE
  parameter integer DIVIDE = 1;        // {1..8}
  parameter I_INVERT = "FALSE";        // TRUE, FALSE
  parameter USE_DOUBLER = "FALSE";     // TRUE, FALSE


    output DIVCLK; 
    output IOCLK; 
    output SERDESSTROBE; 

    input I; 

// Output signals 
    reg  divclk_out=0, ioclk_out=0, serdesstrobe_out=0;

// Counters and Flags
    reg [2:0] ce_count = 0;
    reg [2:0] edge_count = 0;
    reg [2:0] RisingEdgeCount = 0;
    reg [2:0] FallingEdgeCount = 0;
    reg TriggerOnRise = 0; // FP

    reg allEqual=0, RisingEdgeMatch=0, FallingEdgeMatch=0,  match=0, nmatch=0;

    reg divclk_int=0;

    reg I_int;
    reg i1_int,  i2_int;
    wire doubled_clk_int;

    wire div1_clk; 

// Attribute settings

// Other signals
    reg attr_err_flag = 0;
    


// Optional inverter for I 
    generate
      case (I_INVERT)
         "FALSE" : always @(I)  I_int <= I;
         "TRUE"  : always @(I)  I_int <= ~I;
      endcase
    endgenerate

     localparam divclk_bypass_attr = (DIVIDE_BYPASS == "TRUE") ? 1'b1 : 1'b0;
     localparam Ivert_attr = (I_INVERT == "TRUE") ? 1'b1 : 1'b0;
     localparam use_doubler_attr = (USE_DOUBLER == "TRUE") ? 1'b1 : 1'b0;


    generate if  (USE_DOUBLER == "TRUE")
       begin
      // =====================
      // clock doubler
      // =====================
          always @(posedge I_int) begin
              i1_int = 1;
              #100 i1_int = 0;
          end

          always @(negedge I_int) begin
              i2_int = 1;
              #100  i2_int = 0;
          end

          assign doubled_clk_int = i1_int | i2_int;
       end
     else 
       assign doubled_clk_int = I_int; 
     endgenerate

// CR 561858  -- for various DIVIDE widths, the count is set differently to match the BUFIO2_2CLK's CR 512001  
// =====================
// Count the rising edges of the clk
// =====================
//    always @(posedge doubled_clk_int) begin
//       if(allEqual || $time < 1) 
//           edge_count <= 3'b000;
//        else
//           edge_count <= edge_count + 1; 
//    end 
   generate
      case(DIVIDE)
         2,4,6,8 : begin

                    always @(posedge doubled_clk_int) begin
                       if($time < 1 )
                            edge_count <= DIVIDE-1;   //001  for 5 and 7
                       else if (allEqual)
                            edge_count <= 3'b000;
                       else
                            edge_count <= edge_count + 1;
                    end
         end
         3,5,7 : begin
               //for 1, 3, 5 and 7 below

                    always @(posedge doubled_clk_int) begin
                       if($time < 1 )
                            edge_count <= 3'b001;   //001  for 5 and 7
                       else if (allEqual)
                            edge_count <= 3'b000;
                       else
                            edge_count <= edge_count + 1;
                    end
        end
      endcase
    endgenerate

//  Generate synchronous reset after DIVIDE number of counts
    always @(edge_count) 
        if (edge_count == ce_count) 
           allEqual = 1;
        else
          allEqual = 0;

// =====================
// Generate IOCE
// =====================
    always @(posedge doubled_clk_int)
        serdesstrobe_out <= allEqual;
 
// =====================
// Generate IOCLK
// =====================
    always @(I_int)
        ioclk_out <= I_int;
 
// =====================
// Generate Divided Clock
// =====================
    always @(edge_count)
       if (edge_count == RisingEdgeCount)
           RisingEdgeMatch = 1;
       else
           RisingEdgeMatch = 0;

    always @(edge_count)
       if (edge_count == FallingEdgeCount)
           FallingEdgeMatch = 1;
       else
           FallingEdgeMatch = 0;

    always @(posedge doubled_clk_int)
          match <= RisingEdgeMatch | (match & ~FallingEdgeMatch);

    always @(negedge doubled_clk_int)
         if(~TriggerOnRise) 
            nmatch <= match; 
         else 
            nmatch <= 0;   

    always@(match or nmatch) divclk_int = match | nmatch;

    always @(divclk_int or I_int)
         divclk_out = (divclk_bypass_attr | (DIVIDE == 1))? I_int : divclk_int;



    assign DIVCLK  = divclk_out;
    assign IOCLK   = ioclk_out;
    assign SERDESSTROBE = serdesstrobe_out;

endmodule // BUFIO2

