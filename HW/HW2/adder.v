`define AND and #50
`define OR or #50
`define XOR xor #50

module behavioralFullAdder(sum, carryout, a, b, carryin);
output sum, carryout;
input a, b, carryin;
assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder(out, carryout, a, b, carryin);
output out, carryout;
input a, b, carryin;
wire xorAB, carryChk0, carryChk1;
`XOR aSumB(xorAB, a, b);
`XOR Summit(out, xorAB, carryin);
`AND carryAB(carryChk0, a, b);
`AND carrySumCarry(carryChk1, xorAB, carryin);
`OR carryFinal(carryout, carryChk0, carryChk1);
endmodule

module testFullAdder;
reg a, b, carryin;
wire sum, carryout;
structuralFullAdder adder (sum, carryout, a, b, carryin);

initial begin
#10000
$display("A  B  CI| SUM CO | Expected Output");
a=0;b=0;carryin=0; #1000 
$display("%b  %b  %b |  %b  %b  | 0", a, b, carryin, sum, carryout);
a=1;b=0;carryin=0; #1000 
$display("%b  %b  %b |  %b  %b  | 1", a, b, carryin, sum, carryout);
a=0;b=1;carryin=0; #1000 
$display("%b  %b  %b |  %b  %b  | 1", a, b, carryin, sum, carryout);
a=1;b=1;carryin=0; #1000 
$display("%b  %b  %b |  %b  %b  | 2", a, b, carryin, sum, carryout);
a=0;b=0;carryin=1; #1000 
$display("%b  %b  %b |  %b  %b  | 1", a, b, carryin, sum, carryout);
a=1;b=0;carryin=1; #1000 
$display("%b  %b  %b |  %b  %b  | 2", a, b, carryin, sum, carryout);
a=0;b=1;carryin=1; #1000 
$display("%b  %b  %b |  %b  %b  | 2", a, b, carryin, sum, carryout);
a=1;b=1;carryin=1; #1000 
$display("%b  %b  %b |  %b  %b  | 3", a, b, carryin, sum, carryout);
end
endmodule
