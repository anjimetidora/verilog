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


//              File Name : stack_tb.v
//              File Type: Verilog                                 
//              Creation Date : 20-10-2016
//              Last Modified : Fri 11 Nov 2016 06:41:06 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//

module tb;
	parameter W_WIDTH=8;
	parameter D_WIDTH=10;
	parameter P_WIDTH=4;
	reg reset_n;
	reg wr_data;
	reg clk;
	reg push,pop;
	reg [W_WIDTH-1:0]data_in,data_out;
	reg [W_WIDTH-1:0]mem[D_WIDTH-1:0];
	wire full,empty,push_err_on_full,pop_err_on_empty;
	
	stack dut_insta(.reset_n(reset_n),.wr_data(wr_data),.clk(clk),.push(push),.pop(pop),.data_in(data_in),.data_out(data_out),.push_err_on_full(push_err_on_full),.pop_err_on_empty(pop_err_on_empty),.full(full),.empty(empty));
	initial
		begin:clk_blk
			clk=1'b0;
			forever #5 clk=~clk;
		end	//clk_blk
	initial
		begin:test_case
			reset(1'b0);	//if reset is low,then reset the entire circuit is reset into 0.
			reset(1'b1);	//if reset is high,then it does't do reset.
			push_1(1'b1,'d1,'b0);	//if push is high and pop is low and  data is 1 then what happens.
			push_1(1'b1,'d2,'b0);		//push is high and pop is low and data is randomly changing upto 8 pushes.
			push_1(1'b1,'d3,'b0);
			push_1(1'b1,'d4,'b0);
			push_1(1'b1,'d5,'b0);
			push_1(1'b1,'d6,'b0);
			push_1(1'b1,'d7,'b0);
			push_1(1'b1,'d8,'b0);	//if do 8 pushes,then full flag is high.
			push_1(1'b1,'d9,'b0);	//if beyond 8 pushes, then happens push_err_on_full high.
			push_1(1'b0,'d10,'b0);
			pop_1(1'b1);						// 5 pops are given,then it pops the 5 last data_in.
			pop_1(1'b1);
			pop_1(1'b1);
			pop_1(1'b1);
			pop_1(1'b1);
			push_1(1'b1,'d6,'b1);	//if give push and pop as high,then it does't perform anything,it holds the previous value.
			push_1(1'b0,'d6,'b1);
			repeat (10)pop_1(1'b1);	//repeat the 10 pops.
			push_1(1'b1,'d1,'b0);
			push_1(1'b1,'d2,'b0);
			push_1(1'b1,'d3,'b0);
			push_1(1'b1,'d4,'b0);
			push_1(1'b0,'d4,'b1);
			pop_1(1'b1);
			pop_1(1'b1);
			reset(1'b0);	//again give the reset as low, then it reset the all flags and ptr.
			reset(1'b1);
			repeat (8)push_1(1'b1,'d9,'b0);
			push_1(1'b0,'d2,'b1);	//if give pop after some pushes.
			push_1(1'b1,'d3,'b0);
			push_1(1'b0,'d4,'b1);
	//		pop_1(1'b0);
			#10 $finish;
		end	//test_cases
	task reset(input task_reset);
		begin:reset_task_blk
			@(negedge clk);	reset_n=task_reset;
		end	//reset_task_blk
	endtask	//reset
	task push_1(input task_push,[W_WIDTH-1:0]task_data_in,task_pop);
		begin:push_task_blk
			@(negedge clk);	push=task_push;	data_in=task_data_in;	pop=task_pop;
		end	//push_task_blk
	endtask	//push
	task pop_1(input task_pop);
		begin:pop_task_blk
			@(negedge clk);	pop=task_pop;
		end	//pop_task_blk
	endtask		//pop
	initial
		begin:mon_blk
			$monitor("%m time=%0t, clk=%0b,	reset_n=%0b, push=%0b, pop=%0b, full=%0b, empty=%0b, push_err_on_full=%0b, pop_err_on_empty=%0b, data_in=%0d,data_out=%0d",$time,clk,reset_n,push,pop,full,empty,push_err_on_full,pop_err_on_empty,data_in,data_out);
		end	//mon_blk
endmodule
