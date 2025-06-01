`default_nettype none
`timescale 1ns / 1ps

module tt_um_alu_2bit (
    input  wire [7:0] ui_in,     // ui_in[0] - A[0], ui_in[1] - A[1]
                                 // ui_in[2] - B[0], ui_in[3] - B[1]
                                 // ui_in[6:4] - control (3 bits)
    output wire [7:0] uo_out,    // uo_out[3:0] - resultado
                                 // uo_out[7]   - overflow (solo para suma)
    input  wire [7:0] uio_in,    // No usado
    output wire [7:0] uio_out,   // No usado
    output wire [7:0] uio_oe,    // No usado
    input  wire       ena,       // Enable (siempre 1)
    input  wire       clk,       // Reloj
    input  wire       rst_n      // Reset activo en bajo
);

    // Entradas A, B y control
    wire [1:0] A = ui_in[1:0];
    wire [1:0] B = ui_in[3:2];
    wire [2:0] control = ui_in[6:4];

    // Resultados
    reg [3:0] resultado;
    reg       overflow;

    always @(*) begin
        overflow = 0;
        case (control)
            3'b000: begin // SUMA
                {overflow, resultado} = A + B;
            end
            3'b001: begin // RESTA
                resultado = A - B;
            end
            3'b010: resultado = A & B;  // AND
            3'b011: resultado = A | B;  // OR
            3'b100: resultado = A ^ B;  // XOR
            3'b101: resultado = ~A;     // NOT A (B ignorado)
            3'b110: resultado = A << 1; // SHIFT LEFT
            3'b111: resultado = A >> 1; // SHIFT RIGHT
            default: resultado = 4'b0000;
        endcase
    end

    assign uo_out[3:0] = resultado;
    assign uo_out[6:4] = 3'b000; // no usados
    assign uo_out[7]   = overflow;

    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

    // Prevenir warnings de señales no utilizadas
    wire _unused = &{ena, clk, rst_n, uio_in};

endmodule


