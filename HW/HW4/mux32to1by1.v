module mux32to1by1
(
output      out,
input[4:0]  address,
input[31:0] inputs
);

  assign out = inputs[address];
  
endmodule

// module testMux;
// reg[4:0] address;
// reg[31:0] inputs;
// wire out;

// mux32to1by1 m(out, address, inputs);
// initial begin

// inputs=32'b00010001000100010001000100010001 ;address='d0;
// $display("%b | 1 ", out);
// inputs=32'b00010001000100010001000100010001 ;address='d1;
// $display("%b | 0 ", out);
// inputs=32'b00010001000100010001000100010001 ;address='d8;
// $display("%b | 1 ", out);
// inputs=32'b10010001000100010001000100010001 ;address='d28;
// $display("%b | 1 ", out);

// end
// endmodule