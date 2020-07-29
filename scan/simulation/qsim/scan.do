onerror {quit -f}
vlib work
vlog -work work scan.vo
vlog -work work scan.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.scan_vlg_vec_tst
vcd file -direction scan.msim.vcd
vcd add -internal scan_vlg_vec_tst/*
vcd add -internal scan_vlg_vec_tst/i1/*
add wave /*
run -all
