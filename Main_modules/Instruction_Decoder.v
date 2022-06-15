`timescale 1ns / 1ps

module Inst_Decode(Inst, RW, DA, BS, PS, MW, FS, MA, MB, MD, AA, BA, CS, push, pop,IEN);
    input Inst, IEN;
    output RW,DA, MD, BS, PS, MW, FS, MA, MB, AA, BA, CS, push, pop;
    
    wire [15:0] Inst;
    wire IEN;
    reg [2:0] DA, AA, BA;
    reg [1:0] MD;
    reg [2:0] BS;
    reg [3:0] FS;
    reg RW, MW, MA, MB, CS, PS, push, pop;
    reg [3:0]OPCODE;
    
    
    
    always@(*)begin
       OPCODE <= Inst[15:12];
       FS = Inst[11:8];
       push = 0; pop = 0;
       if (IEN == 1) begin RW=0; DA=3'd2; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; push = 1; pop=0; end
       if (OPCODE == 4'b0111) begin
           case(FS)
                4'b0001: begin RW=1; DA=3'd1; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //ADD
                
                4'b0010: begin RW=1; DA=3'd1; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //AND
                
                4'b0011: begin RW=1; DA=3'd1; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //CLA
                
                4'b0100: begin RW=1; DA=3'd2; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //CLB
                
                4'b0101: begin RW=1; DA=3'd2; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //CMB
                
                4'b0110: begin RW=1; DA=3'd2; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //INCB
                
                4'b0111: begin RW=1; DA=3'd2; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //DECB
                
                4'b1000: begin RW=0; DA=3'd2; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //CLC
                
                4'b1001: begin RW=0; DA=3'd2; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //CLZ
                
                4'b1110: begin RW=1; DA=3'd1; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //CMA
                
                4'b1111: begin RW=1; DA=3'd1; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0;end //LSH
                
                4'b1100: begin RW=0; DA=3'd2; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //SC
                
                4'b1101: begin RW=0; DA=3'd2; MD=2'b00; BS=3'b001; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //SZ
                
                4'b1010: begin RW=1; DA=3'd1; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0;end //INCA
                
               
                default: begin RW=0; DA=3'd2; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; end //default
           endcase
            
       end
       
       else begin
           case(OPCODE)
                /*5'b00000:begin RW=0; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=0; FS=4'b0000; MA=0; MB=0; AA=Inst[8:6]; BA=Inst[5:3]; CS = 0; end
                
                5'b00001:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=0; FS=4'b0010; MA=0; MB=0; AA=Inst[8:6]; BA=Inst[5:3]; CS = 0; end //SUB
                
                5'b00010:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=2'b11; PS=0; MW=0; FS=4'b0000; MA=1; MB=1; AA=Inst[8:6]; BA=Inst[5:3]; CS = 1; end //JML
                
                5'b00011:begin RW=0; DA=Inst[11:9]; MD=0; BS=2'b01; PS=0; MW=0; FS=4'b0000; MA=1; MB=1; AA=Inst[8:6]; BA=Inst[5:3]; CS=1 ; end //BZ
                
                5'b00100:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=0; FS=4'b0001; MA=0; MB=1; AA=Inst[8:6]; BA=Inst[5:3]; CS = 1; end //ADI
                
                //5'b00101:begin RW=; DA=; MD=; BS=; PS=; MW=; FS=; MA=; MB=; AA=; BA=; CS = ; end //OUT
                
                5'b00110:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=0; FS=4'b0111; MA=0; MB=0; AA=Inst[8:6]; BA=Inst[5:3]; CS = 0; end //SLT
                
                5'b00111:begin RW=1; DA=Inst[11:9]; MD=2'b01; BS=2'b00; PS=0; MW=0; FS=4'b0000; MA=0; MB=0; AA=Inst[8:6]; BA=Inst[5:3]; CS = 0; end //LD
                
                5'b01000:begin RW=1'b0; DA=Inst[11:9]; MD=2'b00; BS=2'b11; PS=1'b0; MW=1'b0; FS=4'b0000; MA=1; MB=1; AA=Inst[8:6]; BA=Inst[5:3]; CS = 1'b1; end //JMP
                
                5'b01001:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=0; PS=0; MW=0; FS=4'b0001; MA=0; MB=1; AA=Inst[8:6]; BA=Inst[5:3]; CS = 1; end //AIU
                
                5'b01010:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=0; FS=4'b0011; MA=0; MB=0; AA=Inst[8:6]; BA=Inst[5:3]; CS = 0; end //XOR
                
                //5'b01011:begin RW=; DA=; MD=; BS=; PS=; MW=; FS=; MA=; MB=; AA=; BA=; CS = ; end //IN
                
                5'b01100:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=0; FS=4'b1000; MA=0; MB=1; AA=Inst[8:6]; BA=Inst[5:3]; CS = 1; end //ANI
                
                5'b01101:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=0; FS=4'b0101; MA=0; MB=0; AA=Inst[8:6]; BA=Inst[5:3]; CS = 0; end //NOT
                
                5'b01110:begin RW=0; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=1; FS=4'b0000; MA=0; MB=0; AA=Inst[8:6]; BA=Inst[5:3]; CS = 0; end //STR
                
                5'b01111:begin RW=0; DA=Inst[11:9]; MD=2'b00; BS=2'b01; PS=1; MW=0; FS=4'b0000; MA=1; MB=1; AA=Inst[8:6]; BA=Inst[5:3]; CS = 1; end //BNZ
                
                5'b10000:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=0; FS=4'b0001; MA=0; MB=0; AA=Inst[8:6]; BA=0; CS = 0; end //MOV
                
                5'b10001:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=0; FS=4'b0110; MA=0; MB=0; AA=Inst[8:6]; BA=0; CS = 0; end //LSL
                
                5'b10010:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=0; FS=4'b0100; MA=0; MB=1; AA=Inst[8:6]; BA=0; CS = 1; end //ORI
                
                5'b10011:begin RW=1; DA=Inst[11:9]; MD=2'b00; BS=2'b00; PS=0; MW=0; FS=4'b0001; MA=0; MB=0; AA=Inst[8:6]; BA=Inst[5:3]; CS = 0; end //ADD
                
                //5'b10100:begin RW=0; DA=0; MD=2'b00; BS=2'b10; PS=0; MW=0; FS=4'b0000; MA=0; MB=0; AA=Inst[8:6]; BA=0; CS = 1; end //JMR
    
                default: begin RW=0; DA=Inst[11:9]; MD=0; BS=0; PS=0; MW=0; FS=0; MA=0; MB=0; AA=Inst[8:6]; BA=Inst[5:3]; CS = 0; end*/
                
                //TEMPLATE
                //4'b: begin RW=; DA=3'd; MD= ; BS= ; PS= ; MW= ; MA= ; MB= ; AA=3'd1; BA=3'd2; CS = ; end 
                
                4'b0000: begin RW=1; DA=3'd1; MD=2'b01; BS=3'b000; PS=0; MW=0; MA=1; MB=0; AA=3'd3; BA=3'd4; CS = 1; end //LDA
                
                4'b0001: begin RW=1; DA=3'd2; MD=2'b01; BS=3'b000; PS=0; MW=0; MA=1; MB=0; AA=3'd5; BA=3'd6; CS = 1; end //LDB
                            
                4'b0010: begin RW=0; DA=3'd1; MD=2'b00; BS=3'b000; PS=0; MW=1; MA=1; MB=0; AA=3'd1; BA=3'd1; CS = 1; end //STA
                
                4'b0011: begin RW=0; DA=3'd2; MD=2'b00; BS=3'b000; PS=0; MW=1; MA=1; MB=0; AA=3'd1; BA=3'd2; CS = 1; end //STB
                
                4'b0100: begin RW=0; DA=3'd3; MD=2'b00; BS=3'b010; PS=1'b0; MW=1'b0; MA=1; MB=1; AA=3'd1; BA=3'd2; CS = 1; end //JMP
                
                4'b0101: begin RW=0; DA=3'd1; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; push = 1; pop = 0; end //PUSH
                                                
                4'b1000: begin RW=1; DA=3'd1; MD=2'b10; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; push = 0; pop = 1; end //POP
              
                //4'b1001: begin RW=0; DA=3'd1; MD=2'b00; BS=3'b011; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; push=1; pop=1; end //RET
                
                4'b1010: begin RW=1; DA=3'd2; MD=2'b10; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd1; BA=3'd2; CS = 0; push = 0; pop = 1;end //POPB
                
                4'b1011: begin RW=0; DA=3'd3; MD=2'b00; BS=3'b100; PS=1'b0; MW=1'b0; MA=1; MB=1; AA=3'd1; BA=3'd2; CS = 1;push = 1; pop = 0; end //JSR
                //4'b0101: begin end //JSR
                
                //4'b1010: begin end //PUSH
               
                //4'b1100: begin end //POP
                
                //4'b1100: begin end //ION
                
                //4'b1100: begin end //IOF
                
                //4'b0111: begin RW=1; DA=3'd; MD= ; BS= ; PS= ; MW= ; MA= ; MB= ; AA=3'd1; BA=3'd2; CS = ; end //RET
                
                default: begin RW=0; DA=3'd6; MD=2'b00; BS=3'b000; PS=0; MW=0; MA=0; MB=0; AA=3'd2; BA=3'd4; CS = 0; end //default
                
                            
           endcase
       end
    end
     
endmodule
