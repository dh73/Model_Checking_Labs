///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2007 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Simulation Library Component
//  /   /                  Phase Locked Loop buffer for Spartan Series
// /___/   /\     Filename : BUFPLL.v
// \   \  /  \    Timestamp : Mon Jun  9 13:50:25 PDT 2008
//  \___\/\___\
//
// Revision:
//    06/09/08 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module BUFPLL (IOCLK, LOCK, SERDESSTROBE, GCLK, LOCKED, PLLIN);



    parameter integer DIVIDE = 1;        // {1..8}
    parameter ENABLE_SYNC = "TRUE";


    output IOCLK;
    output LOCK;
    output SERDESSTROBE;

    input GCLK;
    input LOCKED;
    input PLLIN;


// Output signals 
    reg  ioclk_out = 0, lock_out = 0, serdesstrobe_out = 0;

// Counters and Flags
    reg [2:0] ce_count = 0;
    reg [2:0] edge_count = 0;
    reg [2:0] RisingEdgeCount = 0;
    reg [2:0] FallingEdgeCount = 0;
    reg TriggerOnRise = 0; 
    reg divclk_int;

    reg allEqual, RisingEdgeMatch, FallingEdgeMatch,  match, nmatch;

    reg lock_src_indepn_attr = 0, lock_src_0_attr = 0, lock_src_1_attr= 0;

    reg  enable_sync_strobe_out = 0, strobe_out = 0;

// Attribute settings

// Other signals
    reg attr_err_flag = 0;

// =====================
// Count the rising edges of the clk
// =====================
    always @(posedge PLLIN) begin
       if(allEqual) 
           edge_count <= 3'b000;
        else
           edge_count <= edge_count + 1; 
     end 
          
//  Generate synchronous reset after DIVIDE number of counts
    always @(edge_count) 
        if (edge_count == ce_count) 
           allEqual = 1;
        else
          allEqual = 0;

// =======================================
// Generate SERDESSTROBE when ENABLE_SYNC 
// =======================================
     generate
      case(DIVIDE)
        1, 2, 3, 4, 5, 6, 7, 8 : begin
             always @(posedge GCLK)
             begin
                   enable_sync_strobe_out <= 1'b1;
             end
             end
      endcase
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

    always @(posedge PLLIN)
       match <= RisingEdgeMatch | (match & ~FallingEdgeMatch);

    always @(negedge PLLIN)
       if(~TriggerOnRise) 
            nmatch <= match; 
         else 
            nmatch <= 0;   

    always@(match or nmatch) divclk_int = match | nmatch;

    always @(PLLIN)
         ioclk_out <= PLLIN;

// =====================
// Generate strobe_out 
// =====================
    always @(posedge PLLIN)
         strobe_out <= allEqual;

// =========================
// Generate serdesstrobe_out
// =========================

    always @(strobe_out or enable_sync_strobe_out)
         serdesstrobe_out = (ENABLE_SYNC == "TRUE")? enable_sync_strobe_out : strobe_out;

// =====================
// Generate LOCK 
// =====================
    always @(LOCKED)
         lock_out <= LOCKED;



    assign IOCLK = ioclk_out;
    assign LOCK  = lock_out;
    assign SERDESSTROBE = serdesstrobe_out;


endmodule // BUFPLL

