library verilog;
use verilog.vl_types.all;
entity setNum_vlg_sample_tst is
    port(
        C               : in     vl_logic_vector(3 downto 0);
        R               : in     vl_logic_vector(3 downto 0);
        startSet        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end setNum_vlg_sample_tst;
