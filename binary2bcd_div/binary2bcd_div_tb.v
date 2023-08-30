`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/06/2023 09:12:01 AM
// Design Name: 
// Module Name: binary2bcd_div_tb
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


module binary2bcd_div_tb();

    reg [13:0] in_binary;
    reg [15:0] packed_bcd_sw;    //golden model
    wire [15:0] packed_bcd_hw;
    
    binary2bcd_div U(.in_binary(in_binary),.packed_bcd(packed_bcd_hw));
    
    integer i;
    
    initial begin
        in_binary = 14'd0;
        for(i=0;i<=9999;i=i+1) begin
            binary2bcd_software(in_binary,packed_bcd_sw);  //assign value to packed_bcd_sw, so its type should be reg
            if(packed_bcd_hw != packed_bcd_sw)
                $display("Error at %d in_binary = %d packed_bcd_hw = %b packed_bcd_sw = %b", i, in_binary, packed_bcd_hw, packed_bcd_sw);
            #160 in_binary = in_binary + 1; 
        end
    end 

    task binary2bcd_software;
      input [13:0] in_binary;
      output reg [15:0] packed_bcd;
      integer packed_bcd_tmp;
      integer in_binary_tmp;
      integer r;
    
      begin
        in_binary_tmp = in_binary;
    
        r = in_binary_tmp % 10;
        packed_bcd_tmp = r;
        in_binary_tmp = in_binary_tmp / 10;
    
        r = in_binary_tmp % 10;
        packed_bcd_tmp = r*16'b10000 + packed_bcd_tmp;
        in_binary_tmp = in_binary_tmp / 10;
    
        r = in_binary_tmp % 10;
        packed_bcd_tmp = r*16'b100000000 + packed_bcd_tmp;
        in_binary_tmp = in_binary_tmp / 10;
    
        r = in_binary_tmp % 10;
        packed_bcd_tmp = r*16'b1000000000000 + packed_bcd_tmp;
    
        packed_bcd = packed_bcd_tmp;
      end
    endtask

endmodule
