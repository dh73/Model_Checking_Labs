// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/RAM64M.v,v 1.2 2008/05/05 22:10:46 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2006 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 8.2i
//  \   \         Description : Xilinx Function Simulation Library Component
//  /   /                 64-Deep by 4-bit Wide Multi Port RAM 
// /___/   /\     Filename : RAM64M.v
// \   \  /  \    Timestamp : Wed Jun  7 16:13:41 PDT 2006
//  \___\/\___\
//
// Revision:
//    06/07/06 - Initial version.
// End Revision

`timescale 1 ps/1 ps

module RAM64M (DOA, DOB, DOC, DOD, ADDRA, ADDRB, ADDRC, ADDRD, DIA, DIB, DIC, DID, WCLK, WE);

  parameter  INIT_A = 64'h0000000000000000;
  parameter  INIT_B = 64'h0000000000000000;
  parameter  INIT_C = 64'h0000000000000000;
  parameter  INIT_D = 64'h0000000000000000;
  output  DOA;
  output  DOB;
  output  DOC;
  output  DOD;
  input [5:0] ADDRA;
  input [5:0] ADDRB;
  input [5:0] ADDRC;
  input [5:0] ADDRD;
  input  DIA;
  input  DIB;
  input  DIC;
  input  DID;
  input WCLK;
  input WE;
  
  reg [63:0] mem_a, mem_b, mem_c, mem_d;
  reg notifier;

  initial begin
    mem_a = INIT_A;
    mem_b = INIT_B;
    mem_c = INIT_C;
    mem_d = INIT_D;
  end

  always @(posedge WCLK)
    if (WE) begin
      mem_a[ADDRD] <= #100 DIA;
      mem_b[ADDRD] <= #100 DIB;
      mem_c[ADDRD] <= #100 DIC;
      mem_d[ADDRD] <= #100 DID;
  end

   assign  DOA = mem_a[ADDRA];
   assign  DOB = mem_b[ADDRB];
   assign  DOC = mem_c[ADDRC];
   assign  DOD = mem_d[ADDRD];

endmodule
