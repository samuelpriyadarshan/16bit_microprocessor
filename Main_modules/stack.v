`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2022 02:48:49 PM
// Design Name: 
// Module Name: stack
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


module stack( clk,data_out, push, pop, data_in, rst, count);
    input [15:0] data_in;
    input push, pop,clk,rst;
    input [1:0] count;
    output reg [15:0] data_out;
    
   // reg [15:0] data_out;
   //wire full, empty;
    reg [15:0] stack_memory [11:0];
    //reg [1:0] clk_count,clk_count1;
    reg [11:0] SP;
   
    initial begin
        stack_memory [0] = 0;stack_memory [1] = 0;stack_memory [2] = 0;stack_memory [3] = 0;
        stack_memory [4] = 0;stack_memory [5] = 0;stack_memory [6] = 0;stack_memory [7] = 0;
        stack_memory [8] ='d0;stack_memory [9] ='d0;stack_memory [10] ='d0;stack_memory [11] ='d0;
        SP = 'd1; data_out = 16'd0; //clk_count = 0;
    
    end
    
    
    always@(posedge clk)begin
        
        if(count == 1)begin    
            if (push)begin
                SP <= SP + 1'b1;
                stack_memory[SP] <= data_in;
                            
            end
            
        end
        
        if(count == 0)begin
                        if (pop) begin
                            SP = SP - 1'b1;
                            data_out <= stack_memory[SP] ;
                            
                        end
                end
    end
    
    
endmodule
