transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {mechine.vo}

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/projects/2018011501eda2/ChargePhone/mechine {C:/altera/13.0sp1/projects/2018011501eda2/ChargePhone/mechine/mechine_test.v}

vsim -t 1ps -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  mechine_test

add wave *
view structure
view signals
run -all
