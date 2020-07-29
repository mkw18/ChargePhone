library verilog;
use verilog.vl_types.all;
entity showall is
    port(
        CLK             : in     vl_logic;
        money           : in     vl_logic_vector(7 downto 0);
        restime         : in     vl_logic_vector(7 downto 0);
        dig             : out    vl_logic_vector(3 downto 0);
        seg             : out    vl_logic_vector(6 downto 0)
    );
end showall;
