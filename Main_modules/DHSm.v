`timescale 1ns / 1ps


module DHS_m(DA_O, MA, RW, Comp_A, Comp_B, MB, HA, HB);
    
    input DA_O, MA, RW, Comp_A, Comp_B, MB;
    output HA, HB;
    
    reg HA, HB;
    wire [2:0] DA_O;
    wire MA, MB, Comp_A, Comp_B, RW;
    
    always@(*)begin
        //DHS = () || ();    
        HA = (DA_O[2]||DA_O[1]||DA_O[0]) && RW && Comp_A ;//&& !MA;
        HB = (DA_O[2]||DA_O[1]||DA_O[0]) && RW && Comp_B ;//&& !MB;
    end
    
    
endmodule