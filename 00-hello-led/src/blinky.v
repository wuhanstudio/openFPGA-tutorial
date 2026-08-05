module blinky (
    input  clk, 
    input  rst, 
    output led
);
    reg  [2:0] cnt ;
    wire clk_1h;

    divide #(.WIDTH(32),.N(12000000)) u2 (
        .clk(clk),
        .rst_n(rst),
        .clkout(clk_1h)
    );                             

    always @(posedge clk_1h or negedge rst)
    begin
        if (!rst)
            cnt <= 0;
        else
            cnt <= cnt +1;
    end

    assign led = cnt[0];

endmodule
