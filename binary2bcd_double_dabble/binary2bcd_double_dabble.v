`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/07/2023 07:25:41 AM
// Design Name: 
// Module Name: binary2bcd_double_dabble
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
`define N 8

module binary2bcd_double_dabble(
    input [7:0] in_binary,
    output reg [15:0] unpacked_bcd,
    output reg [7:0] packed_bcd
    );
    reg [15:0] scratch_pad_temp1;
    reg [15:0] scratch_pad_temp2;
    reg [15:0] scratch_pad_temp3;
    wire [3:0] zero_4 = 4'd0;
    integer i;
    
always @* begin
    scratch_pad_temp1 = {8'b0, in_binary};  //MSB to MSB-7 should be assign 0
    scratch_pad_temp2 = scratch_pad_temp1;
    for(i=1;i<`N;i=i+1)
        scratch_pad_temp2 = double_dabble(scratch_pad_temp2);
    scratch_pad_temp3 = scratch_pad_temp2 << 1;
    
    packed_bcd = scratch_pad_temp3[15:8];
    unpacked_bcd = {zero_4, scratch_pad_temp3[15:12], zero_4, scratch_pad_temp3[11:8]};
end 
    
    
    function [15:0] double_dabble;
        input [15:0] scratch_pad;
        reg [15:0] result;
        reg [15:0] shifted_scratch;
        begin
            shifted_scratch = scratch_pad << 1;
            if(shifted_scratch[11:8] > 4'b0100)
                result = {shifted_scratch[15:12], shifted_scratch[11:8] + 4'b0011, shifted_scratch[7:0]};
            else
                result = shifted_scratch;
            double_dabble = result;
        end 
    endfunction
    
endmodule
