`define AND and #50
`define OR or #50
`define NOT not #50

module behavioralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire[3:0] inputs = {in3, in2, in1, in0};
wire[1:0] address = {address1, address0};
assign out = inputs[address];
endmodule

module structuralMultiplexer(out, address0,address1, in0,in1,in2,in3);
output out;
input address0, address1;
input in0, in1, in2, in3;
wire nA0, nA1, isIn0, isIn2, isIn3, isIn1;
`NOT A0Not(nA0, address0);
`NOT A1Not(nA1, address1);
`AND In0Adder(isIn0, nA0, nA1, in0);
`AND In1Adder(isIn1, address0, nA1, in1);
`AND In2Adder(isIn2, nA0, address1, in2);
`AND In3Adder(isIn3, address0, address1, in3);
`OR OutputOr(out, isIn0, isIn1, isIn2, isIn3);
endmodule


module testMultiplexer;
reg in0, in1, in2, in3;
reg address0, address1;
wire out;
structuralMultiplexer multiplexer (out, address0,address1, in0,in1,in2,in3);


initial begin
#20000
$display("I0 I1 I2 I3 A0 A1| OUT | Expected Output");
in0=0;in1=1'bX;in2=1'bX;in3=1'bX;address0=0;address1=0; #1000 
$display("%b  X  X  X  %b  %b |  %b | I0", in0, address0, address1, out);
in0=1;in1=1'bX;in2=1'bX;in3=1'bX;address0=0;address1=0; #1000 
$display("%b  X  X  X  %b  %b |  %b | I0", in0, address0, address1, out);
in0=1'bX;in1=0;in2=1'bX;in3=1'bX;address0=1;address1=0; #1000 
$display("X  %b  X  X  %b  %b |  %b | I1", in1, address0, address1, out);
in0=1'bX;in1=1;in2=1'bX;in3=1'bX;address0=1;address1=0; #1000 
$display("X  %b  X  X  %b  %b |  %b | I1", in1, address0, address1, out);
in0=1'bX;in1=1'bX;in2=0;in3=1'bX;address0=0;address1=1; #1000 
$display("X  X  %b  X  %b  %b |  %b | I2", in2, address0, address1, out);
in0=1'bX;in1=1'bX;in2=1;in3=1'bX;address0=0;address1=1; #1000 
$display("X  X  %b  X  %b  %b |  %b | I2", in2, address0, address1, out);
in0=1'bX;in1=1'bX;in2=1'bX;in3=0;address0=1;address1=1; #1000 
$display("X  X  X  %b  %b  %b |  %b | I3", in3, address0, address1, out);
in0=1'bX;in1=1'bX;in2=1'bX;in3=1;address0=1;address1=1; #1000 
$display("X  X  X  %b  %b  %b |  %b | I3", in3, address0, address1, out);


end
endmodule
