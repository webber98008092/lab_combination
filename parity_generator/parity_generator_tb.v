`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/04/2023 09:09:52 AM
// Design Name: 
// Module Name: parity_generator_tb
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

module parity_generator_tb();
wire [0:0]parity_hw;   //generate by parity_generator.v
reg [0:0] parity_sw;   //ideal
reg [15:0] a;

parity_generator U(.a(a),.parity(parity_hw));

integer i;
reg [15:0] temp = 16'b0;

initial begin
    for(i=0;i<65536;i=i+1) begin
        a = temp;
        parity_generator_sw(temp,parity_sw);   //ideal value, we will assign ideal parity value to parity_sw
        #5 
        if(parity_hw != parity_sw)
            $display("a = %b  parity_hw = %b  parity_sw = %b", a, parity_hw, parity_sw);
        #5 temp = temp + 1'b1;
    end
end

task parity_generator_sw(input [15:0] a,output parity);
    integer j;
    begin
        parity = 0;
        for(j=0;j<`W;j=j+1)
            parity = parity ^ a[j];
    end
endtask

endmodule
