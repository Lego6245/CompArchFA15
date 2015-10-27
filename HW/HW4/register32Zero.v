// 32 bit Zero Register with enable
//   Positive edge triggered
module register32Zero
(
output reg[31:0]	q,
input[31:0]		d,
input		wrenable,
input		clk
);

    initial begin
		q = 0;
	end

endmodule