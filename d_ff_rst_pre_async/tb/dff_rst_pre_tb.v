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


//              File Name : dff_rst_pre_tb.v
//              File Type: Verilog                                 
//              Creation Date : 05-10-2016
//              Last Modified : Tue 15 Nov 2016 11:35:15 AM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
module tb;
		reg data,clk,rst,pre;
		wire q;
		dff_rst_pre dut_insta(.data(data),.rst(rst),.pre(pre),.q(q),.clk(clk));
		initial
			begin
				clk=1'b0;
				forever #5 clk=~clk;
			end
		initial
			begin:test_cases_blk
				dff_rst_pre(1'b0,1'b0,1'b1);	//initially reset is low and preset also low then output will be.
				dff_rst_pre(1'b0,1'b0,1'b0);	//data is toggle 
				dff_rst_pre(1'b0,1'b0,1'b0);
				dff_rst_pre(1'b1,1'b0,1'b1);	//reset is high and preset also high then output will be.
				dff_rst_pre(1'b1,1'b1,1'b0);	//data is toggle
				dff_rst_pre(1'b1,1'b1,1'b0);
				dff_rst_pre(1'b1,1'b1,1'b0);
				dff_rst_pre(1'b1,1'b0,1'b0);	//preset is low data are toggle 
				dff_rst_pre(1'b1,1'b1,1'b1);	//preset is high
				dff_rst_pre(1'b1,1'b0,1'b0);	//preset is low and data is low
				dff_rst_pre(1'b1,1'b0,1'b1);
				dff_rst_pre(1'b1,1'b1,1'bx);	//reset ans preset are high but data is unknown state then output will be 
				dff_rst_pre(1'b1,1'b1,1'b0);	//suddenly data is low
				dff_rst_pre(1'b1,1'b1,1'b0);
				dff_rst_pre(1'b1,1'b0,1'b0);
				dff_rst_pre(1'b0,1'b0,1'bx);	//if reset is low and again data is unknown state
				dff_rst_pre(1'b0,1'b0,1'bx);	
				dff_rst_pre(1'b1,1'b0,1'b1);	//suddenly data is high then output will be.
				dff_rst_pre(1'b1,1'b0,1'bx);	//if reset is high and preset is low and data is unknown 
				dff_rst_pre(1'b1,1'b1,1'b0);	//if data toggle 
				dff_rst_pre(1'b1,1'b1,1'bx);	//both reset and preset are high and data is unknown
				repeat(5) dff_rst_pre(1'b0,1'b1,1'bx);	//repeat of five reset is low
				dff_rst_pre(1'b1,1'b1,1'bx);						//suddenly preset become high then what will be output
				repeat(5) dff_rst_pre(1'b1,1'b1,1'bx);	//repeat of five preset is high and data is unknown 
				dff_rst_pre(1'b0,1'b1,1'b1);	//if reset is low and preset is high then output will be.
				dff_rst_pre(1'b0,1'b1,1'b1);
				dff_rst_pre(1'b0,1'b1,1'b0);
				dff_rst_pre(1'b0,1'b1,1'b1);
				dff_rst_pre(1'b0,1'b1,1'bx);
				dff_rst_pre(1'b0,1'b1,1'bz);
				dff_rst_pre(1'b1,1'b1,1'b0);
				dff_rst_pre(1'b1,1'bx,1'b1);
				dff_rst_pre(1'b1,1'bx,1'b0);
				dff_rst_pre(1'b1,1'bz,1'b1);
				dff_rst_pre(1'b1,1'bz,1'b0);
				#20 $finish;
			end	//test_cases_blk
			task dff_rst_pre(task_rst,task_pre,task_data);
				begin:task_blk
				@(negedge clk);rst=task_rst; pre=task_pre;	data=task_data;
			end	//task_blk
		endtask
		initial
			begin:monitor_blk
				$monitor("%m time=%t,	clk=%b,	rst=%b,	pre=%b,	data=%b,	q=%b",$time,clk,rst,pre,data,q);
			end	//monitor_blk
endmodule


