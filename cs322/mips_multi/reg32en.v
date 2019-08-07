
module reg32en (clk, reset, enable, d_in, d_out);
    input       	clk, reset, enable;
    input	[31:0]	d_in;
    output 	[31:0] 	d_out;
    reg 	[31:0]	 d_out;
   
    always @(posedge clk)
    begin
        if (reset) d_out <= 0;
        else if (enable) d_out <= d_in;
    end

endmodule
	
