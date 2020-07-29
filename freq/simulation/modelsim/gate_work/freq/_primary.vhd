library verilog;
use verilog.vl_types.all;
entity freq is
    port(
        CLK             : in     vl_logic;
        OCLK            : out    vl_logic
    );
end freq;
