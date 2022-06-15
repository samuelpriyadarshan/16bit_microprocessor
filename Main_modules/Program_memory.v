`timescale 1ns / 1ps

module program_memory(address, instruction);
    input [11:0] address;
    output [15:0] instruction;
    
    
    reg [15:0] memory [4095:0];
    reg [15:0] instruction;
    integer i;
    /*initial begin
        
        for(i=0; i<4096 ; i=i+1)begin
            case(i)
            0: memory[i] = 16'b0000000000000000; 
            6: memory[i] = 16'b0000101100101010; 
            8: memory[i] = 16'b0001001100100001; 
            10: memory[i] = 16'b0001101100100001; 
            12: memory[i] = 16'b0010001100101010;
            14: memory[i] = 16'b0010101100101010; 
            16: memory[i] = 16'b0011001100101010; 
            18: memory[i] = 16'b0011101100101010;
            20: memory[i] = 16'b0100001100100001; 
            22: memory[i] = 16'b0100101100101010;
            24: memory[i] = 16'b0101001101101010;
            26: memory[i] = 16'b0101001100101010; 
            28: memory[i] = 16'b0101101100101010; 
            30: memory[i] = 16'b0110001100101010; 
            32: memory[i] = 16'b0110101100101010; 
            34: memory[i] = 16'b0111001100101010;
            36: memory[i] = 16'b0111101100101010; 
            38: memory[i] = 16'b1000101100101010; 
            40: memory[i] = 16'b1001001100101010; 
            42: memory[i] = 16'b1001101100101010; 
            44: memory[i] = 16'b1010001100101010;
            
            default: memory[i] = 16'b0000000000000000;
            endcase
            #0.001;
        end
       end*/
        
        //TEST1
        initial begin
            for(i=0; i<4096 ; i=i+1)begin
                case(i)
                
                    //TEST_1
                    /*
                    0:memory[0] = 16'hFFFF ;
                    2:memory[1] = 16'h7400 ;
                    3:memory[2] = 16'h7300 ;
                    4:memory[3] = 16'h1104 ;
                    5:memory[4] = 16'h0102 ;
                    6:memory[5] = 16'h7500 ;
                    7:memory[6] = 16'h7600 ;
                    8:memory[7] = 16'h7100 ;
                    9:memory[8] = 16'h1103 ;
                    10:memory[9] = 16'h7200 ;
                    11:memory[10] = 16'h2500 ;
                    12:memory[11] = 16'h1500 ;
                    13:memory[12] = 16'h6000 ;
                    14:memory[13] = 16'hFF00 ;
                    15:memory[14] = 16'hFFFD ;
                    16:memory[15] = 16'hFFFE ;
                    17:memory[17] = 16'hFFFE ;
                    default: memory[i] = 16'hFFFF; */
                    //memory[]
                    
                    //TEST_2
                    /*0:memory[0] = 16'hFFFF;
                    2:memory[2] = 16'h7400 ;
                    3:memory[3] = 16'h7300 ;
                    4:memory[4] = 16'h7900 ;
                    5:memory[5] = 16'h1103 ;
                    6:memory[6] = 16'h7100 ;
                    7:memory[7] = 16'h7700 ;
                    8:memory[8] = 16'h7100 ;
                    9:memory[9] = 16'h7d00 ;
                    10:memory[10] = 16'h4007 ;
                    11:memory[11] = 16'h6000 ;*/
                    
                    //TEST_3
                    
                    0:memory[0] = 16'hFFFF;
                    2:memory[2] = 16'h7400 ;
                    3:memory[3] = 16'h7300 ;
                    4:memory[4] = 16'h0104 ;
                    5:memory[5] = 16'h8000 ;
                    6:memory[6] = 16'h6000 ;
                    
                    12'hff1: memory[12'hff1] = 16'h0000;
                    12'hff2: memory[12'hff2] = 16'h1101;
                    12'hff3: memory[12'hff3] = 16'h7100;
                    12'hff4: memory[12'hff4] = 16'h7400;
                    12'hff5: memory[12'hff5] = 16'h9000;
                    
                    //TEST_4
                    /*
                    0:memory[0] = 16'hFFFF;
                    2:memory[2] = 16'h7400 ;
                    3:memory[3] = 16'h7300 ;
                    4:memory[4] = 16'h07f1 ;
                    5:memory[5] = 16'h5000 ;
                    6:memory[6] = 16'h07f2 ;
                    7:memory[7] = 16'h5000 ;
                    8:memory[8] = 16'h07f3 ;
                    9:memory[9] = 16'h5000 ;
                    10:memory[10] = 16'h07f4 ;
                    11:memory[11] = 16'h5000 ;
                    12:memory[12] = 16'h07f5 ;
                    13:memory[13] = 16'h5000 ;
                    14:memory[14] = 16'h07f6 ;
                    15:memory[15] = 16'h5000 ;
                    16:memory[16] = 16'h7300 ;
                    17:memory[17] = 16'hA000 ;
                    18:memory[18] = 16'h7100 ;
                    19:memory[19] = 16'h7d00 ;
                    
                    20:memory[20] = 16'h4011 ;
                    21:memory[21] = 16'h6000 ;
                    */
                    //TEST_5
                    /*0:memory[0] = 16'hFFFF;
                    2:memory[2] = 16'h7400 ;
                    3:memory[3] = 16'h7300 ;
                    4:memory[4] = 16'h1301 ;
                    5:memory[5] = 16'h0302 ;
                    6:memory[6] = 16'h7100 ;
                    7:memory[7] = 16'h7E00 ;
                    8:memory[8] = 16'h7F00 ;
                    9:memory[9] = 16'h6000 ;
                    */
                    /*0:memory[0] = 16'hFFFF;
                    2:memory[2] = 16'h7400 ;
                    3:memory[3] = 16'h7300 ;
                    4:memory[4] = 16'h1301 ;
                    5:memory[5] = 16'h0302 ;
                    6:memory[6] = 16'hB000 ;
                    7:memory[7] = 16'h2500 ;
                    
                    8:memory[8] = 16'h1500 ;
                    9:memory[9] = 16'h6000 ;
                    
                    12'h501:memory[12'h501] = 16'h7100 ;
                    12'h502:memory[12'h502] = 16'h7E00 ;
                    12'h503:memory[12'h503] = 16'h7A00 ;
                    12'h504:memory[12'h504] = 16'h7F00 ;
                    12'h505: memory[12'h505] = 16'h9000;*/
                    
                    
                    //:memory[] = 16'h
                    default: memory[i] = 16'hFFFF;
                    
                endcase
                #0.01;
           end
    end
     
    always@(address)begin
        instruction = memory[address];
    end
    
    
endmodule
