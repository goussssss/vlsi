module D_ff (d,clk,q,q_bar,reset);
 
input d;
input clk;
input reset;
 
output q;
output q_bar;
 
reg q;
 
assign q_bar = ~q;
 
always @(posedge clk)
begin
if (reset) begin
q<=1'b0;
end
else begin
q<=d;
end
end
endmodule

//testbench
module D_ff_tb;
 
reg clk;
reg reset;
reg d;
 
wire q;
wire qb;
 
D_ff dflipflop( .clk(clk), .reset(reset), .d(d), .q(q), .q_bar(qb) );
 
initial begin
$monitor(clk,d,q,qb,reset);
 
d = 1'b0;
reset = 1;
clk=1;
 
#10
reset=0;
d=1'b1;
 
#100
reset=0;
d=1'b0;
 
#100
reset=0;
d=1'b0;
 
#100
reset=0;
d=1'b1;
 
#100
reset=1;
d=1'b1;
 
end
always #25 clk <= ~clk;
 
endmodule