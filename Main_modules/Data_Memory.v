`timescale 1ns / 1ps

module data_memory(clk, address, write_enable, data_input, data_output);
    input clk;
    input [11:0] address;
    input write_enable;
    input  [15:0] data_input;
    output [15:0] data_output;
    
    //wire write_enable;
    reg [15:0] memory [4095:0];
    reg [15:0] data_output;
    integer i;
    
    initial begin
        for ( i=0 ; i<4096 ; i=i+1)begin
        
            case(i)
                i: memory[i] = 0;
            
            endcase
        end
        
        
        memory[12'h301] = 16'h1111;
        memory[12'h302] = 16'h2222;
        
        
        memory[12'h7f1] = 16'd131;
        memory[12'h7f2] = 16'd82;
        memory[12'h7f3] = 16'd77;
        memory[12'h7f4] = 16'hFFCE;
        memory[12'h7f5] = 16'd452;
        memory[12'h7f6] = 16'd241;
        
        memory[12'h0000] = 16'hABCD;
        memory[12'h0100] = 16'h0000;
        memory[12'h0101] = 16'h0001;
        memory[12'h0102] = 16'h0002;
        memory[12'h0103] = 16'h0003;
        memory[12'h0104] = 16'hFFFF;
        memory[12'h0105] = 16'hAAAA;
    end
    
    
    
    always @(negedge clk) begin
        if(write_enable)begin
            memory[address] = data_input ;
        end
        
        data_output = memory[address];
    end
    
    
    
endmodule