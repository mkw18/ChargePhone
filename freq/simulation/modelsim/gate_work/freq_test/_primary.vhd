library verilog;
use verilog.vl_types.all;
entity freq_test is
    generic(
        Tburst          : integer := 100000000;
        Ton             : integer := 1;
        Toff            : integer := 1
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of Tburst : constant is 1;
    attribute mti_svvh_generic_type of Ton : constant is 1;
    attribute mti_svvh_generic_type of Toff : constant is 1;
end freq_test;
