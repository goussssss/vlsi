module SR_ff(s,r,clk,reset,q,q_bar);
 
input s,r,clk,reset;
 
output q,q_bar;
 
wire s,r,clk;
reg q,q_bar;
 
always @(posedge clk) begin
 
if (reset) begin
q=1'b0;
q_bar=1'b1;
 
end else begin
 
case({s,r})
{1'b0,1'b0}: begin q=q;q_bar=q_bar; end
{1'b0,1'b1}: begin q=1'b0;q_bar=1'b1; end
{1'b1,1'b0}: begin q=1'b1;q_bar=1'b0; end
{1'b1,1'b1}: begin q=1'bx; q_bar=1'bx; end
endcase
 
end
 
end
endmodule


//testbench
module SR_ff_tb;
 
reg clk;
reg reset;
reg s,r;
 
wire q;
wire qb;
 
SR_ff srflipflop( .clk(clk), .reset(reset), .s(s), .r(r), .q(q), .q_bar(qb) );
 
initial begin
$monitor(clk,s,r,q,qb,reset);
 
s = 1'b0;
r = 1'b0;
reset = 1;
clk=1;
 
#10
reset=0;
s=1'b1;
r=1'b0;
 
#100
reset=0;
s=1'b0;
r=1'b1;
 
#100
reset=0;
s=1'b1;
r=1'b1;
 
#100
reset=0;
s=1'b0;
r=1'b0;
 
#100
reset=1;
s=1'b1;
r=1'b0;
 
end
always #25 clk <= ~clk;
 
endmodule