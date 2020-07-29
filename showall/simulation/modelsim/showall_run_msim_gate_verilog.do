transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {showall.vo}

vlog -vlog01compat -work work +incdir+C:/altera/13.0sp1/projects/2018011501eda2/ChargePhone1/showall {C:/altera/13.0sp1/projects/2018011501eda2/ChargePhone1/showall/showall_test.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L cycloneii_ver -L gate_work -L work -voptargs="+acc"  showall_test

add wave *
view structure
view signals
run -all
