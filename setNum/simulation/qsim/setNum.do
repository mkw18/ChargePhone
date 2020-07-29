onerror {quit -f}
vlib work
vlog -work work setNum.vo
vlog -work work setNum.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.setNum_vlg_vec_tst
vcd file -direction setNum.msim.vcd
vcd add -internal setNum_vlg_vec_tst/*
vcd add -internal setNum_vlg_vec_tst/i1/*
add wave /*
run -all
