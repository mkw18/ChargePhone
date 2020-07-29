library verilog;
use verilog.vl_types.all;
entity mechine is
    port(
        CLK             : in     vl_logic;
        startSet        : in     vl_logic;
        num             : in     vl_logic_vector(4 downto 0);
        start           : in     vl_logic;
        clear           : in     vl_logic;
        enter           : in     vl_logic;
        money           : out    vl_logic_vector(7 downto 0);
        restime         : out    vl_logic_vector(7 downto 0)
    );
end mechine;
