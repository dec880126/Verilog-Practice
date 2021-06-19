module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    // State declaration
    parameter A = 0, B = 1, C = 2, D = 3;
    reg [1:0] state, next_state;

    // Asynchronous reset
    always @(posedge clk) begin
        if(reset) begin
            state <= A;
        end else begin
            state <= next_state;
        end
    end

    // State transition
    always @(*) begin
        case(state)       
            A:  next_state <= (in)? B:A;
            B:  next_state <= (in)? B:C;
            C:  next_state <= (in)? D:A;
            D:  next_state <= (in)? B:C;
        endcase
    end

    // Output logic
    assign out = (state == D);

endmodule