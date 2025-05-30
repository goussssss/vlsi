module JK_ff(j,k,clk,reset,q,q_bar);
 
input j,k,clk,reset;
output q,q_bar;
 
wire j,k,clk,reset;
reg q,q_bar;
 
always @(posedge clk) begin
 
if(reset) begin
q=1'b0;
q_bar=1'b1;
 
end else begin
 
case({j,k})
{1'b0,1'b0}: begin q=q;q_bar=q_bar; end
{1'b0,1'b1}: begin q=1'b0;q_bar=1'b1; end
{1'b1,1'b0}: begin q=1'b1;q_bar=1'b0; end
{1'b1,1'b1}: begin q=~q; q_bar=~q_bar; end
endcase
 
end
 
end
 
endmodule

//testbench

module JK_ff_tb;
 
reg clk;
reg reset;
reg j,k;
 
wire q;
wire qb;
 
JK_ff jkflipflop( .clk(clk), .reset(reset), .j(j), .k(k), .q(q), .q_bar(qb) );
 
initial begin
$monitor(clk,j,k,q,qb,reset);
 
j = 1'b0;
k = 1'b0;
reset = 1;
clk=1;
 
#10
reset=0;
j=1'b1;
k=1'b0;
 
#100
reset=0;
j=1'b0;
k=1'b1;
 
#100
reset=0;
j=1'b1;
k=1'b1;
 
#100
reset=0;
j=1'b0;
k=1'b0;
 
#100
reset=1;
j=1'b1;
k=1'b0;
 
end
always #25 clk <= ~clk;
 
endmodule