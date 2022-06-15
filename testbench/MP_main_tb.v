`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2021 11:18:21 AM
// Design Name: 
// Module Name: MCU_tb
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


module MCU_tb;
    
    //input clk_wire;
    //output ALU_out;
    
    reg clk, reset, interrupt ;
    wire [15:0] REGISTER_A, REGISTER_B;
    
    //reg reset;
    MP_main MCU_test(.clk(clk), .regf_A(REGISTER_A), .regf_B(REGISTER_B), .reset(reset), .interrupt(interrupt));
    
    always #10 clk = ~ clk;
    initial begin
            clk = 0;
            reset=1;
            interrupt = 0;
            #100;
            reset = 1;
            #100;
            reset = 0;
            #3000;
            $finish;
            //reset = 0;
            //#110; 
            //reset = 1;
            
            
    end
endmodule
