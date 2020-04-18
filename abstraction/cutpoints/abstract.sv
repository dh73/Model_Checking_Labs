checker counter_abstract
  (input logic clk, rstn, clear,
   output logic timeout,
   output logic [30:0] value); // value will be abstracted (cutpoint, stopat, etc)

always_ff @(posedge clk) begin
   if (!rstn || clear) value <= 0;
   else                value <= value + 1'b1;
end
   
always_comb timeout =& value;

property reset_clear;
   (@(posedge clk)
    !rstn || clear |-> ##1 value == 0);
endproperty // reset_clear

property timer_full_stable;
   (@(posedge clk)
    &value && !clear |-> ##1 &value);
endproperty // timer_full_stable

property timeout_p;
   (@(posedge clk)
    &value |-> ##1 timeout);
endproperty // timeout_p

property incrementing_counter;
   (@(posedge clk)
    ~&value && !clear |-> ##1 (value > $past(value)));
endproperty // incrementing_counter

reset_abstract:      assume property (reset_clear);
timer_full_abstract: assume property (timer_full_stable);
timeout_full:        assume property (timeout_p);
increment_abstract:  assume property (incrementing_counter);

endchecker
  
