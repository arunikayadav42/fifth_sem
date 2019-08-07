//------------------------------------------------
// mipstest.v
// Testbench for MIPS processor
//------------------------------------------------

module tb_mips();

  reg         clk;
  reg         reset;

  wire [31:0] writedata, dataadr;
  wire memwrite;

  
  
  // instantiate device to be tested
  
 mips_multi dut (clk, reset);
  
  //top dut(clk, reset, writedata, dataadr, memwrite);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  
  
endmodule



