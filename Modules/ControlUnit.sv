/*
 * Autor: Alejandro Bracamonte
 * Fecha: 01 de junio de 2024
 */

// Módulo ControlUnit (Unidad de Control)
// Genera las señales de control necesarias para ejecutar las instrucciones en el procesador.
module ControlUnit (
    input  logic [5:0] opcode,       // Campo opcode de la instrucción
    input  logic [5:0] funct,        // Campo funct de la instrucción R-type
    output logic       mem_to_reg,   // Señal para seleccionar el origen de los datos a escribir en el registro
    output logic       mem_write,    // Señal para habilitar la escritura en memoria
    output logic       branch,       // Señal para determinar si se trata de una instrucción de bifurcación
    output logic       alu_src,      // Señal para seleccionar el segundo operando de la ALU
    output logic       reg_dst,      // Señal para seleccionar el registro de destino
    output logic       reg_write,    // Señal para habilitar la escritura en el registro
    output logic [3:0] alu_control   // Señal de control de la ALU
);

    logic [1:0] alu_op; // Señal intermedia para determinar la operación de la ALU

    // Instancia del MainDecoder
    MainDecoder main_decoder (
        .opcode     (opcode),
        .mem_to_reg (mem_to_reg),
        .mem_write  (mem_write),
        .branch     (branch),
        .alu_src    (alu_src),
        .reg_dst    (reg_dst),
        .reg_write  (reg_write),
        .alu_op     (alu_op)
    );

    // Instancia del ALUDecoder
    ALUDecoder alu_decoder (
        .funct       (funct),
        .alu_op      (alu_op),
        .alu_control (alu_control)
    );

endmodule
