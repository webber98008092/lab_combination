`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 08:29:35 AM
// Design Name: 
// Module Name: integer_division_modulus
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module integer_division_modulus(
    input [31:0] a,
    output reg [31:0] r
    );
    
    always@ * begin
        r = a - 1234101 * DivByConstant(a);
    end
    
    function [31:0] DivByConstant;
        input [31:0] a;
        DivByConstant = a / 1234101;
    endfunction
    
endmodule
