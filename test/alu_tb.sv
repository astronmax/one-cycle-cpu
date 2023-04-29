`include "alu.sv"

module alu_tb ();


reg [31:0] a;
reg [31:0] b;
reg [1:0] f;
wire [31:0] res;

alu alu_inst (
    .A(a),
    .B(b),
    .select(f),
    .result(res)
);

initial begin
    a = 10; #20;
    b = 5; #20;
    f = 2'b00; #20;
    $display("%d + %d = %d\n", a, b, res);

    f = 2'b01; #20;
    $display("%d - %d = %d\n", a, b, res);

    f = 2'b10; #20;
    $display("%d & %d = %d\n", a, b, res);

    f = 2'b11; #20;
    $display("%d | %d = %d\n", a, b, res);

    a = 100; #20;
    $display("%d | %d = %d\n", a, b, res);
end

endmodule