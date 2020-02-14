// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FDDRRSE.v,v 1.3 2010/02/11 21:59:58 vandanad Exp $

/*

FUNCTION	: Dual Data Rate MUX

*/

`timescale  100 ps / 10 ps

module FDDRRSE (Q, C0, C1, CE, D0, D1, R, S);

    parameter INIT = 1'b0;

    output Q;
    input  C0, C1, CE, D0, D1, R, S;

    reg ED0, ED1;

    pulldown r (R);
    pulldown s (S);
    pullup ce (CE);
    
    ddr_udp (.Q(Q), .S(1'b0), .R(1'b0), .CK1(C0), .D1(ED0), .CK2(C1), .D2(ED1) );
    always @(CE or D0 or R or S or Q) begin
	if (R) ED0 = 1'b0;
	else if (S) ED0 = 1'b1;
	else if (CE) ED0 = D0;
	else ED0 = Q;
    end 
    always @(CE or D1 or R or S or Q) begin
	if (R) ED1 = 1'b0;
	else if (S) ED1 = 1'b1;
	else if (CE) ED1 = D1;
	else ED1 = Q;
    end 

endmodule
