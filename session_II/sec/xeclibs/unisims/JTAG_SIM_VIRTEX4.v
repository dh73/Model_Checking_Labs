// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/JTAG_SIM_VIRTEX4.v,v 1.1 2005/05/10 01:20:06 wloo Exp $
`celldefine
`timescale 1 ps/1 ps

module JTAG_SIM_VIRTEX4 ( TDO, TCK, TDI, TMS );

  output TDO;

  input TCK, TDI, TMS;
   
  parameter PART_NAME = "LX15";
   
endmodule // JTAG_SIM_VIRTEX4
