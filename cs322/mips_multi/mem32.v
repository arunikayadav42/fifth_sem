

module mem32(clk, mem_read, mem_write, address, data_in, data_out);
  input  clk, mem_read, mem_write;
  input  [31:0] address, data_in;
  output [31:0] data_out;
  reg    [31:0] data_out;

  parameter BASE_ADDRESS = 25'd0; // address that applies to this memory - change if desired

  reg [31:0] mem_array [0:31];
  wire [4:0] mem_offset;
  wire address_select;

  assign mem_offset = address[6:2];  // drop 2 LSBs to get word offset

  assign address_select = (address[31:7] == BASE_ADDRESS);  // address decoding

  always @(mem_read or address_select or mem_offset or mem_array[mem_offset])
  begin

    if (mem_read == 1'b1 && address_select == 1'b1)
    begin
      if ((address % 4) != 0)
          $display($time, " rom32 error: unaligned address %d", address);
      data_out = mem_array[mem_offset];
      $display($time, " reading data: Mem[%h] => %h", address, data_out);
    end
      else data_out = 32'hxxxxxxxx;
  end

  // for WRITE operations
  always @(posedge clk)
  begin
    if (mem_write == 1'b1 && address_select == 1'b1)
    begin
      $display($time, " writing data: Mem[%h] <= %h", address,data_in);
      mem_array[mem_offset] <= data_in;
    end
  end

  // initialize with some arbitrary values

  integer i;
  initial begin
    mem_array[0] = { 6'd35, 5'd0, 5'd2, 16'd36 };            // x00  lw $2, 36($0)    r2=1
    mem_array[1] = { 6'd35, 5'd0, 5'd3, 16'd40 };            // x04  lw $3, 40($0)    r3=2
    mem_array[2] = { 6'd35, 5'd0, 5'd4, 16'd52 };            // x08  lw $4, 52($0)    r4=5
    mem_array[3] = { 6'd0, 5'd0, 5'd0, 5'd5, 5'd0, 6'd32 };  // x0C  add $5, $0, $0   r5=0
    mem_array[4] = { 6'd0, 5'd5, 5'd2, 5'd5, 5'd0, 6'd32 };  // x10  add $5, $5, $1   r5 = r5 + 1
    mem_array[5] = { 6'd0, 5'd4, 5'd5, 5'd6, 5'd0, 6'd42 };  // x14  slt $6, $4, $5  is $5 > 54?
    mem_array[6] = { 6'd4, 5'd6, 5'd0, -16'd3 };             // x18  beq $6, $zero, -3  if not, go back 2
    mem_array[7] = { 6'd43, 5'd0, 5'd5, 16'd64 };            // x1C  sw  $5, 0($0)    MEM[64] = $5
    mem_array[8] = { 6'd2, 26'd0 };                          // x20  j 0              goto 0
    for (i=1; i<7; i=i+1) mem_array[i+8] = i;                // MEM[x24]=1; MEM[x28]=2; , etc. 
  end
endmodule
