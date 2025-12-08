`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2025 11:12:36 AM
// Design Name: 
// Module Name: fsm
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

//will need prob bin2bcd and will need 7 seg stuff
//at the moment i am copying from lab 9 for the fsm
module fsm(
    input clk, rst,
    input nb, db, //do these need values more than 1 bit and the two below as well??
    output reg s,
    output reg r //is reg even needed here (i think is is because we have to set it = to something right) at least r should be
    );
    
    reg [2:0] PS, NS;
    //reg [4:0] partial; //i dont know how much this would be in the bit amount
    
    parameter s0 = 0, s5 = 1, s10 = 2, s15 = 3, s20 = 4, s25 = 5, s30 = 6;
    
    always @(posedge clk or posedge rst) begin
        if(rst)
            PS <= s0;
        else
            PS <= NS;
    end
    
    //this will be the state description
    always @(*) begin
        NS <= PS;
        s <= 1'b0;
        r <= 1'b0;
        
        case(PS)
            s0: begin //this is the idle
                if(db)//dime
                    NS <= s10;
                else if(nb) //nickel
                    NS <= s5;
            end
            
            s5: begin  //this is for 1n
                //partial <= 1'd5;
                if(db) //dime
                    NS <= s15;
                else if(nb) //nickel
                    NS <= s10;  
            end
            
            s10: begin //this is for a 1d or 2n
                //partial <= 2'd10;
                if(db) //dime
                    NS <= s20;
                else if(nb) //nickel
                    NS <= s15; 
            end
            
            s15: begin //this is for 3n or 1d after s5
                //partial <= 2'd15;
                if(db) //dime
                    NS <= s25;
                else if(nb) //nickel
                    NS <= s20; 
            end
            
            s20: begin //this is for 4n or 2d
                //partial <= 2'd20;
                if(db) //dime
                    NS <= s30;
                else if(nb) //nickel
                    NS <= s25; 
            end
            
            s25: begin //this is for 5n or 2d after s5
                //if you add 1 dime to this you will go to s0 and skip s30 (in nahers stuff)
                //partial <= 2'd25;
                //NS <= s0;
                s <= 1'd1;
                //r <= 1'd0;
                //NS <= s0;
            end
            
            s30: begin //this is for change (over paying) and if you did 3d
                //will send the nickel and dime to the idle state
                //partial <= 2'd30;
                r <= 1'd1;
                s <= 1'd1;
                //NS <= s0;
            end
        endcase
    end
     
endmodule
------------------------------------------------------------------------------------------------------------------------
module fsm_tb;

 reg clk, rst, nb, db;
 wire s, r;
 
 fsm dut(.clk(clk), .rst(rst), .nb(nb), .db(db), .s(s), .r(r));
 
 always #10 clk = ~clk;
 
  initial begin
    clk  = 0;
    rst = 1;
    #20;
    rst = 0;
    assign nb = 1'b0;
    assign db = 1'b0;
//    assign nb = 1'b1;
//    #20;
//    assign nb = 1'b0; //s5 = 1
//    #20;
//    assign db = 1'b1;
//    #20;
//    assign db = 1'b0; //s15 = 3
//    #20;
//    assign db = 1'b1;  
//    #20;
//    assign db = 1'b0; //s25 = 5
//    rst = 1;
//    #20;
    assign nb = 1'b1; 
    #20;
    assign nb = 1'b0; //s5 = 1
    rst = 1;
    #20;
    rst = 0;
    assign db = 1'b1;
    #20;
    assign db = 1'b0; //s10 = 2
    #20;
    assign db = 1'b1;
    #20;
    assign db = 1'b0; //s20 = 4
    #20;
    assign db = 1'b1;
    #20;
    assign db = 1'b0; //s30 = 6
    #20;
    rst = 1;
    #20;
    rst = 0;
    assign nb = 1'b1;
    #20;
    assign nb = 1'b0; //s5 = 1
    #20;
    assign db = 1'b1;
    #20;
    assign db = 1'b0; //s15 = 3
    #20;
    assign db = 1'b1;  
    #20;
    assign db = 1'b0; //s25 = 5
//    rst = 1'b1;
//    #20;
//    rst = 1'b0;
    end
 
endmodule
