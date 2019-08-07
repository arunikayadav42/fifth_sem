library verilog;
use verilog.vl_types.all;
entity mem32 is
    generic(
        BASE_ADDRESS    : vl_logic_vector(0 to 24) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        mem_read        : in     vl_logic;
        mem_write       : in     vl_logic;
        address         : in     vl_logic_vector(31 downto 0);
        data_in         : in     vl_logic_vector(31 downto 0);
        data_out        : out    vl_logic_vector(31 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BASE_ADDRESS : constant is 1;
end mem32;
