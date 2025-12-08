`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/08/2025 04:51:28 PM
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(
    input clk, rst,
    input nb, db, 
    output s,
    output r
    );
    
    wire clock_out;
    wire nbd, dbd;
    
    fsm fsm(.clk(clock_out), .rst(rst), .nb(nbd), .db(dbd), .s(s), .r(r));
    clk_divider clk_divider(clk, clock_out);
    debouncer debouncer_nb(.button(nb), .clk(clock_out), .clean(nbd));
    debouncer debouncer_db(.button(db), .clk(clock_out), .clean(dbd));
endmodule
----------------------------------------------------------------------------------------------------------
module vending_machine_tb;
    reg clk, rst, nb, db;
    wire s, r;
 
    vending_machine dut(.clk(clk), .rst(rst), .nb(nb), .db(db), .s(s), .r(r));
 
    initial clk = 0;
    always #10 clk = ~clk;
 
    initial begin
    rst = 1;
    #20;
    rst = 0;
    assign nb = 1'b0;
    assign db = 1'b0;
    #20;
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
    rst = 1'b1;
    #20;
    rst = 1'b0;
    end
endmodule