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


//              File Name : dff_syn_presetset_tb.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Tue 25 Jul 2017 10:59:40 AM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
module tb;
	reg data,preset,clock;
	wire q;
	dff_sync_preset dut_insta(.data(data),.preset(preset),.q(q),.clock(clock));
	initial
		begin
			clock=1'b0;
		end
			always #5 clock=~clock;

	initial
		begin
			dff_preset(1'b0,1'b1);	//if preset is low ,then it follows the inputs 
			dff_preset(1'b0,1'b1);
			dff_preset(1'b0,1'b0);
			dff_preset(1'b1,1'b0);	//if suddenly preset is high and inputs are toggle,it preset the everything.
			dff_preset(1'b1,1'b1);
			dff_preset(1'b1,1'b0);
			dff_preset(1'b0,1'b1);	//if preset is low ,it follows the input
			dff_preset(1'b1,1'b0);	//again preset is high and input is toggle
			dff_preset(1'b0,1'b1);
			dff_preset(1'b0,1'b1);
			dff_preset(1'b1,1'bx);	//if preset is high,but inputs are unknown then output will be. 
			dff_preset(1'b1,1'bx);
			dff_preset(1'b1,1'b1);
			dff_preset(1'b0,1'b1);	//if preset is low.
			dff_preset(1'b0,1'b1);
			dff_preset(1'b1,1'bz);	//if preset is high and input is z state then output will be.	
			dff_preset(1'b1,1'bz);
			dff_preset(1'b1,1'b0);	//inputs are toggle
			dff_preset(1'b0,1'b0);
			dff_preset(1'b0,1'b1);
			dff_preset(1'bx,1'b0);
			dff_preset(1'bx,1'b1);
			dff_preset(1'bx,1'bx);
			dff_preset(1'bz,1'b1);
			dff_preset(1'bz,1'b0);
			dff_preset(1'bz,1'b1);
			dff_preset(1'b0,1'bx);
			dff_preset(1'b0,1'b1);
			dff_preset(1'b0,1'bz);
			dff_preset(1'b0,1'b0);
			#10 $finish;
		end
		task dff_preset(input task_preset,task_data);
			begin:task_blk
				@(negedge clock);	preset=task_preset;	data=task_data;
			end
		endtask
	initial
		begin
			$monitor("%m time=%t,	clock=%b,	preset=%b,	data=%b,	q=%b",$time,clock,preset,data,q);
			#300 $finish;
		end
endmodule







