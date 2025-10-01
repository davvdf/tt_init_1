module tri_counter #(
    parameter int DATA_WIDTH = 8
)(
    input wire clk,
    input wire en,
    input wire rst_n,
    input wire ld,
    input wire [DATA_WIDTH-1:0] d_in,
    output wire [DATA_WIDTH-1:0] d_out
);
    reg [DATA_WIDTH-1:0] count;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count <= '0;
        end else begin
            if (ld) begin
                count <= d_in;
            end else begin
                count <= count + 1;
            end
        end
    end
    assign d_out = en ? count : 'z;
endmodule
