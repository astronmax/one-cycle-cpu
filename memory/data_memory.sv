/**
 * Data Memory for CPU
 * Volume: 1024 32-bit cells
 * For each clock can write or read data by address
 *
 * author: Max A.Jurankov (astronmax) 2023
**/

module data_memory #(
    parameter data_size = 32,
    parameter size = 1024
) (
    input logic clk, // clock signal
    input logic write_en, // write enable signal
    input logic [data_size-1:0] addr, // addres for read or write data
    input logic [data_size-1:0] write_data, // data to be written

    output logic [data_size-1:0] data // data that has been read
);

reg [data_size-1:0] memory[size-1:0];

always @(posedge clk) begin
    if (write_en) begin
        memory[addr] <= write_data;
    end

    data <= memory[addr];
end

endmodule