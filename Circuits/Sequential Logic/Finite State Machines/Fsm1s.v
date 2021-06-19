// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // state declaration
    parameter A = 0, B = 1;
    reg state, next_state;

    // Synchronous reset
    always @(posedge clk) begin
        if(reset) begin
            state <= 1;
        end else begin
            state <= next_state;
        end        
    end

    // State transition
    always @(*) begin
        case(state)
            A:next_state <= (in)? A:B;
            B:next_state <= (in)? B:A;
        endcase
    end

    assign out = (state)? 1:0;
endmodule