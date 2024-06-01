/*
 * Autor: Alejandro Bracamonte
 * Descripción: Este módulo implementa un archivo de registros de tres puertos.
 *              Puede leer dos puertos de forma combinacional y escribir en el tercer puerto en el flanco de subida del reloj.
 *              El registro 0 está conectado permanentemente a 0.
 */

module RegisterFile (
    input           CLK,      // Señal de reloj
    input           WE3,      // Señal de escritura para el tercer puerto
    input  [4:0]    A1, A2,   // Direcciones de lectura para los primeros dos puertos
    input  [4:0]    A3,       // Dirección de escritura para el tercer puerto
    input  [31:0]   WD3,      // Dato a escribir en el tercer puerto
    output reg [31:0] RD1,    // Dato leído desde el primer puerto
    output reg [31:0] RD2     // Dato leído desde el segundo puerto
);

    reg [31:0] registers [0:31]; // Declaración de la matriz de registros

    // Implementación del archivo de registro
    always @(posedge CLK) begin
        if (WE3) begin
            registers[A3] <= WD3; // Escribir en el tercer puerto en el flanco de subida del reloj si WE3 está activo
        end
    end

    // Lectura combinacional desde los primeros dos puertos
    assign RD1 = (A1 != 0) ? registers[A1] : 0; // Si la dirección no es cero, leer desde el registro correspondiente, de lo contrario, leer cero
    assign RD2 = (A2 != 0) ? registers[A2] : 0; // Si la dirección no es cero, leer desde el registro correspondiente, de lo contrario, leer cero

endmodule

// module RegisterFile (
//     input wire clk,              // Señal de reloj
//     input wire [4:0] A1,         // Dirección del primer registro a leer
//     input wire [4:0] A2,         // Dirección del segundo registro a leer
//     input wire [4:0] A3,         // Dirección del registro a escribir
//     input wire [31:0] WD3,       // Datos a escribir en el registro
//     input wire WE,               // Señal de habilitación de escritura
//     output reg [31:0] RD1,       // Datos leídos del primer registro
//     output reg [31:0] RD2        // Datos leídos del segundo registro
// );

//     // Definición del banco de registros: 32 registros de 32 bits
//     reg [31:0] registers [0:31];

//     // Inicialización de los registros (opcional)
//     initial begin
//         integer i;
//         for (i = 0; i < 32; i = i + 1) begin
//             registers[i] = 32'b0;
//         end
//     end

//     // Lectura de registros
//     always @(*) begin
//         RD1 = registers[A1];
//         RD2 = registers[A2];
//     end

//     // Escritura en el registro en el flanco positivo del reloj
//     always @(posedge clk) begin
//         if (WE) begin
//             registers[A3] <= WD3;
//         end
//     end

// endmodule

