`timescale 1ns / 1ps

module branch_detect(BS_O, RW_b, BS_b, MW_b);
    input BS_O;
    output RW_b,BS_b,MW_b;
    reg RW_b, MW_b, BS_b;
    wire [1:0] BS_O;
    

    always@(*)begin
        RW_b = !(BS_O[0] || BS_O[1]);
        BS_b = !(BS_O[0] || BS_O[1]);
        MW_b = !(BS_O[0] || BS_O[1]);
    end
    
endmodule
