`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2023 07:55:14 AM
// Design Name: 
// Module Name: binary2bcd_double_dabble_tb
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


module binary2bcd_double_dabble_tb();
    reg [7:0] in_binary;
    wire [15:0] unpacked_bcd;
    wire [7:0] packed_bcd;
    
    binary2bcd_double_dabble U(.in_binary(in_binary),.unpacked_bcd(unpacked_bcd),.packed_bcd(packed_bcd));
    integer i;
    
    initial begin
        in_binary = 8'd0;
        for(i=0;i<=99;i=i+1)
            #10 in_binary = in_binary + 1;
    end 
    
endmodule
