///////////////////////////////////////////////////////////
//  Copyright (c) 1995/2006 Xilinx Inc.
//  All Right Reserved.
///////////////////////////////////////////////////////////
//
//   ____   ___
//  /   /\/   / 
// /___/  \  /    Vendor      : Xilinx 
// \  \    \/     Version : 10.1
//  \  \          Description : Xilinx Formal Library Component
//  /  /                        Multi-Gigabit Transceiver
// /__/   /\      Filename    : GTP_DUAL.v
// \  \  /  \     Timestamp   : Mon Nov 12 2007    
//  \__\/\__ \                    
//                                 
//  Revision:
//    11/12/07 - Initial version.
//  End Revision
///////////////////////////////////////////////////////////

`timescale 1 ps / 1 ps 

module GTP_DUAL (
	DO,
	DRDY,
	PHYSTATUS0,
	PHYSTATUS1,
	PLLLKDET,
	REFCLKOUT,
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
	RXCHBONDO0,
	RXCHBONDO1,
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
	RXOVERSAMPLEERR0,
	RXOVERSAMPLEERR1,
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

	CLKIN,
	DADDR,
	DCLK,
	DEN,
	DI,
	DWE,
	GTPRESET,
	GTPTEST,
	INTDATAWIDTH,
	LOOPBACK0,
	LOOPBACK1,
	PLLLKDETEN,
	PLLPOWERDOWN,
	PRBSCNTRESET0,
	PRBSCNTRESET1,
	REFCLKPWRDNB,
	RXBUFRESET0,
	RXBUFRESET1,
	RXCDRRESET0,
	RXCDRRESET1,
	RXCHBONDI0,
	RXCHBONDI1,
	RXCOMMADETUSE0,
	RXCOMMADETUSE1,
	RXDATAWIDTH0,
	RXDATAWIDTH1,
	RXDEC8B10BUSE0,
	RXDEC8B10BUSE1,
	RXELECIDLERESET0,
	RXELECIDLERESET1,	 
	RXENCHANSYNC0,
	RXENCHANSYNC1,
        RXENELECIDLERESETB,	 
	RXENEQB0,
	RXENEQB1,
	RXENMCOMMAALIGN0,
	RXENMCOMMAALIGN1,
	RXENPCOMMAALIGN0,
	RXENPCOMMAALIGN1,
	RXENPRBSTST0,
	RXENPRBSTST1,
	RXENSAMPLEALIGN0,
	RXENSAMPLEALIGN1,
	RXEQMIX0,
	RXEQMIX1,
	RXEQPOLE0,
	RXEQPOLE1,
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
	TXENPMAPHASEALIGN,
	TXENPRBSTST0,
	TXENPRBSTST1,
	TXINHIBIT0,
	TXINHIBIT1,
	TXPMASETPHASE,
	TXPOLARITY0,
	TXPOLARITY1,
	TXPOWERDOWN0,
	TXPOWERDOWN1,
	TXPREEMPHASIS0,
	TXPREEMPHASIS1,
	TXRESET0,
	TXRESET1,
	TXUSRCLK0,
	TXUSRCLK1,
	TXUSRCLK20,
	TXUSRCLK21

);

parameter AC_CAP_DIS_0 = "TRUE";
parameter AC_CAP_DIS_1 = "TRUE";
parameter CHAN_BOND_MODE_0 = "OFF";
parameter CHAN_BOND_MODE_1 = "OFF";
parameter CHAN_BOND_SEQ_2_USE_0 = "TRUE";
parameter CHAN_BOND_SEQ_2_USE_1 = "TRUE";
parameter CLKINDC_B = "TRUE";
parameter CLK_CORRECT_USE_0 = "TRUE";
parameter CLK_CORRECT_USE_1 = "TRUE";
parameter CLK_COR_INSERT_IDLE_FLAG_0 = "FALSE";
parameter CLK_COR_INSERT_IDLE_FLAG_1 = "FALSE";
parameter CLK_COR_KEEP_IDLE_0 = "FALSE";
parameter CLK_COR_KEEP_IDLE_1 = "FALSE";
parameter CLK_COR_PRECEDENCE_0 = "TRUE";
parameter CLK_COR_PRECEDENCE_1 = "TRUE";
parameter CLK_COR_SEQ_2_USE_0 = "FALSE";
parameter CLK_COR_SEQ_2_USE_1 = "FALSE";
parameter COMMA_DOUBLE_0 = "FALSE";
parameter COMMA_DOUBLE_1 = "FALSE";
parameter DEC_MCOMMA_DETECT_0 = "TRUE";
parameter DEC_MCOMMA_DETECT_1 = "TRUE";
parameter DEC_PCOMMA_DETECT_0 = "TRUE";
parameter DEC_PCOMMA_DETECT_1 = "TRUE";
parameter DEC_VALID_COMMA_ONLY_0 = "TRUE";
parameter DEC_VALID_COMMA_ONLY_1 = "TRUE";
parameter MCOMMA_DETECT_0 = "TRUE";
parameter MCOMMA_DETECT_1 = "TRUE";
parameter OVERSAMPLE_MODE = "FALSE";
parameter PCI_EXPRESS_MODE_0 = "TRUE";
parameter PCI_EXPRESS_MODE_1 = "TRUE";
parameter PCOMMA_DETECT_0 = "TRUE";
parameter PCOMMA_DETECT_1 = "TRUE";
parameter PLL_SATA_0 = "FALSE";
parameter PLL_SATA_1 = "FALSE";
parameter RCV_TERM_GND_0 = "TRUE";
parameter RCV_TERM_GND_1 = "TRUE";
parameter RCV_TERM_MID_0 = "FALSE";
parameter RCV_TERM_MID_1 = "FALSE";
parameter RCV_TERM_VTTRX_0 = "FALSE";
parameter RCV_TERM_VTTRX_1 = "FALSE";
parameter RX_BUFFER_USE_0 = "TRUE";
parameter RX_BUFFER_USE_1 = "TRUE";
parameter RX_DECODE_SEQ_MATCH_0 = "TRUE";
parameter RX_DECODE_SEQ_MATCH_1 = "TRUE";
parameter RX_LOSS_OF_SYNC_FSM_0 = "FALSE";
parameter RX_LOSS_OF_SYNC_FSM_1 = "FALSE";
parameter RX_SLIDE_MODE_0 = "PCS";
parameter RX_SLIDE_MODE_1 = "PCS";
parameter RX_STATUS_FMT_0 = "PCIE";
parameter RX_STATUS_FMT_1 = "PCIE";
parameter RX_XCLK_SEL_0 = "RXREC";
parameter RX_XCLK_SEL_1 = "RXREC";
parameter SIM_PLL_PERDIV2 = 9'h190;
parameter SIM_RECEIVER_DETECT_PASS0 = "FALSE";
parameter SIM_RECEIVER_DETECT_PASS1 = "FALSE";
parameter TERMINATION_OVRD = "FALSE";
parameter TX_BUFFER_USE_0 = "TRUE";
parameter TX_BUFFER_USE_1 = "TRUE";
parameter TX_DIFF_BOOST_0 = "TRUE";
parameter TX_DIFF_BOOST_1 = "TRUE";
parameter TX_XCLK_SEL_0 = "TXUSR";
parameter TX_XCLK_SEL_1 = "TXUSR";
parameter [15:0] TRANS_TIME_FROM_P2_0 = 16'h003c;
parameter [15:0] TRANS_TIME_FROM_P2_1 = 16'h003c;
parameter [15:0] TRANS_TIME_NON_P2_0 = 16'h0019;
parameter [15:0] TRANS_TIME_NON_P2_1 = 16'h0019;
parameter [15:0] TRANS_TIME_TO_P2_0 = 16'h0064;
parameter [15:0] TRANS_TIME_TO_P2_1 = 16'h0064;
parameter [24:0] PMA_RX_CFG_0 = 25'h09f0089;
parameter [24:0] PMA_RX_CFG_1 = 25'h09f0089;
parameter [26:0] PMA_CDR_SCAN_0 = 27'h6c07640;
parameter [26:0] PMA_CDR_SCAN_1 = 27'h6c07640;
parameter [27:0] PCS_COM_CFG = 28'h1680a0e;
parameter [2:0] OOBDETECT_THRESHOLD_0 = 3'b001;
parameter [2:0] OOBDETECT_THRESHOLD_1 = 3'b001;
parameter [2:0] SATA_BURST_VAL_0 = 3'b100;
parameter [2:0] SATA_BURST_VAL_1 = 3'b100;
parameter [2:0] SATA_IDLE_VAL_0 = 3'b011;
parameter [2:0] SATA_IDLE_VAL_1 = 3'b011;
parameter [31:0] PRBS_ERR_THRESHOLD_0 = 32'h1;
parameter [31:0] PRBS_ERR_THRESHOLD_1 = 32'h1;
parameter [3:0] CHAN_BOND_SEQ_1_ENABLE_0 = 4'b1111;
parameter [3:0] CHAN_BOND_SEQ_1_ENABLE_1 = 4'b1111;
parameter [3:0] CHAN_BOND_SEQ_2_ENABLE_0 = 4'b1111;
parameter [3:0] CHAN_BOND_SEQ_2_ENABLE_1 = 4'b1111;
parameter [3:0] CLK_COR_SEQ_1_ENABLE_0 = 4'b1111;
parameter [3:0] CLK_COR_SEQ_1_ENABLE_1 = 4'b1111;
parameter [3:0] CLK_COR_SEQ_2_ENABLE_0 = 4'b1111;
parameter [3:0] CLK_COR_SEQ_2_ENABLE_1 = 4'b1111;
parameter [3:0] COM_BURST_VAL_0 = 4'b1111;
parameter [3:0] COM_BURST_VAL_1 = 4'b1111;
parameter [4:0] TERMINATION_CTRL = 5'b10100;
parameter [4:0] TXRX_INVERT_0 = 5'b00000;
parameter [4:0] TXRX_INVERT_1 = 5'b00000;
parameter [9:0] CHAN_BOND_SEQ_1_1_0 = 10'b0001001010;
parameter [9:0] CHAN_BOND_SEQ_1_1_1 = 10'b0001001010;
parameter [9:0] CHAN_BOND_SEQ_1_2_0 = 10'b0001001010;
parameter [9:0] CHAN_BOND_SEQ_1_2_1 = 10'b0001001010;
parameter [9:0] CHAN_BOND_SEQ_1_3_0 = 10'b0001001010;
parameter [9:0] CHAN_BOND_SEQ_1_3_1 = 10'b0001001010;
parameter [9:0] CHAN_BOND_SEQ_1_4_0 = 10'b0110111100;
parameter [9:0] CHAN_BOND_SEQ_1_4_1 = 10'b0110111100;
parameter [9:0] CHAN_BOND_SEQ_2_1_0 = 10'b0110111100;
parameter [9:0] CHAN_BOND_SEQ_2_1_1 = 10'b0110111100;
parameter [9:0] CHAN_BOND_SEQ_2_2_0 = 10'b0100111100;
parameter [9:0] CHAN_BOND_SEQ_2_2_1 = 10'b0100111100;
parameter [9:0] CHAN_BOND_SEQ_2_3_0 = 10'b0100111100;
parameter [9:0] CHAN_BOND_SEQ_2_3_1 = 10'b0100111100;
parameter [9:0] CHAN_BOND_SEQ_2_4_0 = 10'b0100111100;
parameter [9:0] CHAN_BOND_SEQ_2_4_1 = 10'b0100111100;
parameter [9:0] CLK_COR_SEQ_1_1_0 = 10'b0100011100;
parameter [9:0] CLK_COR_SEQ_1_1_1 = 10'b0100011100;
parameter [9:0] CLK_COR_SEQ_1_2_0 = 10'b0;
parameter [9:0] CLK_COR_SEQ_1_2_1 = 10'b0;
parameter [9:0] CLK_COR_SEQ_1_3_0 = 10'b0;
parameter [9:0] CLK_COR_SEQ_1_3_1 = 10'b0;
parameter [9:0] CLK_COR_SEQ_1_4_0 = 10'b0;
parameter [9:0] CLK_COR_SEQ_1_4_1 = 10'b0;
parameter [9:0] CLK_COR_SEQ_2_1_0 = 10'b0;
parameter [9:0] CLK_COR_SEQ_2_1_1 = 10'b0;
parameter [9:0] CLK_COR_SEQ_2_2_0 = 10'b0;
parameter [9:0] CLK_COR_SEQ_2_2_1 = 10'b0;
parameter [9:0] CLK_COR_SEQ_2_3_0 = 10'b0;
parameter [9:0] CLK_COR_SEQ_2_3_1 = 10'b0;
parameter [9:0] CLK_COR_SEQ_2_4_0 = 10'b0;
parameter [9:0] CLK_COR_SEQ_2_4_1 = 10'b0;
parameter [9:0] COMMA_10B_ENABLE_0 = 10'b1111111111;
parameter [9:0] COMMA_10B_ENABLE_1 = 10'b1111111111;
parameter [9:0] MCOMMA_10B_VALUE_0 = 10'b1010000011;
parameter [9:0] MCOMMA_10B_VALUE_1 = 10'b1010000011;
parameter [9:0] PCOMMA_10B_VALUE_0 = 10'b0101111100;
parameter [9:0] PCOMMA_10B_VALUE_1 = 10'b0101111100;
parameter ALIGN_COMMA_WORD_0 = 1;
parameter ALIGN_COMMA_WORD_1 = 1;
parameter CHAN_BOND_1_MAX_SKEW_0 = 7;
parameter CHAN_BOND_1_MAX_SKEW_1 = 7;
parameter CHAN_BOND_2_MAX_SKEW_0 = 1;
parameter CHAN_BOND_2_MAX_SKEW_1 = 1;
parameter CHAN_BOND_LEVEL_0 = 0;
parameter CHAN_BOND_LEVEL_1 = 0;
parameter CHAN_BOND_SEQ_LEN_0 = 4;
parameter CHAN_BOND_SEQ_LEN_1 = 4;
parameter CLK25_DIVIDER = 4;
parameter CLK_COR_ADJ_LEN_0 = 1;
parameter CLK_COR_ADJ_LEN_1 = 1;
parameter CLK_COR_DET_LEN_0 = 1;
parameter CLK_COR_DET_LEN_1 = 1;
parameter CLK_COR_MAX_LAT_0 = 18;
parameter CLK_COR_MAX_LAT_1 = 18;
parameter CLK_COR_MIN_LAT_0 = 16;
parameter CLK_COR_MIN_LAT_1 = 16;
parameter CLK_COR_REPEAT_WAIT_0 = 5;
parameter CLK_COR_REPEAT_WAIT_1 = 5;
parameter OOB_CLK_DIVIDER = 4;
parameter PLL_DIVSEL_FB = 5;
parameter PLL_DIVSEL_REF = 2;
parameter PLL_RXDIVSEL_OUT_0 = 1;
parameter PLL_RXDIVSEL_OUT_1 = 1;
parameter PLL_TXDIVSEL_COMM_OUT = 1;
parameter PLL_TXDIVSEL_OUT_0 = 1;
parameter PLL_TXDIVSEL_OUT_1 = 1;
parameter RX_LOS_INVALID_INCR_0 = 8;
parameter RX_LOS_INVALID_INCR_1 = 8;
parameter RX_LOS_THRESHOLD_0 = 128;
parameter RX_LOS_THRESHOLD_1 = 128;
parameter SATA_MAX_BURST_0 = 7;
parameter SATA_MAX_BURST_1 = 7;
parameter SATA_MAX_INIT_0 = 22;
parameter SATA_MAX_INIT_1 = 22;
parameter SATA_MAX_WAKE_0 = 7;
parameter SATA_MAX_WAKE_1 = 7;
parameter SATA_MIN_BURST_0 = 4;
parameter SATA_MIN_BURST_1 = 4;
parameter SATA_MIN_INIT_0 = 12;
parameter SATA_MIN_INIT_1 = 12;
parameter SATA_MIN_WAKE_0 = 4;
parameter SATA_MIN_WAKE_1 = 4;
parameter SIM_GTPRESET_SPEEDUP = 0;
parameter TERMINATION_IMP_0 = 50;
parameter TERMINATION_IMP_1 = 50;
parameter TX_SYNC_FILTERB = 1;

output DRDY;
output PHYSTATUS0;
output PHYSTATUS1;
output PLLLKDET;
output REFCLKOUT;
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
output RXOVERSAMPLEERR0;
output RXOVERSAMPLEERR1;
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
output [15:0] DO;
output [15:0] RXDATA0;
output [15:0] RXDATA1;
output [1:0] RXCHARISCOMMA0;
output [1:0] RXCHARISCOMMA1;
output [1:0] RXCHARISK0;
output [1:0] RXCHARISK1;
output [1:0] RXDISPERR0;
output [1:0] RXDISPERR1;
output [1:0] RXLOSSOFSYNC0;
output [1:0] RXLOSSOFSYNC1;
output [1:0] RXNOTINTABLE0;
output [1:0] RXNOTINTABLE1;
output [1:0] RXRUNDISP0;
output [1:0] RXRUNDISP1;
output [1:0] TXBUFSTATUS0;
output [1:0] TXBUFSTATUS1;
output [1:0] TXKERR0;
output [1:0] TXKERR1;
output [1:0] TXRUNDISP0;
output [1:0] TXRUNDISP1;
output [2:0] RXBUFSTATUS0;
output [2:0] RXBUFSTATUS1;
output [2:0] RXCHBONDO0;
output [2:0] RXCHBONDO1;
output [2:0] RXCLKCORCNT0;
output [2:0] RXCLKCORCNT1;
output [2:0] RXSTATUS0;
output [2:0] RXSTATUS1;

input CLKIN;
input DCLK;
input DEN;
input DWE;
input GTPRESET;
input INTDATAWIDTH;
input PLLLKDETEN;
input PLLPOWERDOWN;
input PRBSCNTRESET0;
input PRBSCNTRESET1;
input REFCLKPWRDNB;
input RXBUFRESET0;
input RXBUFRESET1;
input RXCDRRESET0;
input RXCDRRESET1;
input RXCOMMADETUSE0;
input RXCOMMADETUSE1;
input RXDATAWIDTH0;
input RXDATAWIDTH1;
input RXDEC8B10BUSE0;
input RXDEC8B10BUSE1;
input RXELECIDLERESET0;
input RXELECIDLERESET1;
input RXENCHANSYNC0;
input RXENCHANSYNC1;
input RXENELECIDLERESETB;
input RXENEQB0;
input RXENEQB1;
input RXENMCOMMAALIGN0;
input RXENMCOMMAALIGN1;
input RXENPCOMMAALIGN0;
input RXENPCOMMAALIGN1;
input RXENSAMPLEALIGN0;
input RXENSAMPLEALIGN1;
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
input TXCOMSTART0;
input TXCOMSTART1;
input TXCOMTYPE0;
input TXCOMTYPE1;
input TXDATAWIDTH0;
input TXDATAWIDTH1;
input TXDETECTRX0;
input TXDETECTRX1;
input TXELECIDLE0;
input TXELECIDLE1;
input TXENC8B10BUSE0;
input TXENC8B10BUSE1;
input TXENPMAPHASEALIGN;
input TXINHIBIT0;
input TXINHIBIT1;
input TXPMASETPHASE;
input TXPOLARITY0;
input TXPOLARITY1;
input TXRESET0;
input TXRESET1;
input TXUSRCLK0;
input TXUSRCLK1;
input TXUSRCLK20;
input TXUSRCLK21;
input [15:0] DI;
input [15:0] TXDATA0;
input [15:0] TXDATA1;
input [1:0] RXENPRBSTST0;
input [1:0] RXENPRBSTST1;
input [1:0] RXEQMIX0;
input [1:0] RXEQMIX1;
input [1:0] RXPOWERDOWN0;
input [1:0] RXPOWERDOWN1;
input [1:0] TXBYPASS8B10B0;
input [1:0] TXBYPASS8B10B1;
input [1:0] TXCHARDISPMODE0;
input [1:0] TXCHARDISPMODE1;
input [1:0] TXCHARDISPVAL0;
input [1:0] TXCHARDISPVAL1;
input [1:0] TXCHARISK0;
input [1:0] TXCHARISK1;
input [1:0] TXENPRBSTST0;
input [1:0] TXENPRBSTST1;
input [1:0] TXPOWERDOWN0;
input [1:0] TXPOWERDOWN1;
input [2:0] LOOPBACK0;
input [2:0] LOOPBACK1;
input [2:0] RXCHBONDI0;
input [2:0] RXCHBONDI1;
input [2:0] TXBUFDIFFCTRL0;
input [2:0] TXBUFDIFFCTRL1;
input [2:0] TXDIFFCTRL0;
input [2:0] TXDIFFCTRL1;
input [2:0] TXPREEMPHASIS0;
input [2:0] TXPREEMPHASIS1;
input [3:0] GTPTEST;
input [3:0] RXEQPOLE0;
input [3:0] RXEQPOLE1;
input [6:0] DADDR;

endmodule
