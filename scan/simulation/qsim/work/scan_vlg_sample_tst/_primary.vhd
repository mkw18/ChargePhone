library verilog;
use verilog.vl_types.all;
entity scan_vlg_sample_tst is
    port(
        C               : in     vl_logic_vector(3 downto 0);
        CLK             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end scan_vlg_sample_tst;
