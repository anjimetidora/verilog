//***************************************************************************//
//***************************************************************************//
//***************************************************************************//
//**************                                          *******************//
//**************                                          *******************//
//**************      (c) SASIC Technologies Pvt Ltd      *******************//
//**************          (c) Verilogic Solutions         *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************           www.sasictek.com               *******************//
//**************          www.verilog-ic.com              *******************//
//**************                                          *******************//
//**************           Twitter:@sasictek              *******************//
//**************                                          *******************//
//**************                                          *******************//
//**************                                          *******************//
//***************************************************************************//
//***************************************************************************//


//              File Name :                                 
//              File Type: Verilog                                 
//              Creation Date : 06-10-2016
//              Last Modified : Tue 15 Nov 2016 02:18:27 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module tb;
parameter I_WIDTH=8,O_WIDTH=8;
	reg clk,reset_n,enable,load;
	reg [I_WIDTH-1:0]data_in;
	wire[O_WIDTH-1:0]data_out;
	wire cout;
	counter_load dut_insta(.clk(clk),.data_in(data_in),.data_out(data_out),.enable(enable),.reset_n(reset_n),.load(load),.cout(cout));
	initial
		begin
			clk=1'b0;
			forever #5 clk=~clk;
		end
	initial
		begin:test_cases
			counter_load(1'b1,1'b0,1'b0,'d0);	//if reset,enable,load,data_in are low,it is unknown state 
			counter_load(1'b0,1'b1,1'b0,'d0);	//if reset is low ,it reset the everything.
			counter_load(1'b1,1'b1,1'b0,'d0);	//if reset and enable are high state,it start the up counting.
			counter_load(1'b1,1'b1,1'b0,'d0);	//
			repeat(100)counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b1,1'b1,1'b1,'d200);	//if load high state and data_in is 200 ,it count from 200 only.
			counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b1,1'b1,1'b0,'d150);	//if load low state and data_in is 150,it can't load the value.it keep on counting
			counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b0,1'b1,1'b0,'d0);	//if reset is low ,it reset the everything.
			counter_load(1'b1,1'b1,1'b0,'d0);	//if enable is high ,it start the counting.
			counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b1,1'b1,1'b1,'d160);		//if load is high state and data_in 160,it starts counting from 160 only.
			counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b1,1'b1,1'b0,'d0);
			counter_load(1'b0,1'b1,1'b1,'d50);	//if reset is low and load high and data_in is 50,it can't load the value,it reseted.
			counter_load(1'b1,1'b1,1'b0,'d0);	
			counter_load(1'b0,1'b1,1'b0,'d0);		//if reset is low and enable is high ,it reset everything.
			counter_load(1'b0,1'b1,1'b0,'d0);
			counter_load(1'b1,1'bx,1'b0,'d0);		//if enable is unknown state ,it follows the previous value.
			counter_load(1'b1,1'bx,1'b0,'d0);
			counter_load(1'b1,1'bx,1'b0,'d0);
			counter_load(1'b1,1'bx,1'b1,'d140);	//if enable is unknown state and load is high ,it can't take data_in value,it follows previous value
			counter_load(1'b0,1'b1,1'b1,'d5); //if reset and enable is high ,it start counting.
			counter_load(1'b1,1'b1,1'b0,'d0);	
			counter_load(1'b1,1'b0,1'b0,'d0);	
			counter_load(1'b1,1'b0,1'b0,'d1);	
			counter_load(1'b1,1'b0,1'b0,'d5);	
			counter_load(1'b1,1'b1,1'b1,'d9);	
			counter_load(1'b1,1'bx,1'b0,'d0);	
			counter_load(1'b1,1'bx,1'b1,'d6);	
			counter_load(1'b1,1'b1,1'bx,'d0);	
			counter_load(1'b1,1'b1,1'bz,'d0);	
			counter_load(1'b1,1'b1,1'b0,'d0);	
			#3000 $finish;
		end	//test_cases
	task counter_load(input task_reset, task_enable,task_load,[I_WIDTH-1:0]task_datain);
		begin:task_blk
			@(negedge clk);	reset_n=task_reset;	enable=task_enable;	load=task_load;data_in=task_datain;
		end	//task_blk
	endtask
	initial
		begin:monitor_blk
			$monitor("%m time=%0t,	reset_n=%b,enable=%b,	load=%b,	data_in=%d,	data_out=%d,	cout=%b",$time,reset_n,enable,load,data_in,data_out,cout);
		end	//monitor_blk
endmodule

