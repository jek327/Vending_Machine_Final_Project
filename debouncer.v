`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:  
// 
// Create Date: 10/14/2025 03:11:26 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(input button, clk, output reg clean);
    //internal counter and tc sig
    reg [21:0] counter;
    wire tc;
    
    //reset abd increment counter
    always @ (posedge clk) begin
        if(~button)
            counter <= 22'b0000000000000000000000;
        else
            counter <= counter + 22'b0000000000000000000001;
    end
    
    assign tc = (counter == 22'b1111111111111111111111);
    
    //change output sig
    //when counter reaches max
    always @ (posedge clk) begin
        if(~tc)
            clean <= 1'b0;
        else if(tc)
            clean <= 1'b1;
    end
endmodule