
clean :
	    rm -rf work *.cfg *.asdb* *.tmp *.log

veri:
	  vlib work
		vlog  -f flist
		vsim -c tb -do "run -all;quit" -l sim.log

veri_gui:
	  vlib work
		vlog  -f flist
		vsim +access +r tb -do "wave -var dut_insta/* sim:/tb/*;run -all" -l sim_gui.log
