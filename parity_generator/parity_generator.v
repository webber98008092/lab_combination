`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 08:19:54 AM
// Design Name: 
// Module Name: parity_generator
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
`define W 16

module parity_generator(
input [15:0] a,
output reg parity
);
    
integer i;
always@* begin
    parity = 0;
    for(i=0;i<`W;i=i+1)
        parity = parity ^ a[i];
end

endmodule
