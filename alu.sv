module alu #(
    parameter bits = 32
) (
    input logic [bits-1:0] A, B,
    input logic [1:0] select,

    output logic [bits-1:0] result
);

always @(*) begin
    case (select)
        2'b00:
            result = A + B;
        2'b01:
            result = A - B;
        2'b10:
            result = A & B;
        2'b11:
            result = A | B;
        default:
            result = A + B; 
    endcase
end

endmodule