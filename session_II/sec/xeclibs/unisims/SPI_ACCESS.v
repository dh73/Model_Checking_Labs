///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2004 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 10.1
//  \   \         Description : Xilinx Formal Library Component
//  /   /                  Internal logic access to the Serial Peripheral Interface (SPI) PROM data
// /___/   /\     Filename : SPI_ACCESS.v
// \   \  /  \    Timestamp : Tue Nov 12 14:49:22 PDT 20067
//  \___\/\___\
//
//                WARNING!!!  -- "This behavioral model is for Xilinx test purpose only.
//                Simulation of this model is not currently supported by Xilinx."
//
// Revision:
//    11/12/07 - Initial version.
// End Revision

`timescale  1 ps / 1 ps

module SPI_ACCESS (MISO, CLK, CSB, MOSI);

parameter SIM_DELAY_TYPE = "SCALED"; // ACCURATE means enforce spec timing delays
                                     // SCALED means shorted delays for faster sim
parameter SIM_DEVICE = "3S1400AN";
parameter SIM_FACTORY_ID = 512'h00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;  // Security Register Bytes[64:127]
parameter SIM_MEM_FILE = "NONE"; // Memory pre-load
parameter SIM_USER_ID =    512'hFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF; // Security Register Bytes[0:63]


    output MISO;

    input CLK, CSB, MOSI;
    


endmodule // SPI_ACCESS

