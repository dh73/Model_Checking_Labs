`default_nettype none
module top
  (input wire clk, rstn, clear,
   input wire ack, start,
   output logic error, ok, req,
   output logic [30:0] val);
   
   typedef enum logic [2:0] {idle, request, waitack, err, completed} states_t;
   states_t ps, ns; // (P)resent (S)tate, (N)ext (S)tate
   logic 	clrr, clrw, reqr, reqw;
   logic 	timeout;
   
   always_ff @(posedge clk) begin
      if (~rstn) begin 
	 ps <= idle;
	 clrr <= 1'b0;
	 reqr <= 1'b0;
      end
      else begin
	 ps <= ns;
	 clrr <= clrw;
	 reqr <= reqw;
      end
   end
   
   always_comb begin
      ns    = ps;
      clrw  = clrr;
      reqw  = reqr;
      error = 1'b0;
      ok    = 1'b0;
      req   = reqr;
      unique case (ps)
	idle: begin
	   clrw = 1'b0;
	   reqw = 1'b0;
	   if (start) ns = request;
	   else       ns = idle;
	end
	request: begin
	   clrw = 1'b0;
	   reqw = 1'b1;
	   ns   = waitack;
	end
	waitack: begin
	   clrw = 1'b0;
	   reqw = 1'b1;
	   if (timeout) ns = err;
	   else if(ack) ns = completed;
	   else         ns = waitack;
	end
	err: begin
	   reqw = 1'b0;
	   clrw = 1'b1;
	   error = 1'b1;
	   ns = idle;
	end
	completed: begin
	   reqw = 1'b0;
	   clrw = 1'b1;
	   ok = 1'b1;
	   ns = idle;
	end
	default: ns = err;
      endcase
   end // always_comb

   default clocking fpvclk @(posedge clk); endclocking
   default disable iff (!rstn);
   
   // The abstract timer-counter
   counter_abstract
     abstract (clk, rstn, clear, timeout, val);
   check1: cover property (ps == waitack && timeout |-> ##1 error == 1'b1);
   check2: cover property (ps == idle |-> ##[1:$] ps == err);
   check3: cover property (val == 0 |-> ##[1:$] val == 'hf);
endmodule // top
