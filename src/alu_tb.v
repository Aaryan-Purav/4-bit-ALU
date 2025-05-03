`timescale 1ns / 1ps

module alu_tb;
    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg [2:0] Op; // ALU operation selector
    
    // Outputs
    wire [3:0] Result;
    wire Zero;
    
    // Instantiate the ALU
    alu uut (
        .A(A),
        .B(B),
        .Op(Op),
        .Result(Result),
        .Zero(Zero)
    );
    
    // Stimulus process
    initial begin
        // Initialize inputs
        A = 4'b0000;
        B = 4'b0000;
        Op = 3'b000;
        
        // Test Case 1: ADD operation
        #10 A = 4'b0101; B = 4'b0011; Op = 3'b000; // 5 + 3 = 8
        
        // Test Case 2: SUB operation
        #10 A = 4'b0110; B = 4'b0010; Op = 3'b001; // 6 - 2 = 4
        
        // Test Case 3: AND operation
        #10 A = 4'b1100; B = 4'b1010; Op = 3'b010; // 1100 & 1010 = 1000
        
        // Test Case 4: OR operation
        #10 A = 4'b1100; B = 4'b1010; Op = 3'b011; // 1100 | 1010 = 1110
        
        // Test Case 5: XOR operation
        #10 A = 4'b1100; B = 4'b1010; Op = 3'b100; // 1100 ^ 1010 = 0110
        
        // End the simulation
        #10 $finish;
    end
endmodule
