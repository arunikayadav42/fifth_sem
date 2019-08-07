library verilog;
use verilog.vl_types.all;
entity mux4 is
    generic(
        bitwidth        : integer := 32
    );
    port(
        s               : in     vl_logic_vector(1 downto 0);
        d0              : in     vl_logic_vector;
        d1              : in     vl_logic_vector;
        d2              : in     vl_logic_vector;
        d3              : in     vl_logic_vector;
        y               : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of bitwidth : constant is 1;
end mux4;
