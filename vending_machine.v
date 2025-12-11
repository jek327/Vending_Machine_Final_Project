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
