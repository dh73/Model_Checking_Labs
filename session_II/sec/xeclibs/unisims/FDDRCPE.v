// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/FDDRCPE.v,v 1.3 2010/02/11 21:59:58 vandanad Exp $

`timescale  100 ps / 10 ps

module FDDRCPE (Q, C0, C1, CE, CLR, D0, D1, PRE);

    parameter INIT = 1'b0; 

    input  C0, C1, CE, D0, D1, CLR, PRE ;
    output Q;

    wire ED0, ED1;

    pulldown clr (CLR);
    pulldown pre (PRE);
    pullup ce (CE);
    
    ddr_udp (.Q(Q), .S(PRE), .R(CLR), .CK1(C0), .D1(ED0), .CK2(C1), .D2(ED1) ); 
    assign ED0 = CE ? D0 : Q;
    assign ED1 = CE ? D1 : Q;

endmodule
