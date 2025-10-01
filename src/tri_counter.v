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
    reg out;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            out <= '0;
        end else begin
            if (ld) begin
                out <= d_in;
            end else begin
                out <= out + 1;
            end
        end
    end
    assign d_out = en ? out : 'z;
endmodule
