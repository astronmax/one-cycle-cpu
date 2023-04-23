`include "memory/data_memory.sv"

module data_memory_tb ();

parameter data_size = 32;
parameter size = 1024;

logic clk, write_en;
reg [data_size-1:0] addr;
reg [data_size-1:0] write_data;
wire [data_size-1:0] data;

data_memory data_memory_inst (
    .clk(clk),
    .write_en(write_en),
    .addr(addr),
    .write_data(write_data),
    .data(data)
);

integer i;

initial begin
    $dumpfile("data_memory.vcd");
    $dumpvars(0, data_memory_tb);

    // write some data
    write_en = 1; #20;
    for (i = 0; i < 5; i = i + 1) begin
        clk = 0; #20;
        addr <= i; #20;
        write_data <= i + 10; #20;
        clk = 1; #20;
    end

    // read data from memory
    write_en = 0; #20;
    for (i = 0; i < 5; i = i + 1) begin
        clk = 0; #20;
        addr <= i; #20;
        clk = 1; #20;
        $display("Read data: %x", data);
    end
end

endmodule