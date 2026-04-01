module Behavioral_ALU3 (
    input [3:0] a, b,           // 4-bit inputs
    input [2:0] op,             // 3-bit operation selector
    output reg [3:0] result,    // 4-bit result
    output reg Cout             // Carry out
);

reg [4:0] temp_result;         // Temporary 5-bit result to hold carry

always @(*) begin
    case (op)
        3'b000: begin // Subtraction
            temp_result = {1'b0, a} - {1'b0, b};  // Sign-extended for carry
            Cout = temp_result[4];               // Carry-out from MSB
            result = temp_result[3:0];          // Lower 4 bits as result
        end

        3'b001: begin // Addition
            temp_result = {1'b0, a} + {1'b0, b};  // Sign-extended for carry
            Cout = temp_result[4];               // Carry-out from MSB
            result = temp_result[3:0];          // Lower 4 bits as result
        end

        3'b010: begin // Bitwise AND
            result = a & b;         // AND operation
            Cout = 1'b0;            // No carry
        end

        3'b011: begin // Bitwise OR
            result = a | b;         // OR operation
            Cout = 1'b0;            // No carry
        end

        default: begin // Undefined operation
            result = 4'b0000;       // Output zeros
            Cout = 1'b0;            // No carry
        end
    endcase
end

endmodule
