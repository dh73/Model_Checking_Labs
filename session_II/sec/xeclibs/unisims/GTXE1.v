// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/GTXE1.v,v 1.5 2010/06/02 20:13:45 vandanad Exp $
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
// /___/   /\     Filename : GTXE1.v
// \   \  /  \    Timestamp :
//  \___\/\___\
//
// Revision:
//    04/28/09 - Initial version.
// End Revision

`timescale  1 ps / 1 ps
module GTXE1 (
  COMFINISH,
  COMINITDET,
  COMSASDET,
  COMWAKEDET,
  DFECLKDLYADJMON,
  DFEEYEDACMON,
  DFESENSCAL,
  DFETAP1MONITOR,
  DFETAP2MONITOR,
  DFETAP3MONITOR,
  DFETAP4MONITOR,
  DRDY,
  DRPDO,
  MGTREFCLKFAB,
  PHYSTATUS,
  RXBUFSTATUS,
  RXBYTEISALIGNED,
  RXBYTEREALIGN,
  RXCHANBONDSEQ,
  RXCHANISALIGNED,
  RXCHANREALIGN,
  RXCHARISCOMMA,
  RXCHARISK,
  RXCHBONDO,
  RXCLKCORCNT,
  RXCOMMADET,
  RXDATA,
  RXDATAVALID,
  RXDISPERR,
  RXDLYALIGNMONITOR,
  RXELECIDLE,
  RXHEADER,
  RXHEADERVALID,
  RXLOSSOFSYNC,
  RXNOTINTABLE,
  RXOVERSAMPLEERR,
  RXPLLLKDET,
  RXPRBSERR,
  RXRATEDONE,
  RXRECCLK,
  RXRECCLKPCS,
  RXRESETDONE,
  RXRUNDISP,
  RXSTARTOFSEQ,
  RXSTATUS,
  RXVALID,
  TSTOUT,
  TXBUFSTATUS,
  TXDLYALIGNMONITOR,
  TXGEARBOXREADY,
  TXKERR,
  TXN,
  TXOUTCLK,
  TXOUTCLKPCS,
  TXP,
  TXPLLLKDET,
  TXRATEDONE,
  TXRESETDONE,
  TXRUNDISP,
  DADDR,
  DCLK,
  DEN,
  DFECLKDLYADJ,
  DFEDLYOVRD,
  DFETAP1,
  DFETAP2,
  DFETAP3,
  DFETAP4,
  DFETAPOVRD,
  DI,
  DWE,
  GATERXELECIDLE,
  GREFCLKRX,
  GREFCLKTX,
  GTXRXRESET,
  GTXTEST,
  GTXTXRESET,
  IGNORESIGDET,
  LOOPBACK,
  MGTREFCLKRX,
  MGTREFCLKTX,
  NORTHREFCLKRX,
  NORTHREFCLKTX,
  PERFCLKRX,
  PERFCLKTX,
  PLLRXRESET,
  PLLTXRESET,
  PRBSCNTRESET,
  RXBUFRESET,
  RXCDRRESET,
  RXCHBONDI,
  RXCHBONDLEVEL,
  RXCHBONDMASTER,
  RXCHBONDSLAVE,
  RXCOMMADETUSE,
  RXDEC8B10BUSE,
  RXDLYALIGNDISABLE,
  RXDLYALIGNMONENB,	      
  RXDLYALIGNOVERRIDE,
  RXDLYALIGNRESET,
  RXDLYALIGNSWPPRECURB,
  RXDLYALIGNUPDSW,
  RXENCHANSYNC,
  RXENMCOMMAALIGN,
  RXENPCOMMAALIGN,
  RXENPMAPHASEALIGN,
  RXENPRBSTST,
  RXENSAMPLEALIGN,
  RXEQMIX,
  RXGEARBOXSLIP,
  RXN,
  RXP,
  RXPLLLKDETEN,
  RXPLLPOWERDOWN,
  RXPLLREFSELDY,
  RXPMASETPHASE,
  RXPOLARITY,
  RXPOWERDOWN,
  RXRATE,
  RXRESET,
  RXSLIDE,
  RXUSRCLK,
  RXUSRCLK2,
  SOUTHREFCLKRX,
  SOUTHREFCLKTX,
  TSTCLK0,
  TSTCLK1,
  TSTIN,
  TXBUFDIFFCTRL,
  TXBYPASS8B10B,
  TXCHARDISPMODE,
  TXCHARDISPVAL,
  TXCHARISK,
  TXCOMINIT,
  TXCOMSAS,
  TXCOMWAKE,
  TXDATA,
  TXDEEMPH,
  TXDETECTRX,
  TXDIFFCTRL,
  TXDLYALIGNDISABLE,
  TXDLYALIGNMONENB,    
  TXDLYALIGNOVERRIDE,
  TXDLYALIGNRESET,
  TXDLYALIGNUPDSW,
  TXELECIDLE,
  TXENC8B10BUSE,
  TXENPMAPHASEALIGN,
  TXENPRBSTST,
  TXHEADER,
  TXINHIBIT,
  TXMARGIN,
  TXPDOWNASYNCH,
  TXPLLLKDETEN,
  TXPLLPOWERDOWN,
  TXPLLREFSELDY,
  TXPMASETPHASE,
  TXPOLARITY,
  TXPOSTEMPHASIS,
  TXPOWERDOWN,
  TXPRBSFORCEERR,
  TXPREEMPHASIS,
  TXRATE,
  TXRESET,
  TXSEQUENCE,
  TXSTARTSEQ,
  TXSWING,
  TXUSRCLK,
  TXUSRCLK2,
  USRCODEERR
);

  parameter AC_CAP_DIS = "TRUE";
  parameter integer ALIGN_COMMA_WORD = 1;
  parameter [1:0] BGTEST_CFG = 2'b00;
  parameter [16:0] BIAS_CFG = 17'h00000;
  parameter [4:0] CDR_PH_ADJ_TIME = 5'b10100;
  parameter integer CHAN_BOND_1_MAX_SKEW = 7;
  parameter integer CHAN_BOND_2_MAX_SKEW = 1;
  parameter CHAN_BOND_KEEP_ALIGN = "FALSE";
  parameter [9:0] CHAN_BOND_SEQ_1_1 = 10'b0101111100;
  parameter [9:0] CHAN_BOND_SEQ_1_2 = 10'b0001001010;
  parameter [9:0] CHAN_BOND_SEQ_1_3 = 10'b0001001010;
  parameter [9:0] CHAN_BOND_SEQ_1_4 = 10'b0110111100;
  parameter [3:0] CHAN_BOND_SEQ_1_ENABLE = 4'b1111;
  parameter [9:0] CHAN_BOND_SEQ_2_1 = 10'b0100111100;
  parameter [9:0] CHAN_BOND_SEQ_2_2 = 10'b0100111100;
  parameter [9:0] CHAN_BOND_SEQ_2_3 = 10'b0110111100;
  parameter [9:0] CHAN_BOND_SEQ_2_4 = 10'b0100111100;
  parameter [4:0] CHAN_BOND_SEQ_2_CFG = 5'b00000;
  parameter [3:0] CHAN_BOND_SEQ_2_ENABLE = 4'b1111;
  parameter CHAN_BOND_SEQ_2_USE = "FALSE";
  parameter integer CHAN_BOND_SEQ_LEN = 1;
  parameter CLK_CORRECT_USE = "TRUE";
  parameter integer CLK_COR_ADJ_LEN = 1;
  parameter integer CLK_COR_DET_LEN = 1;
  parameter CLK_COR_INSERT_IDLE_FLAG = "FALSE";
  parameter CLK_COR_KEEP_IDLE = "FALSE";
  parameter integer CLK_COR_MAX_LAT = 20;
  parameter integer CLK_COR_MIN_LAT = 18;
  parameter CLK_COR_PRECEDENCE = "TRUE";
  parameter integer CLK_COR_REPEAT_WAIT = 0;
  parameter [9:0] CLK_COR_SEQ_1_1 = 10'b0100011100;
  parameter [9:0] CLK_COR_SEQ_1_2 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_1_3 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_1_4 = 10'b0000000000;
  parameter [3:0] CLK_COR_SEQ_1_ENABLE = 4'b1111;
  parameter [9:0] CLK_COR_SEQ_2_1 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_2_2 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_2_3 = 10'b0000000000;
  parameter [9:0] CLK_COR_SEQ_2_4 = 10'b0000000000;
  parameter [3:0] CLK_COR_SEQ_2_ENABLE = 4'b1111;
  parameter CLK_COR_SEQ_2_USE = "FALSE";
  parameter [1:0] CM_TRIM = 2'b01;
  parameter [9:0] COMMA_10B_ENABLE = 10'b1111111111;
  parameter COMMA_DOUBLE = "FALSE";
  parameter [3:0] COM_BURST_VAL = 4'b1111;
  parameter DEC_MCOMMA_DETECT = "TRUE";
  parameter DEC_PCOMMA_DETECT = "TRUE";
  parameter DEC_VALID_COMMA_ONLY = "TRUE";
  parameter [4:0] DFE_CAL_TIME = 5'b01100;
  parameter [7:0] DFE_CFG = 8'b00011011;
  parameter [2:0] GEARBOX_ENDEC = 3'b000;
  parameter GEN_RXUSRCLK = "TRUE";
  parameter GEN_TXUSRCLK = "TRUE";
  parameter GTX_CFG_PWRUP = "TRUE";
  parameter [9:0] MCOMMA_10B_VALUE = 10'b1010000011;
  parameter MCOMMA_DETECT = "TRUE";
  parameter [2:0] OOBDETECT_THRESHOLD = 3'b011;
  parameter PCI_EXPRESS_MODE = "FALSE";
  parameter [9:0] PCOMMA_10B_VALUE = 10'b0101111100;
  parameter PCOMMA_DETECT = "TRUE";
  parameter PMA_CAS_CLK_EN = "FALSE";
  parameter [26:0] PMA_CDR_SCAN = 27'h640404C;
  parameter [75:0] PMA_CFG = 76'h0040000040000000003;
  parameter [6:0] PMA_RXSYNC_CFG = 7'h00;
  parameter [24:0] PMA_RX_CFG = 25'h05CE048;
  parameter [19:0] PMA_TX_CFG = 20'h00082;
  parameter [9:0] POWER_SAVE = 10'b0000110100;
  parameter RCV_TERM_GND = "FALSE";
  parameter RCV_TERM_VTTRX = "TRUE";
  parameter RXGEARBOX_USE = "FALSE";
  parameter [23:0] RXPLL_COM_CFG = 24'h21680A;
  parameter [7:0] RXPLL_CP_CFG = 8'h00;
  parameter integer RXPLL_DIVSEL45_FB = 5;
  parameter integer RXPLL_DIVSEL_FB = 2;
  parameter integer RXPLL_DIVSEL_OUT = 1;
  parameter integer RXPLL_DIVSEL_REF = 1;
  parameter [2:0] RXPLL_LKDET_CFG = 3'b111;
  parameter [0:0] RXPRBSERR_LOOPBACK = 1'b0;
  parameter RXRECCLK_CTRL = "RXRECCLKPCS";
  parameter [9:0] RXRECCLK_DLY = 10'b0000000000;
  parameter [15:0] RXUSRCLK_DLY = 16'h0000;
  parameter RX_BUFFER_USE = "TRUE";
  parameter integer RX_CLK25_DIVIDER = 6;
  parameter integer RX_DATA_WIDTH = 20;
  parameter RX_DECODE_SEQ_MATCH = "TRUE";
  parameter [3:0] RX_DLYALIGN_CTRINC = 4'b0100;
  parameter [4:0] RX_DLYALIGN_EDGESET = 5'b00110;
  parameter [3:0] RX_DLYALIGN_LPFINC = 4'b0111;
  parameter [2:0] RX_DLYALIGN_MONSEL = 3'b000;
  parameter [7:0] RX_DLYALIGN_OVRDSETTING = 8'b00000000;
  parameter RX_EN_IDLE_HOLD_CDR = "FALSE";
  parameter RX_EN_IDLE_HOLD_DFE = "TRUE";
  parameter RX_EN_IDLE_RESET_BUF = "TRUE";
  parameter RX_EN_IDLE_RESET_FR = "TRUE";
  parameter RX_EN_IDLE_RESET_PH = "TRUE";
  parameter RX_EN_MODE_RESET_BUF = "TRUE";
  parameter RX_EN_RATE_RESET_BUF = "TRUE";
  parameter RX_EN_REALIGN_RESET_BUF = "FALSE";
  parameter RX_EN_REALIGN_RESET_BUF2 = "FALSE";
  parameter [7:0] RX_EYE_OFFSET = 8'h4C;
  parameter [1:0] RX_EYE_SCANMODE = 2'b00;
  parameter RX_FIFO_ADDR_MODE = "FULL";
  parameter [3:0] RX_IDLE_HI_CNT = 4'b1000;
  parameter [3:0] RX_IDLE_LO_CNT = 4'b0000;
  parameter RX_LOSS_OF_SYNC_FSM = "FALSE";
  parameter integer RX_LOS_INVALID_INCR = 1;
  parameter integer RX_LOS_THRESHOLD = 4;
  parameter RX_OVERSAMPLE_MODE = "FALSE";
  parameter integer RX_SLIDE_AUTO_WAIT = 5;
  parameter RX_SLIDE_MODE = "OFF";
  parameter RX_XCLK_SEL = "RXREC";
  parameter integer SAS_MAX_COMSAS = 52;
  parameter integer SAS_MIN_COMSAS = 40;
  parameter [2:0] SATA_BURST_VAL = 3'b100;
  parameter [2:0] SATA_IDLE_VAL = 3'b100;
  parameter integer SATA_MAX_BURST = 7;
  parameter integer SATA_MAX_INIT = 22;
  parameter integer SATA_MAX_WAKE = 7;
  parameter integer SATA_MIN_BURST = 4;
  parameter integer SATA_MIN_INIT = 12;
  parameter integer SATA_MIN_WAKE = 4;
  parameter SHOW_REALIGN_COMMA = "TRUE";
  parameter integer SIM_GTXRESET_SPEEDUP = 1;
  parameter SIM_RECEIVER_DETECT_PASS = "TRUE";
  parameter [2:0] SIM_RXREFCLK_SOURCE = 3'b000;
  parameter [2:0] SIM_TXREFCLK_SOURCE = 3'b000;
  parameter SIM_TX_ELEC_IDLE_LEVEL = "X";
  parameter SIM_VERSION = "2.0";
  parameter [4:0] TERMINATION_CTRL = 5'b10100;
  parameter TERMINATION_OVRD = "FALSE";
  parameter [11:0] TRANS_TIME_FROM_P2 = 12'h03C;
  parameter [7:0] TRANS_TIME_NON_P2 = 8'h19;
  parameter [7:0] TRANS_TIME_RATE = 8'h0E;
  parameter [9:0] TRANS_TIME_TO_P2 = 10'h064;
  parameter [31:0] TST_ATTR = 32'h00000000;
  parameter TXDRIVE_LOOPBACK_HIZ = "FALSE";
  parameter TXDRIVE_LOOPBACK_PD = "FALSE";
  parameter TXGEARBOX_USE = "FALSE";
  parameter TXOUTCLK_CTRL = "TXOUTCLKPCS";
  parameter [9:0] TXOUTCLK_DLY = 10'b0000000000;
  parameter [23:0] TXPLL_COM_CFG = 24'h21680A;
  parameter [7:0] TXPLL_CP_CFG = 8'h00;
  parameter integer TXPLL_DIVSEL45_FB = 5;
  parameter integer TXPLL_DIVSEL_FB = 2;
  parameter integer TXPLL_DIVSEL_OUT = 1;
  parameter integer TXPLL_DIVSEL_REF = 1;
  parameter [2:0] TXPLL_LKDET_CFG = 3'b111;
  parameter [1:0] TXPLL_SATA = 2'b00;
  parameter TX_BUFFER_USE = "TRUE";
  parameter [5:0] TX_BYTECLK_CFG = 6'h00;
  parameter integer TX_CLK25_DIVIDER = 6;
  parameter TX_CLK_SOURCE = "RXPLL";
  parameter integer TX_DATA_WIDTH = 20;
  parameter [4:0] TX_DEEMPH_0 = 5'b11010;
  parameter [4:0] TX_DEEMPH_1 = 5'b10000;
  parameter [13:0] TX_DETECT_RX_CFG = 14'h1832;
  parameter [3:0] TX_DLYALIGN_CTRINC = 4'b0100;
  parameter [3:0] TX_DLYALIGN_LPFINC = 4'b0110;
  parameter [2:0] TX_DLYALIGN_MONSEL = 3'b000;
  parameter [7:0] TX_DLYALIGN_OVRDSETTING = 8'b10000000;
  parameter TX_DRIVE_MODE = "DIRECT";
  parameter TX_EN_RATE_RESET_BUF = "TRUE";
  parameter [2:0] TX_IDLE_ASSERT_DELAY = 3'b100;
  parameter [2:0] TX_IDLE_DEASSERT_DELAY = 3'b010;
  parameter [6:0] TX_MARGIN_FULL_0 = 7'b1001110;
  parameter [6:0] TX_MARGIN_FULL_1 = 7'b1001001;
  parameter [6:0] TX_MARGIN_FULL_2 = 7'b1000101;
  parameter [6:0] TX_MARGIN_FULL_3 = 7'b1000010;
  parameter [6:0] TX_MARGIN_FULL_4 = 7'b1000000;
  parameter [6:0] TX_MARGIN_LOW_0 = 7'b1000110;
  parameter [6:0] TX_MARGIN_LOW_1 = 7'b1000100;
  parameter [6:0] TX_MARGIN_LOW_2 = 7'b1000010;
  parameter [6:0] TX_MARGIN_LOW_3 = 7'b1000000;
  parameter [6:0] TX_MARGIN_LOW_4 = 7'b1000000;
  parameter TX_OVERSAMPLE_MODE = "FALSE";
  parameter [0:0] TX_PMADATA_OPT = 1'b0;
  parameter [1:0] TX_TDCC_CFG = 2'b11;
  parameter [5:0] TX_USRCLK_CFG = 6'h00;
  parameter TX_XCLK_SEL = "TXUSR";
  

  output COMFINISH;
  output COMINITDET;
  output COMSASDET;
  output COMWAKEDET;
  output DRDY;
  output PHYSTATUS;
  output RXBYTEISALIGNED;
  output RXBYTEREALIGN;
  output RXCHANBONDSEQ;
  output RXCHANISALIGNED;
  output RXCHANREALIGN;
  output RXCOMMADET;
  output RXDATAVALID;
  output RXELECIDLE;
  output RXHEADERVALID;
  output RXOVERSAMPLEERR;
  output RXPLLLKDET;
  output RXPRBSERR;
  output RXRATEDONE;
  output RXRECCLK;
  output RXRECCLKPCS;
  output RXRESETDONE;
  output RXSTARTOFSEQ;
  output RXVALID;
  output TXGEARBOXREADY;
  output TXN;
  output TXOUTCLK;
  output TXOUTCLKPCS;
  output TXP;
  output TXPLLLKDET;
  output TXRATEDONE;
  output TXRESETDONE;
  output [15:0] DRPDO;
  output [1:0] MGTREFCLKFAB;
  output [1:0] RXLOSSOFSYNC;
  output [1:0] TXBUFSTATUS;
  output [2:0] DFESENSCAL;
  output [2:0] RXBUFSTATUS;
  output [2:0] RXCLKCORCNT;
  output [2:0] RXHEADER;
  output [2:0] RXSTATUS;
  output [31:0] RXDATA;
  output [3:0] DFETAP3MONITOR;
  output [3:0] DFETAP4MONITOR;
  output [3:0] RXCHARISCOMMA;
  output [3:0] RXCHARISK;
  output [3:0] RXCHBONDO;
  output [3:0] RXDISPERR;
  output [3:0] RXNOTINTABLE;
  output [3:0] RXRUNDISP;
  output [3:0] TXKERR;
  output [3:0] TXRUNDISP;
  output [4:0] DFEEYEDACMON;
  output [4:0] DFETAP1MONITOR;
  output [4:0] DFETAP2MONITOR;
  output [5:0] DFECLKDLYADJMON;
  output [7:0] RXDLYALIGNMONITOR;
  output [7:0] TXDLYALIGNMONITOR;
  output [9:0] TSTOUT;

  input DCLK;
  input DEN;
  input DFEDLYOVRD;
  input DFETAPOVRD;
  input DWE;
  input GATERXELECIDLE;
  input GREFCLKRX;
  input GREFCLKTX;
  input GTXRXRESET;
  input GTXTXRESET;
  input IGNORESIGDET;
  input PERFCLKRX;
  input PERFCLKTX;
  input PLLRXRESET;
  input PLLTXRESET;
  input PRBSCNTRESET;
  input RXBUFRESET;
  input RXCDRRESET;
  input RXCHBONDMASTER;
  input RXCHBONDSLAVE;
  input RXCOMMADETUSE;
  input RXDEC8B10BUSE;
  input RXDLYALIGNDISABLE;
  input RXDLYALIGNMONENB;
  input RXDLYALIGNOVERRIDE;
  input RXDLYALIGNRESET;
  input RXDLYALIGNSWPPRECURB;
  input RXDLYALIGNUPDSW;
  input RXENCHANSYNC;
  input RXENMCOMMAALIGN;
  input RXENPCOMMAALIGN;
  input RXENPMAPHASEALIGN;
  input RXENSAMPLEALIGN;
  input RXGEARBOXSLIP;
  input RXN;
  input RXP;
  input RXPLLLKDETEN;
  input RXPLLPOWERDOWN;
  input RXPMASETPHASE;
  input RXPOLARITY;
  input RXRESET;
  input RXSLIDE;
  input RXUSRCLK2;
  input RXUSRCLK;
  input TSTCLK0;
  input TSTCLK1;
  input TXCOMINIT;
  input TXCOMSAS;
  input TXCOMWAKE;
  input TXDEEMPH;
  input TXDETECTRX;
  input TXDLYALIGNDISABLE;
  input TXDLYALIGNMONENB;
  input TXDLYALIGNOVERRIDE;
  input TXDLYALIGNRESET;
  input TXDLYALIGNUPDSW;
  input TXELECIDLE;
  input TXENC8B10BUSE;
  input TXENPMAPHASEALIGN;
  input TXINHIBIT;
  input TXPDOWNASYNCH;
  input TXPLLLKDETEN;
  input TXPLLPOWERDOWN;
  input TXPMASETPHASE;
  input TXPOLARITY;
  input TXPRBSFORCEERR;
  input TXRESET;
  input TXSTARTSEQ;
  input TXSWING;
  input TXUSRCLK2;
  input TXUSRCLK;
  input USRCODEERR;
  input [12:0] GTXTEST;
  input [15:0] DI;
  input [19:0] TSTIN;
  input [1:0] MGTREFCLKRX;
  input [1:0] MGTREFCLKTX;
  input [1:0] NORTHREFCLKRX;
  input [1:0] NORTHREFCLKTX;
  input [1:0] RXPOWERDOWN;
  input [1:0] RXRATE;
  input [1:0] SOUTHREFCLKRX;
  input [1:0] SOUTHREFCLKTX;
  input [1:0] TXPOWERDOWN;
  input [1:0] TXRATE;
  input [2:0] LOOPBACK;
  input [2:0] RXCHBONDLEVEL;
  input [2:0] RXENPRBSTST;
  input [2:0] RXPLLREFSELDY;
  input [2:0] TXBUFDIFFCTRL;
  input [2:0] TXENPRBSTST;
  input [2:0] TXHEADER;
  input [2:0] TXMARGIN;
  input [2:0] TXPLLREFSELDY;
  input [31:0] TXDATA;
  input [3:0] DFETAP3;
  input [3:0] DFETAP4;
  input [3:0] RXCHBONDI;
  input [3:0] TXBYPASS8B10B;
  input [3:0] TXCHARDISPMODE;
  input [3:0] TXCHARDISPVAL;
  input [3:0] TXCHARISK;
  input [3:0] TXDIFFCTRL;
  input [3:0] TXPREEMPHASIS;
  input [4:0] DFETAP1;
  input [4:0] DFETAP2;
  input [4:0] TXPOSTEMPHASIS;
  input [5:0] DFECLKDLYADJ;
  input [6:0] TXSEQUENCE;
  input [7:0] DADDR;
  input [9:0] RXEQMIX;

 endmodule
