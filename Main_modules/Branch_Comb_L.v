`timescale 1ns / 1ps

module branch_seq(BS, zero, PS, PC, BrA, RAA, MC_out, stack_address, ISR_reg);
    
    input BS, zero, PS, PC, BrA, RAA , stack_address, ISR_reg;
    output [11:0] MC_out;
    
    
    wire [12:0] stack_address, ISR_reg;
    wire [2:0] BS;
    wire zero, PS;
    wire [11:0] RAA, BrA, PC;
    
    
    reg [2:0] MC;
    reg [11:0] MC_out;
    
    always@(*)begin
        
        MC[0] <= BS[0] && (BS[1] || (PS ^ zero));
        MC[1] <= BS[1];
        MC[2] <= BS[2];
        
        case(MC)
            3'b000: MC_out= PC + 1'b1; 
            3'b010: MC_out= RAA;
            3'b001: MC_out= PC + 2'd2;
            3'b011: MC_out= stack_address;
            3'b100: MC_out= ISR_reg;
        endcase
        
        
    end
    
endmodule
