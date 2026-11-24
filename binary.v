module binary(
    input  wire w,
    input  wire clk,
    input  wire reset,
    output wire z,
    output wire [2:0] state
);

    wire [2:0] Next;

    // State codes: A=000, B=001, C=010, D=011, E=100
    // All three flip-flops reset to 0, selecting A.
    dff zero(
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .reset(reset),
        .Q(state[0])
    );

    dff one(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .reset(reset),
        .Q(state[1])
    );

    dff two(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(reset),
        .Q(state[2])
    );

    // Next[2] K-map: two groups
    assign Next[2] = (state[1] & state[0] & w)
                   | (state[2] & w);

    // Next[1] K-map: three groups
    assign Next[1] = (state[1] & ~state[0])
                   | (~state[1] & state[0])
                   | (~state[2] & ~state[0] & w);

    // Next[0] K-map: four groups
    assign Next[0] = (~state[2] & ~state[1] & w)
                   | (~state[2] & ~state[0] & w)
                   | (~state[1] & ~state[0] & ~w)
                   | (state[1] & state[0] & ~w);

    // Moore output: C (010) or E (100)
    assign z = (~state[2] & state[1] & ~state[0])
             | (state[2] & ~state[1] & ~state[0]);

endmodule