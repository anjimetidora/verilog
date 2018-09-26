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


//              File Name : up_dn_counter_tb.v
//              File Type: Verilog                                 
//              Creation Date : 06-10-2016
//              Last Modified : Tue 15 Nov 2016 03:04:14 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
`define WIDTH 8
module tb;
	reg clk,rst_n,en,up_dn,load_n;
	reg [`WIDTH-1:0] data_in;
	wire [`WIDTH-1:0] data_out;
	up_down_counter dut_insta(.clk(clk),.rst_n(rst_n),.en(en),.data_in(data_in),.data_out(data_out),.load_n(load_n),.up_dn(up_dn));
	initial
		begin
			clk=1'b0;
			forever #5 clk=~clk;
		end
	initial
		begin
			counter_updn(1'b0,1'b1,1'b1,1'b0,'d0);		//if rst is low and en,updn are high and load,datain are low ,it reset the everything.
			counter_updn(1'b1,1'b1,1'b1,1'b1,'d0);	//if enable is high and updn is high ,it starts the upcounting.
			repeat(50)counter_updn(1'b1,1'b1,1'b1,1'b1,'d0);	//repeat the 50 times when updn is high ,it starts up counting.
			repeat(150)counter_updn(1'b1,1'b1,1'b0,1'b1,'d0);	//repeat the 150 times when updn is low ,it starts down counting
			counter_updn(1'b1,1'b1,1'b1,1'b0,'d200);					//if load is high and updn is high,it loads the value and up counting
			repeat(20)counter_updn(1'b1,1'b1,1'b1,1'b1,'d0);	//repeat 20 times ,it up counting upto 20 times
			counter_updn(1'b1,1'b1,1'b0,1'b1,'d100);					//if load is low ,it can't load the value
			counter_updn(1'b1,1'b1,1'b0,1'bx,'d100);					//if load is low ,it can't load the value
			counter_updn(1'b1,1'b1,1'b0,1'bz,'d100);					//if load is low ,it can't load the value
			repeat(20)counter_updn(1'b1,1'b1,1'b0,1'b1,'d0);	//repeat 20 times ,it down counting upto 20 times.
			counter_updn(1'b0,1'b1,1'b1,1'b1,'d0);						//if updn is high ,it starts up counting.
			repeat(20)counter_updn(1'b1,1'b1,1'b1,1'b1,'d0);	//repeat 20 times when updn is high,it up counting upto 20 times
			counter_updn(1'b1,1'bx,1'b1,1'b1,'d0);						//if enable is unknown ,it holds the previous value.
			counter_updn(1'b1,1'bx,1'b1,1'b0,'d9);						//even load is high but enable is high so ,it holds the previous value.
			counter_updn(1'b1,1'bx,1'b1,1'b1,'d6);
			counter_updn(1'b1,1'bx,1'b1,1'b1,'d0);
			counter_updn(1'b1,1'bx,1'b1,0'b1,'d0);						//even updown is low but enable is unknown so ,it holds the previous.
			counter_updn(1'b1,1'bx,1'b1,0'b1,'d1);
			counter_updn(1'b1,1'b1,1'b1,1'b1,'d8);						
			counter_updn(1'b1,1'b1,1'b1,1'bx,'d0);						
			counter_updn(1'b1,1'b1,1'b1,1'bx,'d2);						
			counter_updn(1'b1,1'b1,1'b1,1'bz,'d0);						
			counter_updn(1'b1,1'b1,1'b1,1'bz,'d7);						
			counter_updn(1'b1,1'b1,1'b1,1'b1,'d7);						
			#3000 $finish;
		end
	task counter_updn(input task_rst,task_enable,task_updn,task_load,[`WIDTH-1:0]task_datain);
		begin:task_blk
			@(negedge clk);rst_n=task_rst;en=task_enable;up_dn=task_updn;load_n=task_load;data_in=task_datain;
		end	//task_blk
	endtask
	initial
		begin
			$monitor("%m time=%0t,clk=%b, rst_n=%b, en=%b, data_in=%d, load_n=%d, up_dn=%b, data_out=%d,",$time,clk,rst_n,en,data_in,load_n,up_dn,data_out,);
		end
endmodule

