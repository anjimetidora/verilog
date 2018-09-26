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


//              File Name : dff_reset_n_tb.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Tue 18 Oct 2016 05:18:14 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
//
//
//
module tb;
	reg data,clock,reset_n;
	wire q;
	dff_reset_n dut_insta(.data(data),.clock(clock),.q(q),.reset_n(reset_n));
	initial
		begin
			clock=1'b0;
			forever #5 clock=~clock;
		end
	initial
		begin:test_cases
			dff_reset(1'b0,1'b1);			//if reset is low with different input combinations,it reset the everything.
			dff_reset(1'b0,1'b0);
			dff_reset(1'b0,1'bx);
			dff_reset(1'b0,1'bz);
			dff_reset(1'b1,1'b1);			//if reset is high with different input combinations
			dff_reset(1'b1,1'b0);			
			dff_reset(1'b1,1'bz);
			dff_reset(1'b1,1'bx);
			dff_reset(1'b1,1'b1);
			dff_reset(1'b0,1'bx);			//after sometime if give reset is low,it reset the everything.
			dff_reset(1'b1,1'bz);			//if reset is high with different input combinations,to check for outputs
			dff_reset(1'b1,1'b1);			
			dff_reset(1'b1,1'b1);			
			dff_reset(1'b1,1'b0);
			dff_reset(1'b1,1'b0);
			dff_reset(1'b1,1'b1);
			dff_reset(1'b0,1'b1);			//after sometime reset become low,it reset the everything.
			dff_reset(1'b0,1'bz);
			dff_reset(1'b0,1'bx);
			dff_reset(1'b0,1'bx);
			dff_reset(1'b1,1'bz);			//suddenly reset will be high ,then it follows the inputs.
			dff_reset(1'b1,1'bx);
			#10 $finish;
		end	//test_cases
	task dff_reset(input reg rst,task_data);
		begin:task_rst
			@(negedge clock);	reset_n=rst;	data=task_data;
		end	//task_rst
	endtask
	initial
		begin:monitor_blk
			$monitor("%m time=%0t,	clock=%b,	reset_n=%b,	data=%b,	q=%b",$time,clock,reset_n,data,q);
		end	//monitor_blk
endmodule

