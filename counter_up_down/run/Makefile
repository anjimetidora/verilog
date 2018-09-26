clean:
	rm -fr work transcript *.wlf *.asdb* *.cfg *.log
veri:
	vlib work
	vlog -dbg -f flist
	vsim -c tb -do "run -all;quit" |tee sim.log

