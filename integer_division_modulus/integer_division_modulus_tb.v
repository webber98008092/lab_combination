`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 08:36:18 AM
// Design Name: 
// Module Name: integer_division_modulus_tb
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


module integer_division_modulus_tb();
    
    reg [31:0] a;
    wire [31:0] r;
    
    integer_division_modulus U(.a(a),.r(r));
    
    integer i;
    
    initial begin
        a = 32'd1234101;
        for(i=1234101;i<=2468202;i=i+1) begin
            #10 a = a + 1;
        end
    end

endmodule
