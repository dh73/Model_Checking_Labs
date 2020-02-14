`timescale  100 ps / 10 ps

primitive ddr_udp(Q, S, R, CK1, D1, CK2, D2);
output Q;
input  S, R, CK1, D1, CK2, D2;
reg    Q;
  table
    1  0   ?    ?    ?    ? :  ?  :  1; // Asserting preset
    *  0   ?    ?    ?    ? :  1  :  1; // Changing preset
    ?  1   ?    ?    ?    ? :  ?  :  0; // Asserting reset (dominates preset)
    0  *   ?    ?    ?    ? :  0  :  0; // Changing reset
    0  ?   (01) 0    ?    ? :  ?  :  0; // rising clock1
    ?  0   (01) 1    ?    ? :  ?  :  1; // rising clock1
    0  ?   p    0    ?    ? :  0  :  0; // potential rising clock1
    ?  0   p    1    ?    ? :  1  :  1; // potential rising clock1
    0  0   n    ?    ?    ? :  ?  :  -; // Clock1 falling
    0  ?   ?    ?    (01) 0 :  ?  :  0; // rising clock2
    ?  0   ?    ?    (01) 1 :  ?  :  1; // rising clock2
    0  ?   ?    ?    p    0 :  0  :  0; // potential rising clock2
    ?  0   ?    ?    p    1 :  1  :  1; // potential rising clock2
    ?  ?   ?    ?    n    ? :  ?  :  -; // Clock falling
    0  0   ?    *    ?    ? :  ?  :  -; // Changing Data1
    ?  ?   ?    ?    ?    * :  ?  :  -; // Changing Date2
    ?  *   ?    ?    ?    ? :  ?  :  -;
    *  ?   ?    ?    ?    ? :  ?  :  -;
  endtable
endprimitive
