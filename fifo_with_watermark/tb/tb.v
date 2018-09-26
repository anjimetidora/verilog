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


//              File Name : tb.v
//              File Type: Verilog                                 
//              Creation Date : 10-11-2016
//              Last Modified : Fri 10 Nov 2017 09:14:50 PM IST

                             
//***************************************************************************//
//***************************************************************************//
                             

//              Author:
//              Reviewer:
//              Manager:
                             

//***************************************************************************//
//***************************************************************************//
//
//
	module tb;
	parameter W_WIDTH=8;
	parameter D_WIDTH=8;
	parameter P_WIDTH=4;
	reg clk,rst_n;
	reg push,pop;
	reg [W_WIDTH-1:0]in_data;
	reg [D_WIDTH-1:0]data_out;
	reg full,empty;
	reg almost_full,almost_empty;
	reg push_err_on_full,pop_err_on_empty;

	fifo_water_mark dut_insta(.clk(clk),.rst_n(rst_n),.push(push),.pop(pop),.in_data(in_data),.data_out(data_out),.full(full),.empty(empty),.almost_full(almost_full),.push_err_on_full(push_err_on_full),.almost_empty(almost_empty),.pop_err_on_empty(pop_err_on_empty));

	initial
		begin:clk_blk
			clk='b0;
			forever #5 clk=~clk;
		end	//clk_blk

	initial
		begin:test_cases
			reset_n('b0);
			reset_n('b1);
			push_pop('b1,'b0,$random);
			push_pop('b0,'b0,$random);
		//	push_pop('b0,'b1,'d8);
		//	push_pop('b0,'b1,'d8);
		//	push_pop('b0,'b1,'d8);
		//	push_pop('b0,'b1,'d8);
		//	push_pop('b1,'b0,'d1);
		//	push_pop('b1,'b0,'d2);
		//	push_pop('b1,'b0,'d3);
		//	push_pop('b1,'b0,'d4);
		//	push_pop('b1,'b0,'d5);
		//	push_pop('b1,'b0,'d6);
		//	push_pop('b1,'b0,'d7);
		//	push_pop('b0,'b1,'d8);
			#10 $finish; 
		end	//test_cases
			task reset_n(input task_reset);
				begin:task_rest
					@(negedge clk); rst_n=task_reset;
				end	//task_reset
			endtask	//end reset_task
			task push_pop (input task_push,task_pop,[W_WIDTH-1:0]task_in);
				begin:task_push_pop
					@(negedge clk); push=task_push; pop=task_pop; in_data=task_in;
				end	//task_push_pop
			endtask	//end push_pop_task

			initial
				begin:mon_blk
					$monitor("%m time=%0t, clk=%0b, rst_n=%0b, push=%0b, pop=%0b,full=%0b,empty=%0b,almost_full=%0b,push_err_on_full=%0b,almost_empty=%0b,pop_err_on_empty=%0b, in_data=%0d,data_out=%0d,w_ptr=%0d,r_ptr=%0d,mem=%0p",$time,clk,rst_n,push,pop,full,empty,almost_full,push_err_on_full,almost_empty,pop_err_on_empty,in_data,data_out,dut_insta.w_ptr,dut_insta.r_ptr,dut_insta.mem);
				end	//mon_blk

				/*always@(posedge clk)begin
				 for(integer i =0 ; i < 8;i = i+1)
					 $display("the value of mem[i] = %0d, i = %0d" , tb.dut_insta.mem[i],i);
			 end*/
	endmodule

