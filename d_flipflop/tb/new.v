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


//              File Name : d_flipflop_tb.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Sat 19 Nov 2016 11:32:42 AM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module tb;
	reg d,clock;
	wire q;
	d_flipflop dut_inata(.d(d),.clock(clock),.q(q));
	initial
	 	begin
			clock=1'b0;
			forever	#5 clock=~clock;
		end
	initial
		begin 
			#60 $finish;
		end
	initial
		begin:test_cases				//different test cases
			dff(1'b1);	
			dff(1'b0);
			repeat(5) @(negedge clock);	//repeat 5 negedges of clock
			dff(1'b1);						//if continuously give input as high									
			dff(1'b1);									
			dff(1'b1);									
			dff(1'b1);									
			dff(1'b1);									
			dff(1'b1);									
			dff(1'bx);						//after some time input will be unknown state	
			dff(1'b1);	
			dff(1'bz);	
			repeat(5) dff(1'b0);	//repeat the input of low state
			dff(1'b1);	
		//	#60 $finish;
		end												//end test_cases
	task dff(input reg d_task);
		begin:task_test_cases
			@(negedge clock);d = d_task;
		end	//task_test_cases
	endtask
	initial
		begin:monitor_blk
			$monitor("%m time=%t,	clock=%b,	d=%b,	q=%b",$time,clock,d,q);
		end	//monitor_blk
endmodule

