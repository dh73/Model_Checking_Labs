///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2010 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx TEST ONLY Library Component
//  /   /                  Delay Element.
// /___/   /\     Filename : ZHOLD_DELAY.v
// \   \  /  \    Timestamp : Wed Apr 14 15:49:29 PDT 2010
//  \___\/\___\
//
// Revision:
//    04/14/10 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module ZHOLD_DELAY (
          DLYFABRIC,
          DLYIFF,
          DLYIN
       );

       parameter ZHOLD_FABRIC = "DEFAULT"; // {"DEFAULT", "0", .... "31"}
       parameter ZHOLD_IFF    = "DEFAULT"; // {"DEFAULT", "0", .... "31"}

       output DLYFABRIC;
       output DLYIFF;

       input  DLYIN;

endmodule // ZHOLD_DELAY
