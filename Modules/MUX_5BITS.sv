/*
 * Autor: Alejandro Bracamonte
 * Fecha: 01 de junio de 2024
 */

// Módulo Mux5Bits (Multiplexor de 5 bits)
// Selecciona entre dos conjuntos de datos de 5 bits basado en una señal de selección.
module Mux5Bits (
    input  logic [4:0] in_data0, // Primer conjunto de datos de entrada
    input  logic [4:0] in_data1, // Segundo conjunto de datos de entrada
    input  logic       sel,      // Señal de selección
    output logic [4:0] out_data  // Datos de salida
);

    assign out_data = (sel) ? in_data1 : in_data0;

endmodule
