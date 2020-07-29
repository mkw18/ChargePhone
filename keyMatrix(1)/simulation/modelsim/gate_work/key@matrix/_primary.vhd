library verilog;
use verilog.vl_types.all;
entity keyMatrix is
    port(
        CLK             : in     vl_logic;
        C               : in     vl_logic_vector(3 downto 0);
        R               : out    vl_logic_vector(3 downto 0);
        startSet        : out    vl_logic;
        num             : out    vl_logic_vector(4 downto 0);
        start           : out    vl_logic;
        clear           : out    vl_logic;
        enter           : out    vl_logic
    );
end keyMatrix;
