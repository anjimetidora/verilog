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


//              File Name : dff_sync_reset.v
//              File Type: Verilog                                 
//              Creation Date : 06-10-2016
//              Last Modified : Mon 14 Nov 2016 05:23:57 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module tb;
	reg data,reset,clock;
	wire q;
	dff_sync_reset dut_insta(.data(data),.clock(clock),.reset(reset),.q(q));
	initial
		begin:clock_blk
			clock=1'b0;
			forever #5 clock=~clock;
			#100 $finish;
		end	//clock_blk
	initial
		begin:test_cases
			dff_sync(1'b0,1'b1);		//initially reset is low,it reset the everything.
			dff_sync(1'b1,1'b1);		//if reset is high ,and inputs are toggle,it follows the data
			dff_sync(1'b1,1'b1);		
			dff_sync(1'b1,1'bx);
			dff_sync(1'b1,1'b0);
			dff_sync(1'b0,1'b1);		//reset is low ,it holds the previous data
			dff_sync(1'b1,1'b1);		//if immediately reset is high,it can't reset
			dff_sync(1'b0,1'b0);		//again reset is low and inputs are toggle,it reset the everything
			dff_sync(1'b0,1'b1);
			dff_sync(1'b1,1'b1);	
			repeat(5) dff_sync(1'b0,1'b1);	//repeat of five reset is low and data is high,it repeat 5 times reseted data.
			dff_sync(1'b1,1'b0);		//suddenly reset give high and data is toggle,it follows the previous data.
			dff_sync(1'b1,1'b1);	
			dff_sync(1'b1,1'b0);	
			dff_sync(1'b1,1'b1);	
			dff_sync(1'b1,1'b0);	
			dff_sync(1'bx,1'b1);	
			dff_sync(1'b0,1'bx);	
			dff_sync(1'bz,1'b1);	
			dff_sync(1'b1,1'b0);	
			#10 $finish;
		end	//test_cases
	task dff_sync(input task_reset,task_data);
		begin:task_blk
			@(negedge clock);	reset=task_reset;	data=task_data;
		end	//task_blk
	endtask
	initial
		begin:monitor_blk
			$monitor("%m time=%t,	clock=%b,	reset=%b,	data=%b,	q=%b",$time,clock,reset,data,q);
		end	//monitor_blk
endmodule

