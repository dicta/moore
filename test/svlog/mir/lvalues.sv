// RUN: moore %s

module a0;
	logic [15:0] a;
	struct {
		logic x;
		logic [13:0] y;
	} b;
	int c;

	assign a = 5;
	assign a[3:0] = 5;
	assign a[c] = 1;
	assign b = '{default: 0};
	assign b.x = 1;
	assign b.y = 5;
	assign b.y[9:2] = 5;
endmodule

module a1;
	int a;
	int b;

	initial a = b++;
	initial a = b--;
	initial a = ++b;
	initial a = --b;

	initial a += 2;
	initial a -= 2;
	initial a *= 2;
	initial a /= 2;
	initial a %= 2;
	initial a &= 2;
	initial a |= 2;
	initial a ^= 2;
	initial a <<= 2;
	initial a >>= 2;
	initial a <<<= 2;
	initial a >>>= 2;

	// assign a = (b += 4) + 1;
	// assign a = (b -= 4) + 1;
	// assign a = (b *= 4) + 1;
	// assign a = (b /= 4) + 1;
	// assign a = (b %= 4) + 1;
	// assign a = (b &= 4) + 1;
	// assign a = (b |= 4) + 1;
	// assign a = (b ^= 4) + 1;
	// assign a = (b <<= 4) + 1;
	// assign a = (b >>= 4) + 1;
	// assign a = (b <<<= 4) + 1;
	// assign a = (b >>>= 4) + 1;
endmodule
