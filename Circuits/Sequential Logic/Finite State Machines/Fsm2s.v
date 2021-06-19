module top_module (
    input clk,
    input reset,
    input j,
    input k,
    output out);

    // state declaration
    parameter ON = 1, OFF = 0;
    reg state, next_state;

    // Synchronous reset
    always @(posedge clk) begin
        if(reset) begin
            state <= OFF;
        end else begin
            state <= next_state;
        end
    end

    // state transition
    always @(*) begin
        case (state)
            ON: next_state <= (k)? OFF:ON;
            OFF:next_state <= (j)? ON:OFF;
        endcase
    end

    assign out = state;
    
endmodule