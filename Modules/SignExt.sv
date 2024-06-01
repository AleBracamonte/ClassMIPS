/*
 * Autor: Alejandro Bracamonte
 * Descripción: Este módulo extiende el signo de un valor de 16 bits a 32 bits.
 */

module SignExt (
    input  [15:0] a,   // Valor de entrada de 16 bits
    output [31:0] y    // Valor extendido de 32 bits
);
    // Extiende el valor de 16 bits a 32 bits manteniendo el signo
    assign y = {{16{a[15]}}, a}; // Repite el bit más significativo 16 veces para mantener el signo
endmodule