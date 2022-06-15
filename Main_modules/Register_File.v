`timescale 1ns / 1ps

module register_file(clk, A_addr, B_addr, D_addr, data_in, write_enable, A_data, B_data, register_A, register_B);
    input clk, write_enable;
    input [2:0] A_addr, B_addr, D_addr;
    input [15:0] data_in;
    output [15:0] A_data, B_data, register_A, register_B;
   
    reg [15:0] memory [7:0];
    reg [15:0] A_data, register_A, register_B;
    reg [15:0] B_data;
    integer i;
    
    initial begin
        for(i=1 ; i<8 ; i=i+1)begin
            memory[i] = i;
            //memory_B[i] <= i;
            #0.01;
        end
    end
    always@(negedge clk)begin
        memory[0] = 0;
        A_data = memory[A_addr];
        B_data = memory[B_addr];
        register_A = memory[1];
        register_B = memory[2];
    end
  
    always@(posedge clk)begin
    
        if (write_enable)begin
            memory [D_addr] = data_in;
            //write_enable = 0;
        end
    end
    
    always@(*)begin
    
        
    
    end    
    
    
endmodule
