
clean :
	    rm -rf work *.cfg *.asdb* *.tmp *.log *.wlf *.awc transcript

veri:
	  vlib work
		vlog -f flist
		vsim -c tb -do "run -all;quit" -l sim.log

veri_gui:
	  vlib work
		vlog -f flist
		vsim -gui +r tb -do "wave -var dut_insta/* sim:/tb/*;run -all" -l sim_gui.log -wlf waveform.wlf
gui:
	  vlib work
		vlog -f flist
		vsim -gui work.tb -novopt -l sim_gui.log -wlf waveform.wlf
		
		
		
		
		
		#vsim -novopt work.tb -l sim_gui.log -wlf waveform.wlf


		
		
		

