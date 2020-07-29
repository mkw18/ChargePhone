library verilog;
use verilog.vl_types.all;
entity DigChoose_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        money           : in     vl_logic_vector(4 downto 0);
        restime         : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end DigChoose_vlg_sample_tst;
