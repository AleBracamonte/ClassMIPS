/*
 * Autor: Alejandro Bracamonte
 * Descripción: Este módulo implementa un contador de programa que incrementa en cada ciclo de reloj,
 *              excepto cuando se activa la señal de reinicio, en cuyo caso el contador se reinicia a cero.
 */

module ProgramCounter (
    input  logic        clk,        // Señal de reloj
    input  logic        reset,      // Señal de reinicio
    output reg [31:0]  program_counter // Valor actual del contador de programa
);

    // Proceso secuencial para actualizar el valor del contador de programa
    always_ff @(posedge clk, posedge reset) begin
        if (reset) begin
            program_counter <= 32'b0;  // Reiniciar el contador de programa a 0
        end else begin
            program_counter <= program_counter + 1; // Incrementar el contador de programa en 1
        end
    end

endmodule
