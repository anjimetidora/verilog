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
//              Last Modified : Thu 27 Oct 2016 11:09:07 AM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
module tb;
parameter O_WIDTH=8;
	reg rst,en,clk;
	wire [O_WIDTH-1:0] count;
	counter dut_insta(.rst(rst),.en(en),.clk(clk),.count(count));
	initial
		begin
			clk=1'b0;
			forever #5 clk=~clk;
		end
	initial
		begin:test_cases
			counter_task(1'b0,1'b1);	//if reset is low and enable is high,it reset the every thing.
			counter_task(1'b1,1'b1);	//if reset and enable is high,it starts the up counting
			counter_task(1'b1,1'bx);	//if reset if high and enable is unknown,it holds the previous value
			counter_task(1'b1,1'b1);	//if reset if high and enable is high,it starts the counting
			counter_task(1'b1,1'b1);	
			counter_task(1'b1,1'b1);
			counter_task(1'b1,1'bz);	//if reset if high and enable is unknown,it holds the previous value
			counter_task(1'b1,1'bz);
			counter_task(1'b1,1'bz);
			counter_task(1'b1,1'bz);
			repeat(255)	counter_task(1'b1,1'b1);	//if repeat 255 times when reset and enable is high,it counts the upto 255. 
			counter_task(1'b1,1'b1);	//reset and enable is high ,it starts the up counting.
			counter_task(1'b1,1'b1);	
			counter_task(1'b1,1'b1);
			counter_task(1'b1,1'b0);	//reset is high and enable is low,it holds the previous value
			counter_task(1'b1,1'b0);
			counter_task(1'b1,1'b0);
			counter_task(1'b0,1'b1);	//reset is low and enable is high ,it will be reset.
			counter_task(1'b1,1'bx);	//reset is high and enable is unknown,it holds the previous value
			counter_task(1'b1,1'b1);	//if reset and enable is high ,it holds the previous value
			counter_task(1'b1,1'bz);	//reset is high and enable is low,it holds the previous value
			repeat(5)counter_task(1'b0,1'b1);//repeat the 5 times when reset is low and enable is high ,it reset 5 times.
			counter_task(1'b1,1'b1);	//if reset and enable are high ,it starts the counting.
			counter_task(1'b1,1'b1);	
			counter_task(1'b1,1'b1);
			counter_task(1'b0,1'b1);	//if reset is low ,it reset the everything
			counter_task(1'b1,1'b1);	//if reset and enable are high ,it starts the counting.
			counter_task(1'b1,1'b1);
			#3000 $finish;
		end	//test_cases
	task counter_task(input task_rst,task_en);
		begin:task_blk
			@(negedge clk);	rst=task_rst;	en=task_en;
		end	//task_blk
	endtask
	initial
		begin:monitor_blk
			$monitor("%m time=%0t, clk=%b,	rst=%b,	en=%b,	count=%d",$time,clk,rst,en,count);
		end	//monitor_blk
endmodule
