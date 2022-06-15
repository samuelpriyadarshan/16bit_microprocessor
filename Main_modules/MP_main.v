`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2021 08:12:12 PM
// Design Name: 
// Module Name: MCU_main
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

module MP_main(clk, regf_A, regf_B, interrupt, reset);
    
    input clk, reset, interrupt;
    output [15:0] regf_A, regf_B;
    wire clk, reset, interrupt;
    reg [11:0] address;
    wire [15:0] instruction;
    reg [15:0] IR;
    reg [15:0] ALU_out, Mem_out;
    
    reg [15:0] Bus_A, Bus_B;
    //reg [15:0] REGISTER_A, REGISTER_B;
    reg [2:0] count ;
    wire [15:0] regf_A, regf_B;
    
    //Ienterrupt
    reg IEN;
    
    //INSTRUCTION DECODER
    wire RW, PS, MW, CS, MA, MB;
    wire [2:0] DA, AA, BA, BS;
    wire [1:0]  MD;
    wire [3:0] FS;
    
    reg RW_O, PS_O, MW_O, CS_O, MA_O, MB_O;
    reg [2:0] DA_O, AA_O, BA_O;
    reg [2:0] BS_O;
    reg [1:0] MD_O;
    reg [3:0] FS_O;
    reg zero_O;
    
    reg RW_O_1;
    reg [1:0] MD_O_1;
    reg [2:0] DA_O_1;
    
    //wire [16:0] Inst;
    
    //BRANCH SELECT
    wire zero;
    reg [11:0] BrA, RAA;
    wire [11:0] MC_out;
    reg [11:0] MC_out_reg;
    
    //DECODE
    reg [11:0] IM ; 
    reg [2:0] SH ,SH_O;
    
    // REGISTER FILE
    wire [15:0] A_data, B_data ;
    
    
    //MUXs
    wire [15:0] MA_out, MB_out, MD_out;
    
    //ALU
    wire [15:0] F;
    wire negative, carry, overflow;
    
    //DATA MEMORY
    wire [15:0] data_output;
    
    reg [11:0] PC, PC_1, PC_2;
    reg [2:0] MC;
    
    //zero flag
    reg Z;
    
    //STACK
    wire push, pop;
    reg push_reg, pop_reg;
    wire [15:0] stack_out;
    reg [15:0] STACK_out;
    reg [15:0] STACK_in;
    
    //ISR
    reg [11:0] ISR_reg;
       
    program_memory pm_main(.address(address), .instruction(instruction));
    branch_seq Branch_sel (.BS(BS), .zero(Z), .PS(PS_O), .PC(PC), .BrA(BrA), .RAA(RAA), .MC_out(MC_out),.stack_address(STACK_out),.ISR_reg(ISR_reg));
    register_file regfile(.clk(clk), .A_addr(AA), .B_addr(BA), .D_addr(DA_O_1), .data_in(MD_out), .write_enable(RW_O_1), .A_data(A_data), .B_data(B_data), .register_A(regf_A), .register_B(regf_B));
    MUXs MUX_inst (.MA_out(MA_out), .MB_out(MB_out), .A_data(A_data), .B_data(B_data), .PC_1(PC), .CS(CS), .Inst(IR), .MA(MA), .MB(MB), .MD_out(MD_out), .F_out(ALU_out), .Mem_out(Mem_out), .MD(MD_O_1), .stack_out(stack_out));
    ALU ALU_test (.Z(Z), .func_sel(FS_O), .Shift(SH_O), .A(Bus_A), .B(Bus_B), .F(F), .zero(zero), .negative(negative), .carry(carry), .overflow(overflow));
    data_memory DM_TEST (.clk(clk), .address(Bus_A), .write_enable(MW_O), .data_input(Bus_B), .data_output(data_output) );
    Inst_Decode Instdecode(.IEN(IEN), .Inst(IR), .RW(RW), .DA(DA), .MD(MD), .BS(BS), .PS(PS), .MW(MW), .FS(FS), .MA(MA), .MB(MB), .AA(AA), .BA(BA), .CS(CS), .push(push), .pop(pop));
    stack stack_test (.count(count), .clk(clk),.data_out(stack_out), .push(push_reg), .pop(pop_reg), .data_in(STACK_in),.rst(reset));
   
    initial begin
        BS_O = 3'b000;
        PC = 12'hffe;
        PC_1 = 12'hffd;
        PC_2 = 12'hffc;
        count = 0;
        IEN = 0;
        
        
        RW_O = 0;
        PS_O = 0; 
        MW_O = 0;
        CS_O = 0;
        MA_O = 0;
        MB_O = 0;
        
        DA_O = 0;
        AA_O = 0;
        BA_O = 0;
            
        //BS_O = 0;
        MD_O = 0;
        FS_O = 0;
            
        RW_O_1 = 0;
        MD_O_1 = 0;
        DA_O_1 = 0;
        
        IR = 16'd255;
        ISR_reg = 12'hff0; //TEST_3
        //ISR_reg = 12'h500; //TEST_5       
        #50;
    end

    always@(posedge clk)begin
        
        IEN = interrupt;
        if(reset) PC = 'd0;
        
        else begin    
                //REGISTER_A = register_A;
                //REGISTER_B = register_B;
                if( /*(Bus_A == 16'd0) |*/ (Bus_B == 16'd0) ) Z = 1;
                else Z=0;
                if(PC == 12'd3 & (count == 3)) IEN = 1; 
                
                if (count < 'd4)begin 
                
                    PC = PC; 
                    //PC_1 = (PC - 1'b1 + count);
                                       
                
                end
                
                else begin
                        
                    if((IEN == 1) | (IR[15:12] == 4'b1011))begin
                        PC = ISR_reg;
                        STACK_in = PC_1+1;
                        push_reg = 1;
                        IEN = 0;
                        if (count == 5)begin IEN = 0; push_reg = 0; end
                    end
                    
                    else begin
                        //if(IR[15:12] == 4'b1001)begin push_reg = 
                        if (IR[15:12] == 4'b0110)begin
                            PC = PC;
                            
                        end
                        //if (IR[15:12] == 4'b1001)
                        else begin
                            count = 0;
                            PC = MC_out;
                            PC_1 = PC;
                            STACK_in = A_data;
                        end
                    end
                end
               
                MC_out_reg = MC_out;
                DA_O <= DA;
                BS_O <= BS;
                RW_O <= RW;
                MW_O <= MW;
                BS_O = BS;
                push_reg = push;
                pop_reg = pop;
                
                //PC
                address = PC;
                
                
                //PC_1
                IR = instruction ;
                SH = IR [2:0];
                IM = IR [11:0];
                
                //PC_2
                Bus_A = MA_out;
                Bus_B = MB_out;
                RAA = Bus_A;
                
                MD_O_1 = MD_O;
                RW_O_1 = RW_O;
                DA_O_1 = DA_O;
                RW_O = 0;
                
                BS_O = BS;
                PS_O = PS; 
                MW_O = MW ;
                FS_O = FS; 
                SH_O = SH;
                 
                RW_O = RW ;
                DA_O = DA ;
                MD_O = MD;
                
                BrA = PC_2 + Bus_B;
                
                ALU_out = (count == 3) ? F : ALU_out;
                Mem_out = data_output;
                STACK_out = stack_out;
                count = count+1;
            end 
            
            
            /*always@(*)begin
                
                if(IEN == 1)begin
                    case(IEN)
                        0: PC = ISR_reg;
                        1: PC = MC_out;
                    endcase
                end
            
            end*/
            
    end
endmodule



