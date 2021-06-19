module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    // state declaration
    parameter A=0, B=1; 
    reg state, next_state;

    // Synchronous reset
    always @(*) begin
        case (state)
            A: next_state = (in)? A:B;
            B: next_state = (in)? B:A;
        endcase
    end

    // state transition
    always @(posedge clk, posedge areset) begin
        if(areset) begin
            state <= B;
        end
        else begin
            state <= next_state;
        end
    end

    assign out = (state == B);

endmodule
