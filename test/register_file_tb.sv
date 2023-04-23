`include "memory/register_file.sv"

module register_file_tb ();

parameter dataSize = 32;
parameter regsCount = 16;
parameter addrSize = $clog2(regsCount);

logic clk;
logic write_en;
logic [dataSize-1:0] pc;
reg [addrSize-1:0] readReg_1;
reg [addrSize-1:0] readReg_2;
reg [addrSize-1:0] writeReg;
reg [dataSize-1:0] writeData;
wire [dataSize-1:0] readData_1;
wire [dataSize-1:0] readData_2;

register_file register_file_inst (
    .clk(clk),
    .write_en(write_en),
    .pc_value(pc),
    .read_reg_1(readReg_1),
    .read_reg_2(readReg_2),
    .write_reg(writeReg),
    .write_data(writeData),
    .read_data_1(readData_1),
    .read_data_2(readData_2)
);

integer i;

initial begin
    $dumpfile("register_file.vcd");
    $dumpvars(0, register_file_tb);

    pc = 0; #20;
    write_en = 1; #20;
    for (i = 0; i < 5; i = i + 1) begin
        clk = 0; #20
        writeReg <= i; #20;
        writeData <= 32'hDEADBEEF; #20;
        clk = 1; #20;
    end

    write_en = 0; #20;
    for (i = 0; i < 5; i = i + 1) begin
        clk = 0; #20;
        readReg_1 <= i; #20;
        readReg_2 <= regsCount - 1;
        pc <= pc + 1; #20;
        clk = 1; #20;
        $display("Reg %d: %x | Reg %d (PC): %x", readReg_1, readData_1, readReg_2, readData_2);
    end
end

endmodule