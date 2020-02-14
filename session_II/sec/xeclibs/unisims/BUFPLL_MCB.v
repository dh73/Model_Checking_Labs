///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2007 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Simulation Library Component
//  /   /                  Double Phase Locked Loop buffers for Spartan Series
// /___/   /\     Filename : BUFPLL_MCB.v
// \   \  /  \    Timestamp : Mon Jun  9 13:50:25 PDT 2008
//  \___\/\___\
//
// Revision:
//    08/12/08 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module BUFPLL_MCB (
  IOCLK0,
  IOCLK1,
  LOCK,
  SERDESSTROBE0,
  SERDESSTROBE1,

  GCLK,
  LOCKED,
  PLLIN0,
  PLLIN1
);



    parameter integer DIVIDE = 2;        // {1..8}
    parameter LOCK_SRC = "LOCK_TO_0";


    output IOCLK0;
    output IOCLK1;
    output LOCK;
    output SERDESSTROBE0;
    output SERDESSTROBE1;

    input GCLK;
    input LOCKED;
    input PLLIN0;
    input PLLIN1;


// Output signals 
    reg  ioclk0_out = 0, ioclk1_out = 0, lock_out = 0, serdesstrobe0_out = 0, serdesstrobe1_out = 0;

// Counters and Flags
    reg [2:0] ce_count = 0;
    reg [2:0] edge_count = 0;
    reg [2:0] RisingEdgeCount = 0;
    reg [2:0] FallingEdgeCount = 0;
    reg TriggerOnRise = 0;
    reg divclk_int;

    reg allEqual, RisingEdgeMatch, FallingEdgeMatch,  match, nmatch;

// Attribute settings

// Other signals
    reg attr_err_flag = 0;

    localparam lock_src_0_attr = (LOCK_SRC ==  "LOCK_TO_0" ) ? 1'b1 : 1'b0;
    localparam lock_src_1_attr = (LOCK_SRC ==  "LOCK_TO_1" ) ? 1'b1 : 1'b0;


// =====================
// Count the rising edges of the clk
// =====================
    generate if (LOCK_SRC == "LOCK_TO_0") 
       begin 
          always @(posedge PLLIN0) 
             if(allEqual) 
                 edge_count <= 3'b000;
              else
                 edge_count <= edge_count + 1; 
       end 
    else 
       begin 
          always @(posedge PLLIN1)
             if(allEqual) 
                 edge_count <= 3'b000;
              else
                 edge_count <= edge_count + 1; 
       end 
    endgenerate
          
//  Generate synchronous reset after DIVIDE number of counts
    always @(edge_count) 
        if (edge_count == ce_count) 
           allEqual = 1;
        else
          allEqual = 0;

// =====================
// Generate SERDESSTROBE 
// =====================
    generate if(LOCK_SRC == "LOCK_TO_0") 
     begin 
       always @(posedge PLLIN0)
           serdesstrobe0_out <= allEqual;
       always @(posedge PLLIN1)
           serdesstrobe1_out <= serdesstrobe0_out;
     end
    else 
     begin 
       always @(posedge PLLIN1)
           serdesstrobe1_out <= allEqual;
       always @(posedge PLLIN0)
           serdesstrobe0_out <= serdesstrobe1_out;
     end
    endgenerate
 
// =====================
// Generate divided clk 
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

    generate if(LOCK_SRC == "LOCK_TO_0") 
       begin 
          always @(posedge PLLIN0)
             match <= RisingEdgeMatch | (match & ~FallingEdgeMatch);

          always @(negedge PLLIN0)
             if(~TriggerOnRise) 
                  nmatch <= match; 
               else 
                  nmatch <= 0;   
       end 
    else 
       begin 
          always @(posedge PLLIN1)
             match <= RisingEdgeMatch | (match & ~FallingEdgeMatch);

          always @(negedge PLLIN1)
             if(~TriggerOnRise) 
                  nmatch <= match; 
               else 
                  nmatch <= 0;   
       end 
    endgenerate

    always@(match or nmatch) divclk_int = match | nmatch;
// =====================
// Generate IOCLKs 
// =====================

    always @(PLLIN0)
         ioclk0_out = PLLIN0;

    always @(PLLIN1)
         ioclk1_out = PLLIN1;

// =====================
// Generate LOCK
// =====================
    always @(LOCKED)
         lock_out <= LOCKED;


    assign IOCLK0 = ioclk0_out;
    assign IOCLK1 = ioclk1_out;
    assign LOCK   = lock_out;
    assign SERDESSTROBE0 = serdesstrobe0_out;
    assign SERDESSTROBE1 = serdesstrobe1_out;

endmodule // BUFPLL_MCB

