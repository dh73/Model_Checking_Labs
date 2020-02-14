// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/MCB.v,v 1.4 2010/02/23 23:33:22 vandanad Exp $
///////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995/2009 Xilinx, Inc.
// All Right Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor : Xilinx
// \   \   \/     Version : 11.1i (L.11)
//  \   \         Description : Xilinx Formal Library Component
//  /   /
// /___/   /\     Filename : MCB.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision
///////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module MCB (
  ADDR,
  BA,
  CAS,
  CKE,
  DQIOWEN0,
  DQON,
  DQOP,
  DQSIOWEN90N,
  DQSIOWEN90P,
  IOIDRPADD,
  IOIDRPADDR,
  IOIDRPBROADCAST,
  IOIDRPCLK,
  IOIDRPCS,
  IOIDRPSDO,
  IOIDRPTRAIN,
  IOIDRPUPDATE,
  LDMN,
  LDMP,
  ODT,
  P0CMDEMPTY,
  P0CMDFULL,
  P0RDCOUNT,
  P0RDDATA,
  P0RDEMPTY,
  P0RDERROR,
  P0RDFULL,
  P0RDOVERFLOW,
  P0WRCOUNT,
  P0WREMPTY,
  P0WRERROR,
  P0WRFULL,
  P0WRUNDERRUN,
  P1CMDEMPTY,
  P1CMDFULL,
  P1RDCOUNT,
  P1RDDATA,
  P1RDEMPTY,
  P1RDERROR,
  P1RDFULL,
  P1RDOVERFLOW,
  P1WRCOUNT,
  P1WREMPTY,
  P1WRERROR,
  P1WRFULL,
  P1WRUNDERRUN,
  P2CMDEMPTY,
  P2CMDFULL,
  P2COUNT,
  P2EMPTY,
  P2ERROR,
  P2FULL,
  P2RDDATA,
  P2RDOVERFLOW,
  P2WRUNDERRUN,
  P3CMDEMPTY,
  P3CMDFULL,
  P3COUNT,
  P3EMPTY,
  P3ERROR,
  P3FULL,
  P3RDDATA,
  P3RDOVERFLOW,
  P3WRUNDERRUN,
  P4CMDEMPTY,
  P4CMDFULL,
  P4COUNT,
  P4EMPTY,
  P4ERROR,
  P4FULL,
  P4RDDATA,
  P4RDOVERFLOW,
  P4WRUNDERRUN,
  P5CMDEMPTY,
  P5CMDFULL,
  P5COUNT,
  P5EMPTY,
  P5ERROR,
  P5FULL,
  P5RDDATA,
  P5RDOVERFLOW,
  P5WRUNDERRUN,
  RAS,
  RST,
  SELFREFRESHMODE,
  STATUS,
  UDMN,
  UDMP,
  UOCALSTART,
  UOCMDREADYIN,
  UODATA,
  UODATAVALID,
  UODONECAL,
  UOREFRSHFLAG,
  UOSDO,
  WE,
  DQI,
  DQSIOIN,
  DQSIOIP,
  IOIDRPSDI,
  P0ARBEN,
  P0CMDBA,
  P0CMDBL,
  P0CMDCA,
  P0CMDCLK,
  P0CMDEN,
  P0CMDINSTR,
  P0CMDRA,
  P0RDCLK,
  P0RDEN,
  P0RWRMASK,
  P0WRCLK,
  P0WRDATA,
  P0WREN,
  P1ARBEN,
  P1CMDBA,
  P1CMDBL,
  P1CMDCA,
  P1CMDCLK,
  P1CMDEN,
  P1CMDINSTR,
  P1CMDRA,
  P1RDCLK,
  P1RDEN,
  P1RWRMASK,
  P1WRCLK,
  P1WRDATA,
  P1WREN,
  P2ARBEN,
  P2CLK,
  P2CMDBA,
  P2CMDBL,
  P2CMDCA,
  P2CMDCLK,
  P2CMDEN,
  P2CMDINSTR,
  P2CMDRA,
  P2EN,
  P2WRDATA,
  P2WRMASK,
  P3ARBEN,
  P3CLK,
  P3CMDBA,
  P3CMDBL,
  P3CMDCA,
  P3CMDCLK,
  P3CMDEN,
  P3CMDINSTR,
  P3CMDRA,
  P3EN,
  P3WRDATA,
  P3WRMASK,
  P4ARBEN,
  P4CLK,
  P4CMDBA,
  P4CMDBL,
  P4CMDCA,
  P4CMDCLK,
  P4CMDEN,
  P4CMDINSTR,
  P4CMDRA,
  P4EN,
  P4WRDATA,
  P4WRMASK,
  P5ARBEN,
  P5CLK,
  P5CMDBA,
  P5CMDBL,
  P5CMDCA,
  P5CMDCLK,
  P5CMDEN,
  P5CMDINSTR,
  P5CMDRA,
  P5EN,
  P5WRDATA,
  P5WRMASK,
  PLLCE,
  PLLCLK,
  PLLLOCK,
  RECAL,
  SELFREFRESHENTER,
  SYSRST,
  UDQSIOIN,
  UDQSIOIP,
  UIADD,
  UIADDR,
  UIBROADCAST,
  UICLK,
  UICMD,
  UICMDEN,
  UICMDIN,
  UICS,
  UIDONECAL,
  UIDQCOUNT,
  UIDQLOWERDEC,
  UIDQLOWERINC,
  UIDQUPPERDEC,
  UIDQUPPERINC,
  UIDRPUPDATE,
  UILDQSDEC,
  UILDQSINC,
  UIREAD,
  UISDI,
  UIUDQSDEC,
  UIUDQSINC
);

  parameter integer ARB_NUM_TIME_SLOTS = 12;
  parameter [17:0] ARB_TIME_SLOT_0 = 18'b111111111111111111;
  parameter [17:0] ARB_TIME_SLOT_1 = 18'b111111111111111111;
  parameter [17:0] ARB_TIME_SLOT_10 = 18'b111111111111111111;
  parameter [17:0] ARB_TIME_SLOT_11 = 18'b111111111111111111;
  parameter [17:0] ARB_TIME_SLOT_2 = 18'b111111111111111111;
  parameter [17:0] ARB_TIME_SLOT_3 = 18'b111111111111111111;
  parameter [17:0] ARB_TIME_SLOT_4 = 18'b111111111111111111;
  parameter [17:0] ARB_TIME_SLOT_5 = 18'b111111111111111111;
  parameter [17:0] ARB_TIME_SLOT_6 = 18'b111111111111111111;
  parameter [17:0] ARB_TIME_SLOT_7 = 18'b111111111111111111;
  parameter [17:0] ARB_TIME_SLOT_8 = 18'b111111111111111111;
  parameter [17:0] ARB_TIME_SLOT_9 = 18'b111111111111111111;
  parameter [2:0] CAL_BA = 3'h0;
  parameter CAL_BYPASS = "YES";
  parameter [11:0] CAL_CA = 12'h000;
  parameter CAL_CALIBRATION_MODE = "NOCALIBRATION";
  parameter integer CAL_CLK_DIV = 1;
  parameter CAL_DELAY = "QUARTER";
  parameter [14:0] CAL_RA = 15'h0000;
  parameter MEM_ADDR_ORDER = "BANK_ROW_COLUMN";
  parameter integer MEM_BA_SIZE = 3;
  parameter integer MEM_BURST_LEN = 8;
  parameter integer MEM_CAS_LATENCY = 4;
  parameter integer MEM_CA_SIZE = 11;
  parameter MEM_DDR1_2_ODS = "FULL";
  parameter MEM_DDR2_3_HIGH_TEMP_SR = "NORMAL";
  parameter MEM_DDR2_3_PA_SR = "FULL";
  parameter integer MEM_DDR2_ADD_LATENCY = 0;
  parameter MEM_DDR2_DIFF_DQS_EN = "YES";
  parameter MEM_DDR2_RTT = "50OHMS";
  parameter integer MEM_DDR2_WRT_RECOVERY = 4;
  parameter MEM_DDR3_ADD_LATENCY = "OFF";
  parameter MEM_DDR3_AUTO_SR = "ENABLED";
  parameter integer MEM_DDR3_CAS_LATENCY = 7;
  parameter integer MEM_DDR3_CAS_WR_LATENCY = 5;
  parameter MEM_DDR3_DYN_WRT_ODT = "OFF";
  parameter MEM_DDR3_ODS = "DIV7";
  parameter MEM_DDR3_RTT = "DIV2";
  parameter integer MEM_DDR3_WRT_RECOVERY = 7;
  parameter MEM_MDDR_ODS = "FULL";
  parameter MEM_MOBILE_PA_SR = "FULL";
  parameter integer MEM_MOBILE_TC_SR = 0;
  parameter integer MEM_RAS_VAL = 0;
  parameter integer MEM_RA_SIZE = 13;
  parameter integer MEM_RCD_VAL = 1;
  parameter integer MEM_REFI_VAL = 0;
  parameter integer MEM_RFC_VAL = 0;
  parameter integer MEM_RP_VAL = 0;
  parameter integer MEM_RTP_VAL = 0;
  parameter MEM_TYPE = "DDR3";
  parameter integer MEM_WIDTH = 4;
  parameter integer MEM_WR_VAL = 0;
  parameter integer MEM_WTR_VAL = 3;
  parameter PORT_CONFIG = "B32_B32_B32_B32";

  output CAS;
  output CKE;
  output DQIOWEN0;
  output DQSIOWEN90N;
  output DQSIOWEN90P;
  output IOIDRPADD;
  output IOIDRPBROADCAST;
  output IOIDRPCLK;
  output IOIDRPCS;
  output IOIDRPSDO;
  output IOIDRPTRAIN;
  output IOIDRPUPDATE;
  output LDMN;
  output LDMP;
  output ODT;
  output P0CMDEMPTY;
  output P0CMDFULL;
  output P0RDEMPTY;
  output P0RDERROR;
  output P0RDFULL;
  output P0RDOVERFLOW;
  output P0WREMPTY;
  output P0WRERROR;
  output P0WRFULL;
  output P0WRUNDERRUN;
  output P1CMDEMPTY;
  output P1CMDFULL;
  output P1RDEMPTY;
  output P1RDERROR;
  output P1RDFULL;
  output P1RDOVERFLOW;
  output P1WREMPTY;
  output P1WRERROR;
  output P1WRFULL;
  output P1WRUNDERRUN;
  output P2CMDEMPTY;
  output P2CMDFULL;
  output P2EMPTY;
  output P2ERROR;
  output P2FULL;
  output P2RDOVERFLOW;
  output P2WRUNDERRUN;
  output P3CMDEMPTY;
  output P3CMDFULL;
  output P3EMPTY;
  output P3ERROR;
  output P3FULL;
  output P3RDOVERFLOW;
  output P3WRUNDERRUN;
  output P4CMDEMPTY;
  output P4CMDFULL;
  output P4EMPTY;
  output P4ERROR;
  output P4FULL;
  output P4RDOVERFLOW;
  output P4WRUNDERRUN;
  output P5CMDEMPTY;
  output P5CMDFULL;
  output P5EMPTY;
  output P5ERROR;
  output P5FULL;
  output P5RDOVERFLOW;
  output P5WRUNDERRUN;
  output RAS;
  output RST;
  output SELFREFRESHMODE;
  output UDMN;
  output UDMP;
  output UOCALSTART;
  output UOCMDREADYIN;
  output UODATAVALID;
  output UODONECAL;
  output UOREFRSHFLAG;
  output UOSDO;
  output WE;
  output [14:0] ADDR;
  output [15:0] DQON;
  output [15:0] DQOP;
  output [2:0] BA;
  output [31:0] P0RDDATA;
  output [31:0] P1RDDATA;
  output [31:0] P2RDDATA;
  output [31:0] P3RDDATA;
  output [31:0] P4RDDATA;
  output [31:0] P5RDDATA;
  output [31:0] STATUS;
  output [4:0] IOIDRPADDR;
  output [6:0] P0RDCOUNT;
  output [6:0] P0WRCOUNT;
  output [6:0] P1RDCOUNT;
  output [6:0] P1WRCOUNT;
  output [6:0] P2COUNT;
  output [6:0] P3COUNT;
  output [6:0] P4COUNT;
  output [6:0] P5COUNT;
  output [7:0] UODATA;

  input DQSIOIN;
  input DQSIOIP;
  input IOIDRPSDI;
  input P0ARBEN;
  input P0CMDCLK;
  input P0CMDEN;
  input P0RDCLK;
  input P0RDEN;
  input P0WRCLK;
  input P0WREN;
  input P1ARBEN;
  input P1CMDCLK;
  input P1CMDEN;
  input P1RDCLK;
  input P1RDEN;
  input P1WRCLK;
  input P1WREN;
  input P2ARBEN;
  input P2CLK;
  input P2CMDCLK;
  input P2CMDEN;
  input P2EN;
  input P3ARBEN;
  input P3CLK;
  input P3CMDCLK;
  input P3CMDEN;
  input P3EN;
  input P4ARBEN;
  input P4CLK;
  input P4CMDCLK;
  input P4CMDEN;
  input P4EN;
  input P5ARBEN;
  input P5CLK;
  input P5CMDCLK;
  input P5CMDEN;
  input P5EN;
  input PLLLOCK;
  input RECAL;
  input SELFREFRESHENTER;
  input SYSRST;
  input UDQSIOIN;
  input UDQSIOIP;
  input UIADD;
  input UIBROADCAST;
  input UICLK;
  input UICMD;
  input UICMDEN;
  input UICMDIN;
  input UICS;
  input UIDONECAL;
  input UIDQLOWERDEC;
  input UIDQLOWERINC;
  input UIDQUPPERDEC;
  input UIDQUPPERINC;
  input UIDRPUPDATE;
  input UILDQSDEC;
  input UILDQSINC;
  input UIREAD;
  input UISDI;
  input UIUDQSDEC;
  input UIUDQSINC;
  input [11:0] P0CMDCA;
  input [11:0] P1CMDCA;
  input [11:0] P2CMDCA;
  input [11:0] P3CMDCA;
  input [11:0] P4CMDCA;
  input [11:0] P5CMDCA;
  input [14:0] P0CMDRA;
  input [14:0] P1CMDRA;
  input [14:0] P2CMDRA;
  input [14:0] P3CMDRA;
  input [14:0] P4CMDRA;
  input [14:0] P5CMDRA;
  input [15:0] DQI;
  input [1:0] PLLCE;
  input [1:0] PLLCLK;
  input [2:0] P0CMDBA;
  input [2:0] P0CMDINSTR;
  input [2:0] P1CMDBA;
  input [2:0] P1CMDINSTR;
  input [2:0] P2CMDBA;
  input [2:0] P2CMDINSTR;
  input [2:0] P3CMDBA;
  input [2:0] P3CMDINSTR;
  input [2:0] P4CMDBA;
  input [2:0] P4CMDINSTR;
  input [2:0] P5CMDBA;
  input [2:0] P5CMDINSTR;
  input [31:0] P0WRDATA;
  input [31:0] P1WRDATA;
  input [31:0] P2WRDATA;
  input [31:0] P3WRDATA;
  input [31:0] P4WRDATA;
  input [31:0] P5WRDATA;
  input [3:0] P0RWRMASK;
  input [3:0] P1RWRMASK;
  input [3:0] P2WRMASK;
  input [3:0] P3WRMASK;
  input [3:0] P4WRMASK;
  input [3:0] P5WRMASK;
  input [3:0] UIDQCOUNT;
  input [4:0] UIADDR;
  input [5:0] P0CMDBL;
  input [5:0] P1CMDBL;
  input [5:0] P2CMDBL;
  input [5:0] P3CMDBL;
  input [5:0] P4CMDBL;
  input [5:0] P5CMDBL;

endmodule
