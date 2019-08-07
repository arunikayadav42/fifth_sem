
module mux3(s, d0, d1, d2, y);
    parameter bitwidth=32;
    input  [1:0]          s;
    input  [bitwidth-1:0] d0, d1, d2;
    output [bitwidth-1:0] y;
    reg    [bitwidth-1:0] y;

    always @(d0 or d1 or d2 or s) 
        case ( s)
           2'd0 : y = d0;
	    2'd1 : y = d1;
	    2'd2 : y = d2;
           default : y = {bitwidth{1'bx}};
       endcase
endmodule
