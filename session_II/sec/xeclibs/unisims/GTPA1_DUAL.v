// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/GTPA1_DUAL.v,v 1.5 2010/06/02 20:13:45 vandanad Exp $
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
// /___/   /\     Filename : GTPA1_DUAL.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps
module GTPA1_DUAL (
  DRDY,
  DRPDO,
  GTPCLKFBEAST,
  GTPCLKFBWEST,
  GTPCLKOUT0,
  GTPCLKOUT1,
  PHYSTATUS0,
  PHYSTATUS1,
  PLLLKDET0,
  PLLLKDET1,
  RCALOUTEAST,
  RCALOUTWEST,
  REFCLKOUT0,
  REFCLKOUT1,
  REFCLKPLL0,
  REFCLKPLL1,
  RESETDONE0,
  RESETDONE1,
  RXBUFSTATUS0,
  RXBUFSTATUS1,
  RXBYTEISALIGNED0,
  RXBYTEISALIGNED1,
  RXBYTEREALIGN0,
  RXBYTEREALIGN1,
  RXCHANBONDSEQ0,
  RXCHANBONDSEQ1,
  RXCHANISALIGNED0,
  RXCHANISALIGNED1,
  RXCHANREALIGN0,
  RXCHANREALIGN1,
  RXCHARISCOMMA0,
  RXCHARISCOMMA1,
  RXCHARISK0,
  RXCHARISK1,
  RXCHBONDO,
  RXCLKCORCNT0,
  RXCLKCORCNT1,
  RXCOMMADET0,
  RXCOMMADET1,
  RXDATA0,
  RXDATA1,
  RXDISPERR0,
  RXDISPERR1,
  RXELECIDLE0,
  RXELECIDLE1,
  RXLOSSOFSYNC0,
  RXLOSSOFSYNC1,
  RXNOTINTABLE0,
  RXNOTINTABLE1,
  RXPRBSERR0,
  RXPRBSERR1,
  RXRECCLK0,
  RXRECCLK1,
  RXRUNDISP0,
  RXRUNDISP1,
  RXSTATUS0,
  RXSTATUS1,
  RXVALID0,
  RXVALID1,
  TSTOUT0,
  TSTOUT1,
  TXBUFSTATUS0,
  TXBUFSTATUS1,
  TXKERR0,
  TXKERR1,
  TXN0,
  TXN1,
  TXOUTCLK0,
  TXOUTCLK1,
  TXP0,
  TXP1,
  TXRUNDISP0,
  TXRUNDISP1,
  CLK00,
  CLK01,
  CLK10,
  CLK11,
  CLKINEAST0,
  CLKINEAST1,
  CLKINWEST0,
  CLKINWEST1,
  DADDR,
  DCLK,
  DEN,
  DI,
  DWE,
  GATERXELECIDLE0,
  GATERXELECIDLE1,
  GCLK00,
  GCLK01,
  GCLK10,
  GCLK11,
  GTPCLKFBSEL0EAST,
  GTPCLKFBSEL0WEST,
  GTPCLKFBSEL1EAST,
  GTPCLKFBSEL1WEST,
  GTPRESET0,
  GTPRESET1,
  GTPTEST0,
  GTPTEST1,
  IGNORESIGDET0,
  IGNORESIGDET1,
  INTDATAWIDTH0,
  INTDATAWIDTH1,
  LOOPBACK0,
  LOOPBACK1,
  PLLCLK00,
  PLLCLK01,
  PLLCLK10,
  PLLCLK11,
  PLLLKDETEN0,
  PLLLKDETEN1,
  PLLPOWERDOWN0,
  PLLPOWERDOWN1,
  PRBSCNTRESET0,
  PRBSCNTRESET1,
  RCALINEAST,
  RCALINWEST,
  REFCLKPWRDNB0,
  REFCLKPWRDNB1,
  REFSELDYPLL0,
  REFSELDYPLL1,
  RXBUFRESET0,
  RXBUFRESET1,
  RXCDRRESET0,
  RXCDRRESET1,
  RXCHBONDI,
  RXCHBONDMASTER0,
  RXCHBONDMASTER1,
  RXCHBONDSLAVE0,
  RXCHBONDSLAVE1,
  RXCOMMADETUSE0,
  RXCOMMADETUSE1,
  RXDATAWIDTH0,
  RXDATAWIDTH1,
  RXDEC8B10BUSE0,
  RXDEC8B10BUSE1,
  RXENCHANSYNC0,
  RXENCHANSYNC1,
  RXENMCOMMAALIGN0,
  RXENMCOMMAALIGN1,
  RXENPCOMMAALIGN0,
  RXENPCOMMAALIGN1,
  RXENPMAPHASEALIGN0,
  RXENPMAPHASEALIGN1,
  RXENPRBSTST0,
  RXENPRBSTST1,
  RXEQMIX0,
  RXEQMIX1,
  RXN0,
  RXN1,
  RXP0,
  RXP1,
  RXPMASETPHASE0,
  RXPMASETPHASE1,
  RXPOLARITY0,
  RXPOLARITY1,
  RXPOWERDOWN0,
  RXPOWERDOWN1,
  RXRESET0,
  RXRESET1,
  RXSLIDE0,
  RXSLIDE1,
  RXUSRCLK0,
  RXUSRCLK1,
  RXUSRCLK20,
  RXUSRCLK21,
  TSTCLK0,
  TSTCLK1,
  TSTIN0,
  TSTIN1,
  TXBUFDIFFCTRL0,
  TXBUFDIFFCTRL1,
  TXBYPASS8B10B0,
  TXBYPASS8B10B1,
  TXCHARDISPMODE0,
  TXCHARDISPMODE1,
  TXCHARDISPVAL0,
  TXCHARDISPVAL1,
  TXCHARISK0,
  TXCHARISK1,
  TXCOMSTART0,
  TXCOMSTART1,
  TXCOMTYPE0,
  TXCOMTYPE1,
  TXDATA0,
  TXDATA1,
  TXDATAWIDTH0,
  TXDATAWIDTH1,
  TXDETECTRX0,
  TXDETECTRX1,
  TXDIFFCTRL0,
  TXDIFFCTRL1,
  TXELECIDLE0,
  TXELECIDLE1,
  TXENC8B10BUSE0,
  TXENC8B10BUSE1,
  TXENPMAPHASEALIGN0,
  TXENPMAPHASEALIGN1,
  TXENPRBSTST0,
  TXENPRBSTST1,
  TXINHIBIT0,
  TXINHIBIT1,
  TXPDOWNASYNCH0,
  TXPDOWNASYNCH1,
  TXPMASETPHASE0,
  TXPMASETPHASE1,
  TXPOLARITY0,
  TXPOLARITY1,
  TXPOWERDOWN0,
  TXPOWERDOWN1,
  TXPRBSFORCEERR0,
  TXPRBSFORCEERR1,
  TXPREEMPHASIS0,
  TXPREEMPHASIS1,
  TXRESET0,
  TXRESET1,
  TXUSRCLK0,
  TXUSRCLK1,
  TXUSRCLK20,
  TXUSRCLK21,
  USRCODEERR0,
  USRCODEERR1
);

  parameter AC_CAP_DIS_0 = "TRUE";
  parameter AC_CAP_DIS_1 = "TRUE";
  parameter integer ALIGN_COMMA_WORD_0 = 1;
  parameter integer ALIGN_COMMA_WORD_1 = 1;
  parameter integer CB2_INH_CC_PERIOD_0 = 8;
  parameter integer CB2_INH_CC_PERIOD_1 = 8;
  parameter [4:0] CDR_PH_ADJ_TIME_0 = 5'b01010;
  parameter [4:0] CDR_PH_ADJ_TIME_1 = 5'b01010;
  parameter integer CHAN_BOND_1_MAX_SKEW_0 = 7;
  parameter integer CHAN_BOND_1_MAX_SKEW_1 = 7;
  parameter integer CHAN_BOND_2_MAX_SKEW_0 = 1;
  parameter integer CHAN_BOND_2_MAX_SKEW_1 = 1;
  parameter CHAN_BOND_KEEP_ALIGN_0 = "FALSE";
  parameter CHAN_BOND_KEEP_ALIGN_1 = "FALSE";
  parameter [9:0] CHAN_BOND_SEQ_1_1_0 = 10'b0101111100;
  parameter [9:0] CHAN_BOND_SEQ_1_1_1 = 10'b0101111100;
  parameter [9:0] CHAN_BOND_SEQ_1_2_0 = 10'b0001001010;
  parameter [9:0] CHAN_BOND_SEQ_1_2_1 = 10'b0001001010;
  parameter [9:0] CHAN_BOND_SEQ_1_3_0 = 10'b0001001010;
  parameter [9:0] CHAN_BOND_SEQ_1_3_1 = 10'b0001001010;
  parameter [9:0] CHAN_BOND_SEQ_1_4_0 = 10'b0110111100;
  parameter [9:0] CHAN_BOND_SEQ_1_4_1 = 10'b0110111100;
  parameter [3:0] CHAN_BOND_SEQ_1_ENABLE_0 = 4'b1111;
  parameter [3:0] CHAN_BOND_SEQ_1_ENABLE_1 = 4'b1111;
  parameter [9:0] CHAN_BOND_SEQ_2_1_0 = 10'b0110111100;
  parameter [9:0] CHAN_BOND_SEQ_2_1_1 = 10'b0110111100;
  parameter [9:0] CHAN_BOND_SEQ_2_2_0 = 10'b0100111100;
  parameter [9:0] CHAN_BOND_SEQ_2_2_1 = 10'b0100111100;
  parameter [9:0] CHAN_BOND_SEQ_2_3_0 = 10'b0100111100;
  parameter [9:0] CHAN_BOND_SEQ_2_3_1 = 10'b0100111100;
  parameter [9:0] CHAN_BOND_SEQ_2_4_0 = 10'b0100111100;
  parameter [9:0] CHAN_BOND_SEQ_2_4_1 = 10'b0100111100;
  parameter [3:0] CHAN_BOND_SEQ_2_ENABLE_0 = 4'b1111;
  parameter [3:0] CHAN_BOND_SEQ_2_ENABLE_1 = 4'b1111;
  parameter CHAN_BOND_SEQ_2_USE_0 = "FALSE";
  parameter CHAN_BOND_SEQ_2_USE_1 = "FALSE";
  parameter integer CHAN_BOND_SEQ_LEN_0 = 1;
  parameter integer CHAN_BOND_SEQ_LEN_1 = 1;
  parameter integer CLK25_DIVIDER_0 = 4;
  parameter integer CLK25_DIVIDER_1 = 4;
  parameter CLKINDC_B_0 = "TRUE";
  parameter CLKINDC_B_1 = "TRUE";
  parameter CLKRCV_TRST_0 = "TRUE";
  parameter CLKRCV_TRST_1 = "TRUE";
  parameter CLK_CORRECT_USE_0 = "TRUE";
  parameter CLK_CORRECT_USE_1 = "TRUE";
  parameter integer CLK_COR_ADJ_LEN_0 = 1;
  parameter integer CLK_COR_ADJ_LEN_1 = 1;
  parameter integer CLK_COR_DET_LEN_0 = 1;
  parameter integer CLK_COR_DET_LEN_1 = 1;
  parameter CLK_COR_INSERT_IDLE_FLAG_0 = "FALSE";
  parameter CLK_COR_INSERT_IDLE_FLAG_1 = "FALSE";
  parameter CLK_COR_KEEP_IDLE_0 = "FALSE";
  parameter CLK_COR_KEEP_IDLE_1 = "FALSE";
  parameter integer CLK_COR_MAX_LAT_0 = 20;
  parameter integer CLK_COR_MAX_LAT_1 = 20;
  parameter integer CLK_COR_MIN_LAT_0 = 18;
  parameter integer CLK_COR_MIN_LAT_1 = 18;
  parameter CLK_COR_PRECEDENCE_0 = "TRUE";
  parameter CLK_COR_PRECEDENCE_1 = "TRUE";
  parameter integer CLK_COR_REPEAT_WAIT_0 = 0;
  parameter integer CLK_COR_REPEAT_WAIT_1 = 0;
  parameter [9:0] CLK_COR_SEQ_1_1_0 = 10'b0100011100;
  parameter [9:0] CLK_COR_SEQ_1_1_1 = 10'b0100011100;
  parameter [9:0] CLK_COR_SEQ_1_2_0 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_1_2_1 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_1_3_0 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_1_3_1 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_1_4_0 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_1_4_1 = 10'b0000000000;
  parameter [3:0] CLK_COR_SEQ_1_ENABLE_0 = 4'b1111;
  parameter [3:0] CLK_COR_SEQ_1_ENABLE_1 = 4'b1111;
  parameter [9:0] CLK_COR_SEQ_2_1_0 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_2_1_1 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_2_2_0 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_2_2_1 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_2_3_0 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_2_3_1 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_2_4_0 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_2_4_1 = 10'b0000000000;
  parameter [3:0] CLK_COR_SEQ_2_ENABLE_0 = 4'b1111;
  parameter [3:0] CLK_COR_SEQ_2_ENABLE_1 = 4'b1111;
  parameter CLK_COR_SEQ_2_USE_0 = "FALSE";
  parameter CLK_COR_SEQ_2_USE_1 = "FALSE";
  parameter CLK_OUT_GTP_SEL_0 = "REFCLKPLL0";
  parameter CLK_OUT_GTP_SEL_1 = "REFCLKPLL1";
  parameter [1:0] CM_TRIM_0 = 2'b00;
  parameter [1:0] CM_TRIM_1 = 2'b00;
  parameter [9:0] COMMA_10B_ENABLE_0 = 10'b1111111111;
  parameter [9:0] COMMA_10B_ENABLE_1 = 10'b1111111111;
  parameter [3:0] COM_BURST_VAL_0 = 4'b1111;
  parameter [3:0] COM_BURST_VAL_1 = 4'b1111;
  parameter DEC_MCOMMA_DETECT_0 = "TRUE";
  parameter DEC_MCOMMA_DETECT_1 = "TRUE";
  parameter DEC_PCOMMA_DETECT_0 = "TRUE";
  parameter DEC_PCOMMA_DETECT_1 = "TRUE";
  parameter DEC_VALID_COMMA_ONLY_0 = "TRUE";
  parameter DEC_VALID_COMMA_ONLY_1 = "TRUE";
  parameter GTP_CFG_PWRUP_0 = "TRUE";
  parameter GTP_CFG_PWRUP_1 = "TRUE";
  parameter [9:0] MCOMMA_10B_VALUE_0 = 10'b1010000011;
  parameter [9:0] MCOMMA_10B_VALUE_1 = 10'b1010000011;
  parameter MCOMMA_DETECT_0 = "TRUE";
  parameter MCOMMA_DETECT_1 = "TRUE";
  parameter [2:0] OOBDETECT_THRESHOLD_0 = 3'b110;
  parameter [2:0] OOBDETECT_THRESHOLD_1 = 3'b110;
  parameter integer OOB_CLK_DIVIDER_0 = 4;
  parameter integer OOB_CLK_DIVIDER_1 = 4;
  parameter PCI_EXPRESS_MODE_0 = "FALSE";
  parameter PCI_EXPRESS_MODE_1 = "FALSE";
  parameter [9:0] PCOMMA_10B_VALUE_0 = 10'b0101111100;
  parameter [9:0] PCOMMA_10B_VALUE_1 = 10'b0101111100;
  parameter PCOMMA_DETECT_0 = "TRUE";
  parameter PCOMMA_DETECT_1 = "TRUE";
  parameter [2:0] PLLLKDET_CFG_0 = 3'b101;
  parameter [2:0] PLLLKDET_CFG_1 = 3'b101;
  parameter [23:0] PLL_COM_CFG_0 = 24'h21680A;
  parameter [23:0] PLL_COM_CFG_1 = 24'h21680A;
  parameter [7:0] PLL_CP_CFG_0 = 8'h00;
  parameter [7:0] PLL_CP_CFG_1 = 8'h00;
  parameter integer PLL_DIVSEL_FB_0 = 5;
  parameter integer PLL_DIVSEL_FB_1 = 5;
  parameter integer PLL_DIVSEL_REF_0 = 2;
  parameter integer PLL_DIVSEL_REF_1 = 2;
  parameter integer PLL_RXDIVSEL_OUT_0 = 1;
  parameter integer PLL_RXDIVSEL_OUT_1 = 1;
  parameter PLL_SATA_0 = "FALSE";
  parameter PLL_SATA_1 = "FALSE";
  parameter PLL_SOURCE_0 = "PLL0";
  parameter PLL_SOURCE_1 = "PLL0";
  parameter integer PLL_TXDIVSEL_OUT_0 = 1;
  parameter integer PLL_TXDIVSEL_OUT_1 = 1;
  parameter [26:0] PMA_CDR_SCAN_0 = 27'h6404040;
  parameter [26:0] PMA_CDR_SCAN_1 = 27'h6404040;
  parameter [35:0] PMA_COM_CFG_EAST = 36'h000008000;
  parameter [35:0] PMA_COM_CFG_WEST = 36'h000008000;
  parameter [6:0] PMA_RXSYNC_CFG_0 = 7'h00;
  parameter [6:0] PMA_RXSYNC_CFG_1 = 7'h00;
  parameter [24:0] PMA_RX_CFG_0 = 25'h05CE048;
  parameter [24:0] PMA_RX_CFG_1 = 25'h05CE048;
  parameter [19:0] PMA_TX_CFG_0 = 20'h00082;
  parameter [19:0] PMA_TX_CFG_1 = 20'h00082;
  parameter RCV_TERM_GND_0 = "FALSE";
  parameter RCV_TERM_GND_1 = "FALSE";
  parameter RCV_TERM_VTTRX_0 = "TRUE";
  parameter RCV_TERM_VTTRX_1 = "TRUE";
  parameter [7:0] RXEQ_CFG_0 = 8'b01111011;
  parameter [7:0] RXEQ_CFG_1 = 8'b01111011;
  parameter RXPRBSERR_LOOPBACK_0 = 1'b0;
  parameter RXPRBSERR_LOOPBACK_1 = 1'b0;
  parameter RX_BUFFER_USE_0 = "TRUE";
  parameter RX_BUFFER_USE_1 = "TRUE";
  parameter RX_DECODE_SEQ_MATCH_0 = "TRUE";
  parameter RX_DECODE_SEQ_MATCH_1 = "TRUE";
  parameter RX_EN_IDLE_HOLD_CDR_0 = "FALSE";
  parameter RX_EN_IDLE_HOLD_CDR_1 = "FALSE";
  parameter RX_EN_IDLE_RESET_BUF_0 = "TRUE";
  parameter RX_EN_IDLE_RESET_BUF_1 = "TRUE";
  parameter RX_EN_IDLE_RESET_FR_0 = "TRUE";
  parameter RX_EN_IDLE_RESET_FR_1 = "TRUE";
  parameter RX_EN_IDLE_RESET_PH_0 = "TRUE";
  parameter RX_EN_IDLE_RESET_PH_1 = "TRUE";
  parameter RX_EN_MODE_RESET_BUF_0 = "TRUE";
  parameter RX_EN_MODE_RESET_BUF_1 = "TRUE";
  parameter [3:0] RX_IDLE_HI_CNT_0 = 4'b1000;
  parameter [3:0] RX_IDLE_HI_CNT_1 = 4'b1000;
  parameter [3:0] RX_IDLE_LO_CNT_0 = 4'b0000;
  parameter [3:0] RX_IDLE_LO_CNT_1 = 4'b0000;
  parameter RX_LOSS_OF_SYNC_FSM_0 = "FALSE";
  parameter RX_LOSS_OF_SYNC_FSM_1 = "FALSE";
  parameter integer RX_LOS_INVALID_INCR_0 = 1;
  parameter integer RX_LOS_INVALID_INCR_1 = 1;
  parameter integer RX_LOS_THRESHOLD_0 = 4;
  parameter integer RX_LOS_THRESHOLD_1 = 4;
  parameter RX_SLIDE_MODE_0 = "PCS";
  parameter RX_SLIDE_MODE_1 = "PCS";
  parameter RX_STATUS_FMT_0 = "PCIE";
  parameter RX_STATUS_FMT_1 = "PCIE";
  parameter RX_XCLK_SEL_0 = "RXREC";
  parameter RX_XCLK_SEL_1 = "RXREC";
  parameter [2:0] SATA_BURST_VAL_0 = 3'b100;
  parameter [2:0] SATA_BURST_VAL_1 = 3'b100;
  parameter [2:0] SATA_IDLE_VAL_0 = 3'b011;
  parameter [2:0] SATA_IDLE_VAL_1 = 3'b011;
  parameter integer SATA_MAX_BURST_0 = 7;
  parameter integer SATA_MAX_BURST_1 = 7;
  parameter integer SATA_MAX_INIT_0 = 22;
  parameter integer SATA_MAX_INIT_1 = 22;
  parameter integer SATA_MAX_WAKE_0 = 7;
  parameter integer SATA_MAX_WAKE_1 = 7;
  parameter integer SATA_MIN_BURST_0 = 4;
  parameter integer SATA_MIN_BURST_1 = 4;
  parameter integer SATA_MIN_INIT_0 = 12;
  parameter integer SATA_MIN_INIT_1 = 12;
  parameter integer SATA_MIN_WAKE_0 = 4;
  parameter integer SATA_MIN_WAKE_1 = 4;
  parameter integer SIM_GTPRESET_SPEEDUP = 0;
  parameter SIM_RECEIVER_DETECT_PASS = "FALSE";
  parameter [2:0] SIM_REFCLK0_SOURCE = 3'b000;
  parameter [2:0] SIM_REFCLK1_SOURCE = 3'b000;
  parameter SIM_TX_ELEC_IDLE_LEVEL = "X";
  parameter SIM_VERSION = "2.0";
  parameter [4:0] TERMINATION_CTRL_0 = 5'b10100;
  parameter [4:0] TERMINATION_CTRL_1 = 5'b10100;
  parameter TERMINATION_OVRD_0 = "FALSE";
  parameter TERMINATION_OVRD_1 = "FALSE";
  parameter [11:0] TRANS_TIME_FROM_P2_0 = 12'h03C;
  parameter [11:0] TRANS_TIME_FROM_P2_1 = 12'h03C;
  parameter [7:0] TRANS_TIME_NON_P2_0 = 8'h19;
  parameter [7:0] TRANS_TIME_NON_P2_1 = 8'h19;
  parameter [9:0] TRANS_TIME_TO_P2_0 = 10'h064;
  parameter [9:0] TRANS_TIME_TO_P2_1 = 10'h064;
  parameter [31:0] TST_ATTR_0 = 32'h00000000;
  parameter [31:0] TST_ATTR_1 = 32'h00000000;
  parameter [2:0] TXRX_INVERT_0 = 3'b011;
  parameter [2:0] TXRX_INVERT_1 = 3'b011;
  parameter TX_BUFFER_USE_0 = "FALSE";
  parameter TX_BUFFER_USE_1 = "FALSE";
  parameter [13:0] TX_DETECT_RX_CFG_0 = 14'h1832;
  parameter [13:0] TX_DETECT_RX_CFG_1 = 14'h1832;
  parameter [2:0] TX_IDLE_DELAY_0 = 3'b011;
  parameter [2:0] TX_IDLE_DELAY_1 = 3'b011;
  parameter [1:0] TX_TDCC_CFG_0 = 2'b00;
  parameter [1:0] TX_TDCC_CFG_1 = 2'b00;
  parameter TX_XCLK_SEL_0 = "TXUSR";
  parameter TX_XCLK_SEL_1 = "TXUSR";
  

  output DRDY;
  output PHYSTATUS0;
  output PHYSTATUS1;
  output PLLLKDET0;
  output PLLLKDET1;
  output REFCLKOUT0;
  output REFCLKOUT1;
  output REFCLKPLL0;
  output REFCLKPLL1;
  output RESETDONE0;
  output RESETDONE1;
  output RXBYTEISALIGNED0;
  output RXBYTEISALIGNED1;
  output RXBYTEREALIGN0;
  output RXBYTEREALIGN1;
  output RXCHANBONDSEQ0;
  output RXCHANBONDSEQ1;
  output RXCHANISALIGNED0;
  output RXCHANISALIGNED1;
  output RXCHANREALIGN0;
  output RXCHANREALIGN1;
  output RXCOMMADET0;
  output RXCOMMADET1;
  output RXELECIDLE0;
  output RXELECIDLE1;
  output RXPRBSERR0;
  output RXPRBSERR1;
  output RXRECCLK0;
  output RXRECCLK1;
  output RXVALID0;
  output RXVALID1;
  output TXN0;
  output TXN1;
  output TXOUTCLK0;
  output TXOUTCLK1;
  output TXP0;
  output TXP1;
  output [15:0] DRPDO;
  output [1:0] GTPCLKFBEAST;
  output [1:0] GTPCLKFBWEST;
  output [1:0] GTPCLKOUT0;
  output [1:0] GTPCLKOUT1;
  output [1:0] RXLOSSOFSYNC0;
  output [1:0] RXLOSSOFSYNC1;
  output [1:0] TXBUFSTATUS0;
  output [1:0] TXBUFSTATUS1;
  output [2:0] RXBUFSTATUS0;
  output [2:0] RXBUFSTATUS1;
  output [2:0] RXCHBONDO;
  output [2:0] RXCLKCORCNT0;
  output [2:0] RXCLKCORCNT1;
  output [2:0] RXSTATUS0;
  output [2:0] RXSTATUS1;
  output [31:0] RXDATA0;
  output [31:0] RXDATA1;
  output [3:0] RXCHARISCOMMA0;
  output [3:0] RXCHARISCOMMA1;
  output [3:0] RXCHARISK0;
  output [3:0] RXCHARISK1;
  output [3:0] RXDISPERR0;
  output [3:0] RXDISPERR1;
  output [3:0] RXNOTINTABLE0;
  output [3:0] RXNOTINTABLE1;
  output [3:0] RXRUNDISP0;
  output [3:0] RXRUNDISP1;
  output [3:0] TXKERR0;
  output [3:0] TXKERR1;
  output [3:0] TXRUNDISP0;
  output [3:0] TXRUNDISP1;
  output [4:0] RCALOUTEAST;
  output [4:0] RCALOUTWEST;
  output [4:0] TSTOUT0;
  output [4:0] TSTOUT1;

  input CLK00;
  input CLK01;
  input CLK10;
  input CLK11;
  input CLKINEAST0;
  input CLKINEAST1;
  input CLKINWEST0;
  input CLKINWEST1;
  input DCLK;
  input DEN;
  input DWE;
  input GATERXELECIDLE0;
  input GATERXELECIDLE1;
  input GCLK00;
  input GCLK01;
  input GCLK10;
  input GCLK11;
  input GTPRESET0;
  input GTPRESET1;
  input IGNORESIGDET0;
  input IGNORESIGDET1;
  input INTDATAWIDTH0;
  input INTDATAWIDTH1;
  input PLLCLK00;
  input PLLCLK01;
  input PLLCLK10;
  input PLLCLK11;
  input PLLLKDETEN0;
  input PLLLKDETEN1;
  input PLLPOWERDOWN0;
  input PLLPOWERDOWN1;
  input PRBSCNTRESET0;
  input PRBSCNTRESET1;
  input REFCLKPWRDNB0;
  input REFCLKPWRDNB1;
  input RXBUFRESET0;
  input RXBUFRESET1;
  input RXCDRRESET0;
  input RXCDRRESET1;
  input RXCHBONDMASTER0;
  input RXCHBONDMASTER1;
  input RXCHBONDSLAVE0;
  input RXCHBONDSLAVE1;
  input RXCOMMADETUSE0;
  input RXCOMMADETUSE1;
  input RXDEC8B10BUSE0;
  input RXDEC8B10BUSE1;
  input RXENCHANSYNC0;
  input RXENCHANSYNC1;
  input RXENMCOMMAALIGN0;
  input RXENMCOMMAALIGN1;
  input RXENPCOMMAALIGN0;
  input RXENPCOMMAALIGN1;
  input RXENPMAPHASEALIGN0;
  input RXENPMAPHASEALIGN1;
  input RXN0;
  input RXN1;
  input RXP0;
  input RXP1;
  input RXPMASETPHASE0;
  input RXPMASETPHASE1;
  input RXPOLARITY0;
  input RXPOLARITY1;
  input RXRESET0;
  input RXRESET1;
  input RXSLIDE0;
  input RXSLIDE1;
  input RXUSRCLK0;
  input RXUSRCLK1;
  input RXUSRCLK20;
  input RXUSRCLK21;
  input TSTCLK0;
  input TSTCLK1;
  input TXCOMSTART0;
  input TXCOMSTART1;
  input TXCOMTYPE0;
  input TXCOMTYPE1;
  input TXDETECTRX0;
  input TXDETECTRX1;
  input TXELECIDLE0;
  input TXELECIDLE1;
  input TXENC8B10BUSE0;
  input TXENC8B10BUSE1;
  input TXENPMAPHASEALIGN0;
  input TXENPMAPHASEALIGN1;
  input TXINHIBIT0;
  input TXINHIBIT1;
  input TXPDOWNASYNCH0;
  input TXPDOWNASYNCH1;
  input TXPMASETPHASE0;
  input TXPMASETPHASE1;
  input TXPOLARITY0;
  input TXPOLARITY1;
  input TXPRBSFORCEERR0;
  input TXPRBSFORCEERR1;
  input TXRESET0;
  input TXRESET1;
  input TXUSRCLK0;
  input TXUSRCLK1;
  input TXUSRCLK20;
  input TXUSRCLK21;
  input USRCODEERR0;
  input USRCODEERR1;
  input [11:0] TSTIN0;
  input [11:0] TSTIN1;
  input [15:0] DI;
  input [1:0] GTPCLKFBSEL0EAST;
  input [1:0] GTPCLKFBSEL0WEST;
  input [1:0] GTPCLKFBSEL1EAST;
  input [1:0] GTPCLKFBSEL1WEST;
  input [1:0] RXDATAWIDTH0;
  input [1:0] RXDATAWIDTH1;
  input [1:0] RXEQMIX0;
  input [1:0] RXEQMIX1;
  input [1:0] RXPOWERDOWN0;
  input [1:0] RXPOWERDOWN1;
  input [1:0] TXDATAWIDTH0;
  input [1:0] TXDATAWIDTH1;
  input [1:0] TXPOWERDOWN0;
  input [1:0] TXPOWERDOWN1;
  input [2:0] LOOPBACK0;
  input [2:0] LOOPBACK1;
  input [2:0] REFSELDYPLL0;
  input [2:0] REFSELDYPLL1;
  input [2:0] RXCHBONDI;
  input [2:0] RXENPRBSTST0;
  input [2:0] RXENPRBSTST1;
  input [2:0] TXBUFDIFFCTRL0;
  input [2:0] TXBUFDIFFCTRL1;
  input [2:0] TXENPRBSTST0;
  input [2:0] TXENPRBSTST1;
  input [2:0] TXPREEMPHASIS0;
  input [2:0] TXPREEMPHASIS1;
  input [31:0] TXDATA0;
  input [31:0] TXDATA1;
  input [3:0] TXBYPASS8B10B0;
  input [3:0] TXBYPASS8B10B1;
  input [3:0] TXCHARDISPMODE0;
  input [3:0] TXCHARDISPMODE1;
  input [3:0] TXCHARDISPVAL0;
  input [3:0] TXCHARDISPVAL1;
  input [3:0] TXCHARISK0;
  input [3:0] TXCHARISK1;
  input [3:0] TXDIFFCTRL0;
  input [3:0] TXDIFFCTRL1;
  input [4:0] RCALINEAST;
  input [4:0] RCALINWEST;
  input [7:0] DADDR;
  input [7:0] GTPTEST0;
  input [7:0] GTPTEST1;

endmodule // GTPA1_DUAL
