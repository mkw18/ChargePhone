library verilog;
use verilog.vl_types.all;
entity scan_vlg_check_tst is
    port(
        R               : in     vl_logic_vector(3 downto 0);
        startSet        : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end scan_vlg_check_tst;
