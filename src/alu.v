module ALU_4bit(
    input [3:0] A, 
    input [3:0] B, 
    input [3:0] ALU_Sel,
    output reg [3:0] ALU_Out,
    output reg Carryout,
    output reg Overflow,
    output reg Zero,
    output reg Division_by_zero,
    output reg FirstBit
);

always @(*)
begin
    Carryout = 0;
    Overflow = 0;
    Division_by_zero = 0;
    Zero = 0;
    FirstBit = 0;
    
    case(ALU_Sel)
        4'b0000: {Carryout, ALU_Out} = A + B;          // Addition
        4'b0001: {Carryout, ALU_Out} = A - B;          // Subtraction
        4'b0010: begin                                // Multiplication
                     ALU_Out = A * B; 
                     if (A * B > 4'b1111) Overflow = 1;
                 end
        4'b0011: begin                                // Division
                     if (B != 0) ALU_Out = A / B;
                     else Division_by_zero = 1;
                 end
        4'b0100: ALU_Out = A % B;                     // Modulo
        4'b1000: ALU_Out = A & B;                     // Logical AND
        4'b1001: ALU_Out = A | B;                     // Logical OR
        4'b1010: ALU_Out = A ^ B;                     // Logical XOR
        4'b1011: ALU_Out = ~(A | B);                  // Logical NOR
        4'b1100: ALU_Out = ~(A & B);                  // Logical NAND
        4'b1101: ALU_Out = ~(A ^ B);                  // Logical XNOR				21
        4'b1110: ALU_Out = (A > B) ? 4'b0001 : 4'b0000; // Greater
        4'b1111: ALU_Out = (A == B) ? 4'b0001 : 4'b0000; // Equality
        default: ALU_Out = 4'b0000;
    endcase
    
    Zero = (ALU_Out == 4'b0000) ? 1 : 0;
    FirstBit = ALU_Out[0];
end

endmodule							

