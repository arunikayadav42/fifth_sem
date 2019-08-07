library verilog;
use verilog.vl_types.all;
entity reg32en is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        enable          : in     vl_logic;
        d_in            : in     vl_logic_vector(31 downto 0);
        d_out           : out    vl_logic_vector(31 downto 0)
    );
end reg32en;
