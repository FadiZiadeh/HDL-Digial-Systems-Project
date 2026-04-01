module Behavioral_ALU (input [3:0] a, b,input cin,input [2:0] op,output reg [3:0] result);

wire [3:0] bandwire,borwire, addwire,subwire; 
output wire [1:0] subCout, addCout;
band g1 (a,b,bandwire);
bor g2 (a,b,borwire); 
sub g3 (a,b,cin, subCout, subwire); 
add g4 (a,b,cin,addCout,addwire);

always @(*) begin
    // Operation selection based on op
    case (op)
        3'b000: result = subwire;   // Subtraction
        3'b001: result = addwire;   // Addition
        3'b010: result = borwire; // Bitwise OR
        3'b011: result = bandwire; // Bitwise AND
        default: result = 4'bz; // Undefined output
    endcase
end

endmodule
