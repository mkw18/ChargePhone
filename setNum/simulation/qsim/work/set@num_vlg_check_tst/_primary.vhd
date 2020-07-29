library verilog;
use verilog.vl_types.all;
entity setNum_vlg_check_tst is
    port(
        clear           : in     vl_logic;
        enter           : in     vl_logic;
        num             : in     vl_logic_vector(4 downto 0);
        start           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end setNum_vlg_check_tst;
