`timescale 1ns / 1ps

module MUXs(PC_1, Inst, A_data, B_data, CS, MA, MB, MD, MA_out, MB_out, MD_out, F_out, Mem_out, stack_out);
    
    input PC_1, Inst, A_data, B_data, CS, MD, MA, MB, F_out, Mem_out, stack_out;
    output MA_out, MB_out, MD_out;
    
    reg [15:0] MA_out, MB_out, MD_out;
    wire [15:0] A_data, B_data, PC_1;
    wire CS;
    wire [15:0] Inst;
    wire MA, MB;
    wire [1:0] MD;
    wire [15:0] F_out, Mem_out, stack_out;
    
    always@(*)begin
        case(MA)
            1'b0: MA_out = A_data;
            1'b1: MA_out = Inst[11:0];
        endcase
        
        case(MB)
            1'b0: MB_out = B_data;
            //1'b1: MB_out = {CS,Inst[5:0]};
            
            1'b1:begin
                if (CS == 1)begin
                    //MB_out = {Inst[5], Inst[5], Inst[5:0]};
                    MB_out =  {1'b0,1'b0,1'b0,1'b0,Inst[11:0]};
                end
                
                else MB_out =  PC_1;
                    //MB_out = {1'b0, 1'b0, Inst[5:0]};
                    
                
            end
        endcase
        
        case(MD)
            2'b00: MD_out = F_out;
            2'b01: MD_out = Mem_out;
            2'b10: MD_out = stack_out;
             
        endcase
    end
endmodule
