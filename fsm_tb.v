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
