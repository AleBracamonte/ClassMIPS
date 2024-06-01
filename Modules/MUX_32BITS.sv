/*
 * Autor: Alejandro Bracamonte
 * Fecha: 01 de junio de 2024
 */

// Módulo Mux32Bits (Multiplexor de 32 bits)
// Selecciona entre dos conjuntos de datos de 32 bits basado en una señal de selección.
module Mux32Bits (
    input  logic [31:0] in_data0, // Primer conjunto de datos de entrada de 32 bits
    input  logic [31:0] in_data1, // Segundo conjunto de datos de entrada de 32 bits
    input  logic        sel,      // Señal de selección
    output logic [31:0] out_data  // Datos de salida de 32 bits
);

    assign out_data = (sel) ? in_data1 : in_data0;

endmodule
