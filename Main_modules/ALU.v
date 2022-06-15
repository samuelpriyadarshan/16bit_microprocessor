`timescale 1ns / 1ps

module ALU(Z, func_sel, Shift, A, B, F, zero, negative, carry, overflow);
    input [3:0] func_sel; 
    input [2:0] Shift;
    input [15:0]  A, B; 
    input Z;
    output [15:0] F; 
    output zero, negative, carry, overflow;
    
    wire [15:0] A,B;
    wire Z;
    reg [15:0] F;
    reg overflow, zero;
    reg [16:0] F_w_carry;
    reg carry, negative;
    
    /*parameter ADD = 4'd1,
    SUB = 4'd2,
    XOR = 4'd3,
    OR = 4'd4,
    NOT = 4'd5,
    LSL = 4'd6,
    SLT = 4'd7,
    AND = 4'd8,
    PASSB = 4'd0,
    PASSA = 4'd9;*/
    
    parameter   ADD = 4'd1,
                AND = 4'd2,
                CLA = 4'd3,
                CLB = 4'd4,
                CMB = 4'd5,
                INCB = 4'd6,
                DECB = 4'd7,
                CLC = 4'd8,
                CLZ = 4'd9,
                //SC = 4'd10,
                INCA = 4'd10,
                SZ = 4'd13,
                CMA = 4'd14,
                LSH = 4'd15;
                
    
        
           
    always@(*)begin
        carry <= 0;
        negative <= 0;
        zero = 0;
        overflow <= 0;
        
        
        
        
        
        case(func_sel)
            /*ADD: begin 
                F_w_carry = A+B;
            end
            
            SUB:begin
                F_w_carry = A + (~B) + 1;
                F = F_w_carry[15:0];
            end
            
            XOR:begin
                F_w_carry = A^B;
           end
            
            OR:begin
                F_w_carry = A|B;
            end
            
            NOT:begin
                F_w_carry = ~A[15:0];
                F_w_carry[8] <= 0;
            end
            
            LSL:begin
                F_w_carry = A << Shift;
                F = F_w_carry[15:0];
            end
            
            SLT:begin
                F = (A<B) ? 1 : 0 ;
                F_w_carry = (A<B) ? 1 : 0 ;
           end
            AND:begin
                F_w_carry= A & B ;
            end
            
            PASSA: F_w_carry = B;
            PASSB: F_w_carry = A;*/
            
            ADD: begin 
                //F_w_carry = A;
                //F = A + B;
                F_w_carry = A+B;
                //zero = (F == 16'h0000) ? 1 : 0;
                //zero = 0;
            end
            
            AND:begin
                F_w_carry = A & B ;
                //zero = 0;
                //zero = F ? 0 : 1;
            end
            
            CLA:begin
                F_w_carry = 0;
                //zero = 0;
                //zero = F ? 0 : 1;
            end
            
            CLB:begin
                F_w_carry = 0;
                //zero = 0;
                //zero = F ? 0 : 1;
            end
            
            CMB:begin
                F_w_carry = ~{B};
                //zero = 0;
                //zero = F ? 0 : 1;
                //F_w_carry[16] = 0;
            end
            
            INCB: begin
                F_w_carry = B + 1;
                //zero = F ? 0 : 1;
                //zero = 0;
            end
            
            DECB: begin
                F_w_carry = B - 1;
                //zero = F ? 0 : 1;
                //zero = 0;
            end
            
            
            
            CLZ:begin
                //F_w_carry = 0;
                //zero = 0;
            end
            
            
            
            
            
            SZ: begin
                //if (Z == 1) 
                //zero = 1;
                //else zero = 1;           
            end
            
            CMA:begin
                F_w_carry = ~{A};
                
            end
            
            
            LSH: begin
                F_w_carry = A << 1;
            end
            
            
            INCA:begin
                F_w_carry = A + 1;
            end
        
        endcase
        
        //if((A || B || F) == 12'd0)begin zero = 1; end
        F = F_w_carry[15:0];
        //zero = F ? 0 : 1;
        //zero = (F == 16'h0000) ? 0 : 1;
        //zero = ~(|F);
        negative = F[15];
        carry = F_w_carry[16]; 
        overflow = F_w_carry[16] ^ F_w_carry[15];
        
    end
    
    
    
endmodule