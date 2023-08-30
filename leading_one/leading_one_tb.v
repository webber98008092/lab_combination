`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/05/2023 02:30:56 AM
// Design Name: 
// Module Name: leading_one_tb
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


module leading_one_tb();
    wire signed [4:0] index;
    reg signed [4:0] index_golden;
    reg [8:0] a;

    leading_one U(.a(a),.index(index));
    
    integer i;
    initial begin
        a = 9'd0;
        for(i=0;i<512;i=i+1) begin
            leading_one_golden(a,index_golden);
            #5
            if (index != index_golden)
                $display("Error!! number = %b index_golden = %d index = %d", a, index_golden, index);
            else
                $display("number = %b leading one at %d", a, index);
            #5 a = a + 1;     //from 0 to 511
        end
    end
    
    task leading_one_golden(input[8:0] a , output signed [4:0] index);
        begin
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
    endtask
    
endmodule
