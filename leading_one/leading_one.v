`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 02:12:40 AM
// Design Name: 
// Module Name: leading_one
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


module leading_one(
    input [8:0] a,
    output reg signed [4:0] index   //use signed, since index may be -1
    );
    
    always@ * begin
        if(a[8]==1'b1)
            index = 5'd8;
        else if(a[7]==1'b1)
            index = 5'd7;
        else if(a[6]==1'b1)
            index = 5'd6;
        else if(a[5]==1'b1)
            index = 5'd5;
        else if(a[4]==1'b1)
            index = 5'd4;
        else if(a[3]==1'b1)
            index = 5'd3;
        else if(a[2]==1'b1)
            index = 5'd2;
        else if(a[1]==1'b1)
            index = 5'd1;
        else if(a[0]==1'b1)
            index = 5'd0;
        else
            index = 5'd0 - 1;
    end
endmodule
