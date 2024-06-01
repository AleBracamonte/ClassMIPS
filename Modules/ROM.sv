/*
 * Autor: Alejandro Bracamonte
 * Descripción: Este módulo implementa una memoria de solo lectura (ROM) de 256 palabras de 32 bits.
 *              Lee la instrucción almacenada en la dirección proporcionada.
 */

module ROM (
    input  [31:0] ADDRESS,  // Dirección de memoria
    output reg [31:0] RD    // Dato leído (instrucción)
);

    reg [31:0] memory [0:255]; // Memoria ROM de 256 instrucciones de 32 bits

    // Cargar el archivo binario en la memoria durante la simulación
    initial begin
        $readmemh("instructions.bin", memory); // Se lee el archivo binario y se carga en la memoria
    end

    // Leer la instrucción de la dirección proporcionada
    always @(*) begin
        RD = memory[ADDRESS]; // Selecciona la instrucción almacenada en la dirección proporcionada
    end

endmodule
