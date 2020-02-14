// $Header: /devl/xcs/repo/env/Databases/CAEInterfaces/xec_libs/data/unisims/IOBUFDS_BLVDS_25.v,v 1.1 2005/05/10 01:20:05 wloo Exp $

/*

FUNCTION	: INPUT TRI-STATE OUTPUT BUFFER

*/

`celldefine
`timescale  100 ps / 10 ps

module IOBUFDS_BLVDS_25 (O, IO, IOB, I, T);

    output O;
    inout  IO, IOB;
    input  I, T;

    reg O;
    
    or O1 (ts, 1'b0, T);
    bufif0 B1 (IO, I, ts);
    notif0 N1 (IOB, I, ts);
    

    always @(IO or IOB) begin
        if (IO == 1'b1 && IOB == 1'b0)
            O <= IO;
        else if (IO == 1'b0 && IOB == 1'b1)
            O <= IO;
    end
    
endmodule
