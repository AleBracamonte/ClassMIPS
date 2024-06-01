/*
 * Autor: Alejandro Bracamonte
 * Fecha: 01 de junio de 2024
 */

// Módulo ALUDecoder (Decodificador de señales de control para la ALU)
// Decodifica las señales de control para la ALU basadas en ALUOp y funct.
module ALUDecoder (
    input  logic [5:0] funct,       // Campo funct de la instrucción R-type
    input  logic [1:0] alu_op,      // Señal de operación de la ALU desde el controlador principal
    output logic [3:0] alu_control  // Señal de control para la ALU
);

    // Codificación de las operaciones de la ALU
    typedef enum logic [3:0] {
        AND_OP  = 4'b0000,
        OR_OP   = 4'b0001,
        ADD_OP  = 4'b0010,
        SUB_OP  = 4'b0110,
        SLT_OP  = 4'b0111,
        NOR_OP  = 4'b1100,
        LUI_OP  = 4'b1000,
        MUL_OP  = 4'b1001,
        DIV_OP  = 4'b1010,
        MOD_OP  = 4'b1011
    } alu_ops_t;

    always @* begin
        case (alu_op)
            2'b00: alu_control = ADD_OP;  // LW o SW: se realiza una suma
            2'b01: alu_control = SUB_OP;  // BEQ: se realiza una resta
            2'b10: begin
                case (funct)
                    6'b100000: alu_control = ADD_OP;  // ADD
                    6'b100010: alu_control = SUB_OP;  // SUB
                    6'b100100: alu_control = AND_OP;  // AND
                    6'b100101: alu_control = OR_OP;   // OR
                    6'b101010: alu_control = SLT_OP;  // SLT
                    6'b011000: alu_control = MUL_OP;  // MUL
                    6'b011010: alu_control = DIV_OP;  // DIV
                    6'b011011: alu_control = MOD_OP;  // MOD
                    6'b100111: alu_control = NOR_OP;  // NOR
                    6'b001111: alu_control = LUI_OP;  // LUI
                    default:   alu_control = 4'bxxxx; // Instrucción no reconocida
                endcase
            end
            default: alu_control = 4'bxxxx; // ALUOp no reconocido
        endcase
    end

endmodule
