// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/GTHE1_QUAD.v,v 1.4 2011/09/07 23:47:48 vandanad Exp $
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
// /___/   /\     Filename : GTHE1_QUAD.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    09/01/09 - Initial version.
// End Revision

`timescale 1 ps / 1 ps 
module GTHE1_QUAD (
  DRDY,
  DRPDO,
  GTHINITDONE,
  MGMTPCSRDACK,
  MGMTPCSRDDATA,
  RXCODEERR0,
  RXCODEERR1,
  RXCODEERR2,
  RXCODEERR3,
  RXCTRL0,
  RXCTRL1,
  RXCTRL2,
  RXCTRL3,
  RXCTRLACK0,
  RXCTRLACK1,
  RXCTRLACK2,
  RXCTRLACK3,
  RXDATA0,
  RXDATA1,
  RXDATA2,
  RXDATA3,
  RXDATATAP0,
  RXDATATAP1,
  RXDATATAP2,
  RXDATATAP3,
  RXDISPERR0,
  RXDISPERR1,
  RXDISPERR2,
  RXDISPERR3,
  RXPCSCLKSMPL0,
  RXPCSCLKSMPL1,
  RXPCSCLKSMPL2,
  RXPCSCLKSMPL3,
  RXUSERCLKOUT0,
  RXUSERCLKOUT1,
  RXUSERCLKOUT2,
  RXUSERCLKOUT3,
  RXVALID0,
  RXVALID1,
  RXVALID2,
  RXVALID3,
  TSTPATH,
  TSTREFCLKFAB,
  TSTREFCLKOUT,
  TXCTRLACK0,
  TXCTRLACK1,
  TXCTRLACK2,
  TXCTRLACK3,
  TXDATATAP10,
  TXDATATAP11,
  TXDATATAP12,
  TXDATATAP13,
  TXDATATAP20,
  TXDATATAP21,
  TXDATATAP22,
  TXDATATAP23,
  TXN0,
  TXN1,
  TXN2,
  TXN3,
  TXP0,
  TXP1,
  TXP2,
  TXP3,
  TXPCSCLKSMPL0,
  TXPCSCLKSMPL1,
  TXPCSCLKSMPL2,
  TXPCSCLKSMPL3,
  TXUSERCLKOUT0,
  TXUSERCLKOUT1,
  TXUSERCLKOUT2,
  TXUSERCLKOUT3,
  DADDR,
  DCLK,
  DEN,
  DFETRAINCTRL0,
  DFETRAINCTRL1,
  DFETRAINCTRL2,
  DFETRAINCTRL3,
  DI,
  DISABLEDRP,
  DWE,
  GTHINIT,
  GTHRESET,
  GTHX2LANE01,
  GTHX2LANE23,
  GTHX4LANE,
  MGMTPCSLANESEL,
  MGMTPCSMMDADDR,
  MGMTPCSREGADDR,
  MGMTPCSREGRD,
  MGMTPCSREGWR,
  MGMTPCSWRDATA,
  PLLPCSCLKDIV,
  PLLREFCLKSEL,
  POWERDOWN0,
  POWERDOWN1,
  POWERDOWN2,
  POWERDOWN3,
  REFCLK,
  RXBUFRESET0,
  RXBUFRESET1,
  RXBUFRESET2,
  RXBUFRESET3,
  RXENCOMMADET0,
  RXENCOMMADET1,
  RXENCOMMADET2,
  RXENCOMMADET3,
  RXN0,
  RXN1,
  RXN2,
  RXN3,
  RXP0,
  RXP1,
  RXP2,
  RXP3,
  RXPOLARITY0,
  RXPOLARITY1,
  RXPOLARITY2,
  RXPOLARITY3,
  RXPOWERDOWN0,
  RXPOWERDOWN1,
  RXPOWERDOWN2,
  RXPOWERDOWN3,
  RXRATE0,
  RXRATE1,
  RXRATE2,
  RXRATE3,
  RXSLIP0,
  RXSLIP1,
  RXSLIP2,
  RXSLIP3,
  RXUSERCLKIN0,
  RXUSERCLKIN1,
  RXUSERCLKIN2,
  RXUSERCLKIN3,
  SAMPLERATE0,
  SAMPLERATE1,
  SAMPLERATE2,
  SAMPLERATE3,
  TXBUFRESET0,
  TXBUFRESET1,
  TXBUFRESET2,
  TXBUFRESET3,
  TXCTRL0,
  TXCTRL1,
  TXCTRL2,
  TXCTRL3,
  TXDATA0,
  TXDATA1,
  TXDATA2,
  TXDATA3,
  TXDATAMSB0,
  TXDATAMSB1,
  TXDATAMSB2,
  TXDATAMSB3,
  TXDEEMPH0,
  TXDEEMPH1,
  TXDEEMPH2,
  TXDEEMPH3,
  TXMARGIN0,
  TXMARGIN1,
  TXMARGIN2,
  TXMARGIN3,
  TXPOWERDOWN0,
  TXPOWERDOWN1,
  TXPOWERDOWN2,
  TXPOWERDOWN3,
  TXRATE0,
  TXRATE1,
  TXRATE2,
  TXRATE3,
  TXUSERCLKIN0,
  TXUSERCLKIN1,
  TXUSERCLKIN2,
  TXUSERCLKIN3
);

    parameter [15:0] BER_CONST_PTRN0 = 16'h0000;
  parameter [15:0] BER_CONST_PTRN1 = 16'h0000;
  parameter [15:0] BUFFER_CONFIG_LANE0 = 16'h4004;
  parameter [15:0] BUFFER_CONFIG_LANE1 = 16'h4004;
  parameter [15:0] BUFFER_CONFIG_LANE2 = 16'h4004;
  parameter [15:0] BUFFER_CONFIG_LANE3 = 16'h4004;
  parameter [15:0] DFE_TRAIN_CTRL_LANE0 = 16'h0000;
  parameter [15:0] DFE_TRAIN_CTRL_LANE1 = 16'h0000;
  parameter [15:0] DFE_TRAIN_CTRL_LANE2 = 16'h0000;
  parameter [15:0] DFE_TRAIN_CTRL_LANE3 = 16'h0000;
  parameter [15:0] DLL_CFG0 = 16'h8202;
  parameter [15:0] DLL_CFG1 = 16'h0000;
  parameter [15:0] E10GBASEKR_LD_COEFF_UPD_LANE0 = 16'h0000;
  parameter [15:0] E10GBASEKR_LD_COEFF_UPD_LANE1 = 16'h0000;
  parameter [15:0] E10GBASEKR_LD_COEFF_UPD_LANE2 = 16'h0000;
  parameter [15:0] E10GBASEKR_LD_COEFF_UPD_LANE3 = 16'h0000;
  parameter [15:0] E10GBASEKR_LP_COEFF_UPD_LANE0 = 16'h0000;
  parameter [15:0] E10GBASEKR_LP_COEFF_UPD_LANE1 = 16'h0000;
  parameter [15:0] E10GBASEKR_LP_COEFF_UPD_LANE2 = 16'h0000;
  parameter [15:0] E10GBASEKR_LP_COEFF_UPD_LANE3 = 16'h0000;
  parameter [15:0] E10GBASEKR_PMA_CTRL_LANE0 = 16'h0002;
  parameter [15:0] E10GBASEKR_PMA_CTRL_LANE1 = 16'h0002;
  parameter [15:0] E10GBASEKR_PMA_CTRL_LANE2 = 16'h0002;
  parameter [15:0] E10GBASEKR_PMA_CTRL_LANE3 = 16'h0002;
  parameter [15:0] E10GBASEKX_CTRL_LANE0 = 16'h0000;
  parameter [15:0] E10GBASEKX_CTRL_LANE1 = 16'h0000;
  parameter [15:0] E10GBASEKX_CTRL_LANE2 = 16'h0000;
  parameter [15:0] E10GBASEKX_CTRL_LANE3 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_CFG_LANE0 = 16'h070C;
  parameter [15:0] E10GBASER_PCS_CFG_LANE1 = 16'h070C;
  parameter [15:0] E10GBASER_PCS_CFG_LANE2 = 16'h070C;
  parameter [15:0] E10GBASER_PCS_CFG_LANE3 = 16'h070C;
  parameter [15:0] E10GBASER_PCS_SEEDA0_LANE0 = 16'h0001;
  parameter [15:0] E10GBASER_PCS_SEEDA0_LANE1 = 16'h0001;
  parameter [15:0] E10GBASER_PCS_SEEDA0_LANE2 = 16'h0001;
  parameter [15:0] E10GBASER_PCS_SEEDA0_LANE3 = 16'h0001;
  parameter [15:0] E10GBASER_PCS_SEEDA1_LANE0 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDA1_LANE1 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDA1_LANE2 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDA1_LANE3 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDA2_LANE0 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDA2_LANE1 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDA2_LANE2 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDA2_LANE3 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDA3_LANE0 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDA3_LANE1 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDA3_LANE2 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDA3_LANE3 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB0_LANE0 = 16'h0001;
  parameter [15:0] E10GBASER_PCS_SEEDB0_LANE1 = 16'h0001;
  parameter [15:0] E10GBASER_PCS_SEEDB0_LANE2 = 16'h0001;
  parameter [15:0] E10GBASER_PCS_SEEDB0_LANE3 = 16'h0001;
  parameter [15:0] E10GBASER_PCS_SEEDB1_LANE0 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB1_LANE1 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB1_LANE2 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB1_LANE3 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB2_LANE0 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB2_LANE1 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB2_LANE2 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB2_LANE3 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB3_LANE0 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB3_LANE1 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB3_LANE2 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_SEEDB3_LANE3 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_TEST_CTRL_LANE0 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_TEST_CTRL_LANE1 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_TEST_CTRL_LANE2 = 16'h0000;
  parameter [15:0] E10GBASER_PCS_TEST_CTRL_LANE3 = 16'h0000;
  parameter [15:0] E10GBASEX_PCS_TSTCTRL_LANE0 = 16'h0000;
  parameter [15:0] E10GBASEX_PCS_TSTCTRL_LANE1 = 16'h0000;
  parameter [15:0] E10GBASEX_PCS_TSTCTRL_LANE2 = 16'h0000;
  parameter [15:0] E10GBASEX_PCS_TSTCTRL_LANE3 = 16'h0000;
  parameter [15:0] GLBL0_NOISE_CTRL = 16'hF0B8;
  parameter [15:0] GLBL_AMON_SEL = 16'h0000;
  parameter [15:0] GLBL_DMON_SEL = 16'h0200;
  parameter [15:0] GLBL_PWR_CTRL = 16'h0000;
  parameter [0:0] GTH_CFG_PWRUP_LANE0 = 1'b1;
  parameter [0:0] GTH_CFG_PWRUP_LANE1 = 1'b1;
  parameter [0:0] GTH_CFG_PWRUP_LANE2 = 1'b1;
  parameter [0:0] GTH_CFG_PWRUP_LANE3 = 1'b1;
  parameter [15:0] LANE_AMON_SEL = 16'h00F0;
  parameter [15:0] LANE_DMON_SEL = 16'h0000;
  parameter [15:0] LANE_LNK_CFGOVRD = 16'h0000;
  parameter [15:0] LANE_PWR_CTRL_LANE0 = 16'h0400;
  parameter [15:0] LANE_PWR_CTRL_LANE1 = 16'h0400;
  parameter [15:0] LANE_PWR_CTRL_LANE2 = 16'h0400;
  parameter [15:0] LANE_PWR_CTRL_LANE3 = 16'h0400;
  parameter [15:0] LNK_TRN_CFG_LANE0 = 16'h0000;
  parameter [15:0] LNK_TRN_CFG_LANE1 = 16'h0000;
  parameter [15:0] LNK_TRN_CFG_LANE2 = 16'h0000;
  parameter [15:0] LNK_TRN_CFG_LANE3 = 16'h0000;
  parameter [15:0] LNK_TRN_COEFF_REQ_LANE0 = 16'h0000;
  parameter [15:0] LNK_TRN_COEFF_REQ_LANE1 = 16'h0000;
  parameter [15:0] LNK_TRN_COEFF_REQ_LANE2 = 16'h0000;
  parameter [15:0] LNK_TRN_COEFF_REQ_LANE3 = 16'h0000;
  parameter [15:0] MISC_CFG = 16'h0008;
  parameter [15:0] MODE_CFG1 = 16'h0000;
  parameter [15:0] MODE_CFG2 = 16'h0000;
  parameter [15:0] MODE_CFG3 = 16'h0000;
  parameter [15:0] MODE_CFG4 = 16'h0000;
  parameter [15:0] MODE_CFG5 = 16'h0000;
  parameter [15:0] MODE_CFG6 = 16'h0000;
  parameter [15:0] MODE_CFG7 = 16'h0000;
  parameter [15:0] PCS_ABILITY_LANE0 = 16'h0010;
  parameter [15:0] PCS_ABILITY_LANE1 = 16'h0010;
  parameter [15:0] PCS_ABILITY_LANE2 = 16'h0010;
  parameter [15:0] PCS_ABILITY_LANE3 = 16'h0010;
  parameter [15:0] PCS_CTRL1_LANE0 = 16'h2040;
  parameter [15:0] PCS_CTRL1_LANE1 = 16'h2040;
  parameter [15:0] PCS_CTRL1_LANE2 = 16'h2040;
  parameter [15:0] PCS_CTRL1_LANE3 = 16'h2040;
  parameter [15:0] PCS_CTRL2_LANE0 = 16'h0000;
  parameter [15:0] PCS_CTRL2_LANE1 = 16'h0000;
  parameter [15:0] PCS_CTRL2_LANE2 = 16'h0000;
  parameter [15:0] PCS_CTRL2_LANE3 = 16'h0000;
  parameter [15:0] PCS_MISC_CFG_0_LANE0 = 16'h1116;
  parameter [15:0] PCS_MISC_CFG_0_LANE1 = 16'h1116;
  parameter [15:0] PCS_MISC_CFG_0_LANE2 = 16'h1116;
  parameter [15:0] PCS_MISC_CFG_0_LANE3 = 16'h1116;
  parameter [15:0] PCS_MISC_CFG_1_LANE0 = 16'h0000;
  parameter [15:0] PCS_MISC_CFG_1_LANE1 = 16'h0000;
  parameter [15:0] PCS_MISC_CFG_1_LANE2 = 16'h0000;
  parameter [15:0] PCS_MISC_CFG_1_LANE3 = 16'h0000;
  parameter [15:0] PCS_MODE_LANE0 = 16'h0000;
  parameter [15:0] PCS_MODE_LANE1 = 16'h0000;
  parameter [15:0] PCS_MODE_LANE2 = 16'h0000;
  parameter [15:0] PCS_MODE_LANE3 = 16'h0000;
  parameter [15:0] PCS_RESET_1_LANE0 = 16'h0002;
  parameter [15:0] PCS_RESET_1_LANE1 = 16'h0002;
  parameter [15:0] PCS_RESET_1_LANE2 = 16'h0002;
  parameter [15:0] PCS_RESET_1_LANE3 = 16'h0002;
  parameter [15:0] PCS_RESET_LANE0 = 16'h0000;
  parameter [15:0] PCS_RESET_LANE1 = 16'h0000;
  parameter [15:0] PCS_RESET_LANE2 = 16'h0000;
  parameter [15:0] PCS_RESET_LANE3 = 16'h0000;
  parameter [15:0] PCS_TYPE_LANE0 = 16'h002C;
  parameter [15:0] PCS_TYPE_LANE1 = 16'h002C;
  parameter [15:0] PCS_TYPE_LANE2 = 16'h002C;
  parameter [15:0] PCS_TYPE_LANE3 = 16'h002C;
  parameter [15:0] PLL_CFG0 = 16'h95DF;
  parameter [15:0] PLL_CFG1 = 16'h81C0;
  parameter [15:0] PLL_CFG2 = 16'h0424;
  parameter [15:0] PMA_CTRL1_LANE0 = 16'h0000;
  parameter [15:0] PMA_CTRL1_LANE1 = 16'h0000;
  parameter [15:0] PMA_CTRL1_LANE2 = 16'h0000;
  parameter [15:0] PMA_CTRL1_LANE3 = 16'h0000;
  parameter [15:0] PMA_CTRL2_LANE0 = 16'h000B;
  parameter [15:0] PMA_CTRL2_LANE1 = 16'h000B;
  parameter [15:0] PMA_CTRL2_LANE2 = 16'h000B;
  parameter [15:0] PMA_CTRL2_LANE3 = 16'h000B;
  parameter [15:0] PMA_LPBK_CTRL_LANE0 = 16'h0004;
  parameter [15:0] PMA_LPBK_CTRL_LANE1 = 16'h0004;
  parameter [15:0] PMA_LPBK_CTRL_LANE2 = 16'h0004;
  parameter [15:0] PMA_LPBK_CTRL_LANE3 = 16'h0004;
  parameter [15:0] PRBS_BER_CFG0_LANE0 = 16'h0000;
  parameter [15:0] PRBS_BER_CFG0_LANE1 = 16'h0000;
  parameter [15:0] PRBS_BER_CFG0_LANE2 = 16'h0000;
  parameter [15:0] PRBS_BER_CFG0_LANE3 = 16'h0000;
  parameter [15:0] PRBS_BER_CFG1_LANE0 = 16'h0000;
  parameter [15:0] PRBS_BER_CFG1_LANE1 = 16'h0000;
  parameter [15:0] PRBS_BER_CFG1_LANE2 = 16'h0000;
  parameter [15:0] PRBS_BER_CFG1_LANE3 = 16'h0000;
  parameter [15:0] PRBS_CFG_LANE0 = 16'h000A;
  parameter [15:0] PRBS_CFG_LANE1 = 16'h000A;
  parameter [15:0] PRBS_CFG_LANE2 = 16'h000A;
  parameter [15:0] PRBS_CFG_LANE3 = 16'h000A;
  parameter [15:0] PTRN_CFG0_LSB = 16'h5555;
  parameter [15:0] PTRN_CFG0_MSB = 16'h5555;
  parameter [15:0] PTRN_LEN_CFG = 16'h001F;
  parameter [15:0] PWRUP_DLY = 16'h0000;
  parameter [15:0] RX_AEQ_VAL0_LANE0 = 16'h03C0;
  parameter [15:0] RX_AEQ_VAL0_LANE1 = 16'h03C0;
  parameter [15:0] RX_AEQ_VAL0_LANE2 = 16'h03C0;
  parameter [15:0] RX_AEQ_VAL0_LANE3 = 16'h03C0;
  parameter [15:0] RX_AEQ_VAL1_LANE0 = 16'h0000;
  parameter [15:0] RX_AEQ_VAL1_LANE1 = 16'h0000;
  parameter [15:0] RX_AEQ_VAL1_LANE2 = 16'h0000;
  parameter [15:0] RX_AEQ_VAL1_LANE3 = 16'h0000;
  parameter [15:0] RX_AGC_CTRL_LANE0 = 16'h0000;
  parameter [15:0] RX_AGC_CTRL_LANE1 = 16'h0000;
  parameter [15:0] RX_AGC_CTRL_LANE2 = 16'h0000;
  parameter [15:0] RX_AGC_CTRL_LANE3 = 16'h0000;
  parameter [15:0] RX_CDR_CTRL0_LANE0 = 16'h0005;
  parameter [15:0] RX_CDR_CTRL0_LANE1 = 16'h0005;
  parameter [15:0] RX_CDR_CTRL0_LANE2 = 16'h0005;
  parameter [15:0] RX_CDR_CTRL0_LANE3 = 16'h0005;
  parameter [15:0] RX_CDR_CTRL1_LANE0 = 16'h4200;
  parameter [15:0] RX_CDR_CTRL1_LANE1 = 16'h4200;
  parameter [15:0] RX_CDR_CTRL1_LANE2 = 16'h4200;
  parameter [15:0] RX_CDR_CTRL1_LANE3 = 16'h4200;
  parameter [15:0] RX_CDR_CTRL2_LANE0 = 16'h2000;
  parameter [15:0] RX_CDR_CTRL2_LANE1 = 16'h2000;
  parameter [15:0] RX_CDR_CTRL2_LANE2 = 16'h2000;
  parameter [15:0] RX_CDR_CTRL2_LANE3 = 16'h2000;
  parameter [15:0] RX_CFG0_LANE0 = 16'h0500;
  parameter [15:0] RX_CFG0_LANE1 = 16'h0500;
  parameter [15:0] RX_CFG0_LANE2 = 16'h0500;
  parameter [15:0] RX_CFG0_LANE3 = 16'h0500;
  parameter [15:0] RX_CFG1_LANE0 = 16'h821F;
  parameter [15:0] RX_CFG1_LANE1 = 16'h821F;
  parameter [15:0] RX_CFG1_LANE2 = 16'h821F;
  parameter [15:0] RX_CFG1_LANE3 = 16'h821F;
  parameter [15:0] RX_CFG2_LANE0 = 16'h1001;
  parameter [15:0] RX_CFG2_LANE1 = 16'h1001;
  parameter [15:0] RX_CFG2_LANE2 = 16'h1001;
  parameter [15:0] RX_CFG2_LANE3 = 16'h1001;
  parameter [15:0] RX_CTLE_CTRL_LANE0 = 16'h008F;
  parameter [15:0] RX_CTLE_CTRL_LANE1 = 16'h008F;
  parameter [15:0] RX_CTLE_CTRL_LANE2 = 16'h008F;
  parameter [15:0] RX_CTLE_CTRL_LANE3 = 16'h008F;
  parameter [15:0] RX_CTRL_OVRD_LANE0 = 16'h000C;
  parameter [15:0] RX_CTRL_OVRD_LANE1 = 16'h000C;
  parameter [15:0] RX_CTRL_OVRD_LANE2 = 16'h000C;
  parameter [15:0] RX_CTRL_OVRD_LANE3 = 16'h000C;
  parameter integer RX_FABRIC_WIDTH0 = 6466;
  parameter integer RX_FABRIC_WIDTH1 = 6466;
  parameter integer RX_FABRIC_WIDTH2 = 6466;
  parameter integer RX_FABRIC_WIDTH3 = 6466;
  parameter [15:0] RX_LOOP_CTRL_LANE0 = 16'h007F;
  parameter [15:0] RX_LOOP_CTRL_LANE1 = 16'h007F;
  parameter [15:0] RX_LOOP_CTRL_LANE2 = 16'h007F;
  parameter [15:0] RX_LOOP_CTRL_LANE3 = 16'h007F;
  parameter [15:0] RX_MVAL0_LANE0 = 16'h0000;
  parameter [15:0] RX_MVAL0_LANE1 = 16'h0000;
  parameter [15:0] RX_MVAL0_LANE2 = 16'h0000;
  parameter [15:0] RX_MVAL0_LANE3 = 16'h0000;
  parameter [15:0] RX_MVAL1_LANE0 = 16'h0000;
  parameter [15:0] RX_MVAL1_LANE1 = 16'h0000;
  parameter [15:0] RX_MVAL1_LANE2 = 16'h0000;
  parameter [15:0] RX_MVAL1_LANE3 = 16'h0000;
  parameter [15:0] RX_P0S_CTRL = 16'h1206;
  parameter [15:0] RX_P0_CTRL = 16'h11F0;
  parameter [15:0] RX_P1_CTRL = 16'h120F;
  parameter [15:0] RX_P2_CTRL = 16'h0E0F;
  parameter [15:0] RX_PI_CTRL0 = 16'hD2F0;
  parameter [15:0] RX_PI_CTRL1 = 16'h0080;
  parameter integer SIM_GTHRESET_SPEEDUP = 1;
  parameter SIM_VERSION = "1.0";
  parameter [15:0] SLICE_CFG = 16'h0000;
  parameter [15:0] SLICE_NOISE_CTRL_0_LANE01 = 16'h0000;
  parameter [15:0] SLICE_NOISE_CTRL_0_LANE23 = 16'h0000;
  parameter [15:0] SLICE_NOISE_CTRL_1_LANE01 = 16'h0000;
  parameter [15:0] SLICE_NOISE_CTRL_1_LANE23 = 16'h0000;
  parameter [15:0] SLICE_NOISE_CTRL_2_LANE01 = 16'h7FFF;
  parameter [15:0] SLICE_NOISE_CTRL_2_LANE23 = 16'h7FFF;
  parameter [15:0] SLICE_TX_RESET_LANE01 = 16'h0000;
  parameter [15:0] SLICE_TX_RESET_LANE23 = 16'h0000;
  parameter [15:0] TERM_CTRL_LANE0 = 16'h5007;
  parameter [15:0] TERM_CTRL_LANE1 = 16'h5007;
  parameter [15:0] TERM_CTRL_LANE2 = 16'h5007;
  parameter [15:0] TERM_CTRL_LANE3 = 16'h5007;
  parameter [15:0] TX_CFG0_LANE0 = 16'h203D;
  parameter [15:0] TX_CFG0_LANE1 = 16'h203D;
  parameter [15:0] TX_CFG0_LANE2 = 16'h203D;
  parameter [15:0] TX_CFG0_LANE3 = 16'h203D;
  parameter [15:0] TX_CFG1_LANE0 = 16'h0F00;
  parameter [15:0] TX_CFG1_LANE1 = 16'h0F00;
  parameter [15:0] TX_CFG1_LANE2 = 16'h0F00;
  parameter [15:0] TX_CFG1_LANE3 = 16'h0F00;
  parameter [15:0] TX_CFG2_LANE0 = 16'h0081;
  parameter [15:0] TX_CFG2_LANE1 = 16'h0081;
  parameter [15:0] TX_CFG2_LANE2 = 16'h0081;
  parameter [15:0] TX_CFG2_LANE3 = 16'h0081;
  parameter [15:0] TX_CLK_SEL0_LANE0 = 16'h2121;
  parameter [15:0] TX_CLK_SEL0_LANE1 = 16'h2121;
  parameter [15:0] TX_CLK_SEL0_LANE2 = 16'h2121;
  parameter [15:0] TX_CLK_SEL0_LANE3 = 16'h2121;
  parameter [15:0] TX_CLK_SEL1_LANE0 = 16'h2121;
  parameter [15:0] TX_CLK_SEL1_LANE1 = 16'h2121;
  parameter [15:0] TX_CLK_SEL1_LANE2 = 16'h2121;
  parameter [15:0] TX_CLK_SEL1_LANE3 = 16'h2121;
  parameter [15:0] TX_DISABLE_LANE0 = 16'h0000;
  parameter [15:0] TX_DISABLE_LANE1 = 16'h0000;
  parameter [15:0] TX_DISABLE_LANE2 = 16'h0000;
  parameter [15:0] TX_DISABLE_LANE3 = 16'h0000;
  parameter integer TX_FABRIC_WIDTH0 = 6466;
  parameter integer TX_FABRIC_WIDTH1 = 6466;
  parameter integer TX_FABRIC_WIDTH2 = 6466;
  parameter integer TX_FABRIC_WIDTH3 = 6466;
  parameter [15:0] TX_P0P0S_CTRL = 16'h060C;
  parameter [15:0] TX_P1P2_CTRL = 16'h0C39;
  parameter [15:0] TX_PREEMPH_LANE0 = 16'h00A1;
  parameter [15:0] TX_PREEMPH_LANE1 = 16'h00A1;
  parameter [15:0] TX_PREEMPH_LANE2 = 16'h00A1;
  parameter [15:0] TX_PREEMPH_LANE3 = 16'h00A1;
  parameter [15:0] TX_PWR_RATE_OVRD_LANE0 = 16'h0060;
  parameter [15:0] TX_PWR_RATE_OVRD_LANE1 = 16'h0060;
  parameter [15:0] TX_PWR_RATE_OVRD_LANE2 = 16'h0060;
  parameter [15:0] TX_PWR_RATE_OVRD_LANE3 = 16'h0060;
  
  output DRDY;
  output GTHINITDONE;
  output MGMTPCSRDACK;
  output RXCTRLACK0;
  output RXCTRLACK1;
  output RXCTRLACK2;
  output RXCTRLACK3;
  output RXDATATAP0;
  output RXDATATAP1;
  output RXDATATAP2;
  output RXDATATAP3;
  output RXPCSCLKSMPL0;
  output RXPCSCLKSMPL1;
  output RXPCSCLKSMPL2;
  output RXPCSCLKSMPL3;
  output RXUSERCLKOUT0;
  output RXUSERCLKOUT1;
  output RXUSERCLKOUT2;
  output RXUSERCLKOUT3;
  output TSTPATH;
  output TSTREFCLKFAB;
  output TSTREFCLKOUT;
  output TXCTRLACK0;
  output TXCTRLACK1;
  output TXCTRLACK2;
  output TXCTRLACK3;
  output TXDATATAP10;
  output TXDATATAP11;
  output TXDATATAP12;
  output TXDATATAP13;
  output TXDATATAP20;
  output TXDATATAP21;
  output TXDATATAP22;
  output TXDATATAP23;
  output TXN0;
  output TXN1;
  output TXN2;
  output TXN3;
  output TXP0;
  output TXP1;
  output TXP2;
  output TXP3;
  output TXPCSCLKSMPL0;
  output TXPCSCLKSMPL1;
  output TXPCSCLKSMPL2;
  output TXPCSCLKSMPL3;
  output TXUSERCLKOUT0;
  output TXUSERCLKOUT1;
  output TXUSERCLKOUT2;
  output TXUSERCLKOUT3;
  output [15:0] DRPDO;
  output [15:0] MGMTPCSRDDATA;
  output [63:0] RXDATA0;
  output [63:0] RXDATA1;
  output [63:0] RXDATA2;
  output [63:0] RXDATA3;
  output [7:0] RXCODEERR0;
  output [7:0] RXCODEERR1;
  output [7:0] RXCODEERR2;
  output [7:0] RXCODEERR3;
  output [7:0] RXCTRL0;
  output [7:0] RXCTRL1;
  output [7:0] RXCTRL2;
  output [7:0] RXCTRL3;
  output [7:0] RXDISPERR0;
  output [7:0] RXDISPERR1;
  output [7:0] RXDISPERR2;
  output [7:0] RXDISPERR3;
  output [7:0] RXVALID0;
  output [7:0] RXVALID1;
  output [7:0] RXVALID2;
  output [7:0] RXVALID3;

  input DCLK;
  input DEN;
  input DFETRAINCTRL0;
  input DFETRAINCTRL1;
  input DFETRAINCTRL2;
  input DFETRAINCTRL3;
  input DISABLEDRP;
  input DWE;
  input GTHINIT;
  input GTHRESET;
  input GTHX2LANE01;
  input GTHX2LANE23;
  input GTHX4LANE;
  input MGMTPCSREGRD;
  input MGMTPCSREGWR;
  input POWERDOWN0;
  input POWERDOWN1;
  input POWERDOWN2;
  input POWERDOWN3;
  input REFCLK;
  input RXBUFRESET0;
  input RXBUFRESET1;
  input RXBUFRESET2;
  input RXBUFRESET3;
  input RXENCOMMADET0;
  input RXENCOMMADET1;
  input RXENCOMMADET2;
  input RXENCOMMADET3;
  input RXN0;
  input RXN1;
  input RXN2;
  input RXN3;
  input RXP0;
  input RXP1;
  input RXP2;
  input RXP3;
  input RXPOLARITY0;
  input RXPOLARITY1;
  input RXPOLARITY2;
  input RXPOLARITY3;
  input RXSLIP0;
  input RXSLIP1;
  input RXSLIP2;
  input RXSLIP3;
  input RXUSERCLKIN0;
  input RXUSERCLKIN1;
  input RXUSERCLKIN2;
  input RXUSERCLKIN3;
  input TXBUFRESET0;
  input TXBUFRESET1;
  input TXBUFRESET2;
  input TXBUFRESET3;
  input TXDEEMPH0;
  input TXDEEMPH1;
  input TXDEEMPH2;
  input TXDEEMPH3;
  input TXUSERCLKIN0;
  input TXUSERCLKIN1;
  input TXUSERCLKIN2;
  input TXUSERCLKIN3;
  input [15:0] DADDR;
  input [15:0] DI;
  input [15:0] MGMTPCSREGADDR;
  input [15:0] MGMTPCSWRDATA;
  input [1:0] RXPOWERDOWN0;
  input [1:0] RXPOWERDOWN1;
  input [1:0] RXPOWERDOWN2;
  input [1:0] RXPOWERDOWN3;
  input [1:0] RXRATE0;
  input [1:0] RXRATE1;
  input [1:0] RXRATE2;
  input [1:0] RXRATE3;
  input [1:0] TXPOWERDOWN0;
  input [1:0] TXPOWERDOWN1;
  input [1:0] TXPOWERDOWN2;
  input [1:0] TXPOWERDOWN3;
  input [1:0] TXRATE0;
  input [1:0] TXRATE1;
  input [1:0] TXRATE2;
  input [1:0] TXRATE3;
  input [2:0] PLLREFCLKSEL;
  input [2:0] SAMPLERATE0;
  input [2:0] SAMPLERATE1;
  input [2:0] SAMPLERATE2;
  input [2:0] SAMPLERATE3;
  input [2:0] TXMARGIN0;
  input [2:0] TXMARGIN1;
  input [2:0] TXMARGIN2;
  input [2:0] TXMARGIN3;
  input [3:0] MGMTPCSLANESEL;
  input [4:0] MGMTPCSMMDADDR;
  input [5:0] PLLPCSCLKDIV;
  input [63:0] TXDATA0;
  input [63:0] TXDATA1;
  input [63:0] TXDATA2;
  input [63:0] TXDATA3;
  input [7:0] TXCTRL0;
  input [7:0] TXCTRL1;
  input [7:0] TXCTRL2;
  input [7:0] TXCTRL3;
  input [7:0] TXDATAMSB0;
  input [7:0] TXDATAMSB1;
  input [7:0] TXDATAMSB2;
  input [7:0] TXDATAMSB3;

endmodule
