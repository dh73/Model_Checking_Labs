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
// /___/   /\     Filename : BUFIO2_2CLK.v
// \   \  /  \    Timestamp : Tue Feb 12 16:34:29 PST 2008
//  \___\/\___\
//
// Revision:
//    02/12/08 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module BUFIO2_2CLK (DIVCLK, IOCLK, SERDESSTROBE, I, IB);



  parameter integer DIVIDE = 2;        // {2..8}


    output DIVCLK; 
    output IOCLK; 
    output SERDESSTROBE; 

    input I; 
    input IB; 

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
    reg i1_int=0, i2_int=0;

// Attribute settings

// Other signals
    reg attr_err_flag = 0;

//-----------------------------------------------------------------------------------

// =====================
// clock doubler
// =====================
    always @(posedge I) begin
        i1_int = 1;
        #100 i1_int = 0;
    end

    always @(posedge IB) begin
        i2_int = 1;
        #100  i2_int = 0;
    end

    assign doubled_clk_int = i1_int | i2_int;


// =====================
// Count the rising edges of the clk
// =====================
// CR 512001  -- for various DIVIDE widths, the count is set differently to match the hw startup      
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
    always @(I)
        ioclk_out <= I;
 
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

// IR 497760 fix
    always @(divclk_int or doubled_clk_int)
         divclk_out = (DIVIDE == 1)? ioclk_out : divclk_int;




    assign DIVCLK  = divclk_out;
    assign IOCLK   = ioclk_out;
    assign SERDESSTROBE = serdesstrobe_out;

endmodule // BUFIO2_2CLK

