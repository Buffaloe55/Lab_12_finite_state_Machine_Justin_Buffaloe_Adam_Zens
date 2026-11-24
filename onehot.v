module one_hot(
    input  wire w,
    input  wire clk,
    input  wire reset,
    output wire z,
    output wire [4:0] state
);

    // state[0] = A, state[1] = B, state[2] = C,
    // state[3] = D, state[4] = E
    wire Anext, Bnext, Cnext, Dnext, Enext;

    assign Anext = 1'b0;
    assign Bnext = ~w & (state[0] | state[3] | state[4]);
    assign Cnext = ~w & (state[1] | state[2]);
    assign Dnext =  w & (state[0] | state[1] | state[2]);
    assign Enext =  w & (state[3] | state[4]);

    // The Moore output is high in C or E.
    assign z = state[2] | state[4];

    // Reset starts the machine in A.
    dff Adff (.Default(1'b1), .D(Anext), .clk(clk), .reset(reset), .Q(state[0]));
    dff Bdff (.Default(1'b0), .D(Bnext), .clk(clk), .reset(reset), .Q(state[1]));
    dff Cdff (.Default(1'b0), .D(Cnext), .clk(clk), .reset(reset), .Q(state[2]));
    dff Ddff (.Default(1'b0), .D(Dnext), .clk(clk), .reset(reset), .Q(state[3]));
    dff Edff (.Default(1'b0), .D(Enext), .clk(clk), .reset(reset), .Q(state[4]));

endmodule