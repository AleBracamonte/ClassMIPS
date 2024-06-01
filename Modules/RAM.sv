/*
 * Autor: Alejandro Bracamonte
 * Descripción: Este módulo implementa una memoria RAM de 256 palabras de 32 bits.
 *              Puede leer y escribir datos en la memoria utilizando señales de control.
 */

module RAM (
    input  logic         MemWrite, // Señal de habilitación de escritura
    input  logic         CLK,      // Señal de reloj
    input  logic [31:0]  Address,  // Dirección de memoria
    input  logic [31:0]  WD,       // Dato a escribir (write data)
    output reg   [31:0]  RD        // Dato leído (read data)
);

    // Memoria de 256 palabras de 32 bits
    reg [31:0] memory [0:255];

    // Inicialización de la memoria
    initial begin
        memory[0] = 27;
        memory[1] = 28;
        memory[2] = 33;
        memory[3] = 15;
        memory[4] = 10;
    end

    // Bloque secuencial para controlar las operaciones de lectura y escritura
    always_ff @(posedge CLK) begin
        if (MemWrite) begin
            memory[Address] <= WD; // Escribir dato en memoria
        end
        RD <= memory[Address];    // Leer dato de memoria
    end

endmodule
