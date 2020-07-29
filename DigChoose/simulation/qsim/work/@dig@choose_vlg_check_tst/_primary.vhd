library verilog;
use verilog.vl_types.all;
entity DigChoose_vlg_check_tst is
    port(
        dig             : in     vl_logic_vector(3 downto 0);
        num             : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end DigChoose_vlg_check_tst;
