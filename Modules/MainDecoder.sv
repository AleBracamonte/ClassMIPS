/*
 * Autor: Alejandro Bracamonte
 * Fecha: 01 de junio de 2024
 */

// Módulo MainDecoder (Decodificador Principal)
// Decodifica el campo opcode de la instrucción para generar las señales de control necesarias.
module MainDecoder (
    input  logic [5:0] opcode,   // Campo opcode de la instrucción
    output logic       mem_to_reg, // Señal para seleccionar el origen de los datos a escribir en el registro
    output logic       mem_write,  // Señal para habilitar la escritura en memoria
    output logic       branch,     // Señal para determinar si se trata de una instrucción de bifurcación
    output logic       alu_src,    // Señal para seleccionar el segundo operando de la ALU
    output logic       reg_dst,    // Señal para seleccionar el registro de destino
    output logic       reg_write,  // Señal para habilitar la escritura en el registro
    output logic [1:0] alu_op      // Señal para determinar la operación de la ALU
);

    // Inicializar señales en cero
    initial begin
        mem_to_reg = 0;
        mem_write = 0;
        branch = 0;
        alu_src = 0;
        reg_dst = 0;
        reg_write = 0;
        alu_op = 2'b00;
    end

    always @* begin
        // Valores por defecto para todas las señales
        mem_to_reg = 0;
        mem_write = 0;
        branch = 0;
        alu_src = 0;
        reg_dst = 0;
        reg_write = 0;
        alu_op = 2'b00;

        case (opcode)
            6'b000000: begin  // R-type
                reg_dst = 1;
                reg_write = 1;
                alu_op = 2'b10;
            end
            6'b100011: begin  // LW (Load Word)
                mem_to_reg = 1;
                alu_src = 1;
                reg_write = 1;
                alu_op = 2'b00;
            end
            6'b101011: begin  // SW (Store Word)
                mem_write = 1;
                alu_src = 1;
                alu_op = 2'b00;
            end
            6'b000100: begin  // BEQ (Branch if Equal)
                branch = 1;
                alu_op = 2'b01;
            end
            6'b001000: begin  // ADDI (Add Immediate)
                alu_src = 1;
                reg_write = 1;
                alu_op = 2'b00;
            end
            default: begin
                // Instrucción no reconocida, mantener todas las señales en cero
            end
        endcase
    end

endmodule
