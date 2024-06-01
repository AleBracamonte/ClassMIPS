/*
 * Autor: Alejandro Bracamonte
 * Fecha: 01 de junio de 2024
 */

// Módulo ALU (Unidad Aritmético Lógica)
// Realiza operaciones aritméticas y lógicas según la señal de control ALUControl.
module ALU (
    input  logic [31:0] A,          // Primer operando
    input  logic [31:0] B,          // Segundo operando
    input  logic [3:0] alu_control, // Señal de control para seleccionar la operación
    output logic [31:0] result,     // Resultado de la operación
    output logic        zero_flag   // Bandera de cero (1 si el resultado es cero, 0 de lo contrario)
);

    // Asigna la señal zero_flag
    assign zero_flag = (result == 0);

    // Realiza la operación basada en la señal alu_control
    always @* begin
        case (alu_control)
            4'b0000: result = A & B;         // AND
            4'b0001: result = A | B;         // OR
            4'b0010: result = A + B;         // ADD
            4'b0110: result = A - B;         // SUBTRACT
            4'b0111: result = (A < B) ? 1 : 0; // SLT (set on less than)
            4'b1100: result = ~(A | B);      // NOR
            4'b1000: result = B << 16;       // LUI (load upper immediate)
            4'b1000: result = A * B;         // MULTIPLY
            4'b1010: result = A / B;         // DIVIDE
            4'b1011: result = A % B;         // MODULO (remainder of the division)
            default: result = 0;             // Caso predeterminado (Default case)
        endcase
    end

endmodule
