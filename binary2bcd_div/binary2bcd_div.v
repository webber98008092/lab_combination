`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 08:44:42 AM
// Design Name: 
// Module Name: binary2bcd_div
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


module binary2bcd_div(
    input [13:0] in_binary,
    output reg [15:0] packed_bcd
    );
    reg [3:0] digit_1;
    reg [3:0] digit_2;
    reg [3:0] digit_3;
    reg [3:0] digit_4;
    reg [13:0] a;
    
    always@* begin
        a = in_binary;
        digit_1 = get_digit(a);
        a = a/13'd10;
        digit_2 = get_digit(a);
        a = a/13'd10;
        digit_3 = get_digit(a);
        a = a/13'd10;
        digit_4 = get_digit(a);
        a = a/13'd10;
        packed_bcd = {digit_4, digit_3, digit_2, digit_1};
        
    end
    
    function [3:0] get_digit;
        input [13:0] a;
        reg [13:0] temp;
        begin
            temp = a-10*(a/10);
            get_digit = temp[3:0];
        end
    endfunction
    
endmodule
