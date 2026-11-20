module binary(
    input  w,
    input  clk,
    input  reset,
    output z,
);


diff zero(
        .default(1'b0),
	.D(Next[0]),
	.clk(clk),
	.Q(State[0])
);

diff zero(
	.D(Next[0]),
	.clk(clk),
	.Q(State[1])
);

diff zero(
	.D(Next[0]),
	.clk(clk),
	.Q(State[2])
);

// logic
z = (~state[2] & state[1] & ~state[0]) | (); // only 1 at C and E

    

endmodule