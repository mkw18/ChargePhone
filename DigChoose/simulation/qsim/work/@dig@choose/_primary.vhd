library verilog;
use verilog.vl_types.all;
entity DigChoose is
    port(
        CLK             : in     vl_logic;
        money           : in     vl_logic_vector(4 downto 0);
        restime         : in     vl_logic_vector(5 downto 0);
        dig             : out    vl_logic_vector(3 downto 0);
        num             : out    vl_logic_vector(3 downto 0)
    );
end DigChoose;
