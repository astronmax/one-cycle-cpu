module register_file #(
    parameter data_size = 32,
    parameter regs_count = 16,
    parameter addr_size = $clog2(regs_count) // bits to enumerate all registers
) (
    input logic clk, // clock signal
    input logic write_en, // write data enable signal
    input logic [data_size-1:0] pc_value, // PC value to be written into R15
    input logic [addr_size-1:0] read_reg_1, // first register to read
    input logic [addr_size-1:0] read_reg_2, // second register to read
    input logic [addr_size-1:0] write_reg, // register to write data
    input logic [data_size-1:0] write_data, // data to write to the register

    output logic [data_size-1:0] read_data_1, // data read from first register
    output logic [data_size-1:0] read_data_2 // data read from second register
);

reg [data_size-1:0] memory[regs_count-1:0];

always @(posedge clk) begin
    if (write_en) begin
        memory[write_reg] <= write_data;
    end

    memory[regs_count-1] <= pc_value;
    read_data_1 <= memory[read_reg_1];
    read_data_2 <= memory[read_reg_2];
end

endmodule