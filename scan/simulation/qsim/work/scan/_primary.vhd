library verilog;
use verilog.vl_types.all;
entity scan is
    port(
        CLK             : in     vl_logic;
        C               : in     vl_logic_vector(3 downto 0);
        R               : out    vl_logic_vector(3 downto 0);
        startSet        : out    vl_logic
    );
end scan;
